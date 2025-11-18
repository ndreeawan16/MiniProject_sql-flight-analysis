-- Periksa nama kolom dari masing" database
select table_name, column_name, data_type
from information_schema.columns
where table_schema = 'public'
order by  table_name, ordinal_position;

-- Cek isi setiap data
select * from airline
order by airline.airline_id ;

select * from airport
order by airport.airport_id ;

select * from flight
order by flight.flight_id ;


-- Cek total penerbangan setiap maskapai
select a.airline_name, count(*) as total_flight
from flight f 
join airline a on f.airline_id = a.airline_id 
group by a.airline_name 
order by total_flight desc;

-- ================= ANALISIS KETERLAMBATAN vs PEMBATALAN MASKAPAI ================= --

with flight_stats as (
    select
        a.airline_name,
        f.cancelled,
        count(*) as total_flight,
        avg(f.arr_delay) as avg_arr_delay,
        avg(f.dep_delay) as avg_dep_delay,
        avg(f.weather_delay) as avg_weather_delay,
        avg(f.late_aircraft_delay) as avg_late_aircraft_delay,
        sum(f.arr_delay) as total_arr_delay,
        sum(f.dep_delay) as total_dep_delay,
        sum(f.weather_delay) as total_weather_delay,
        sum(f.late_aircraft_delay) as total_late_aircraft_delay,
        sum(case when f.arr_delay <= 0 then 1 else 0 end) as on_time_count,
        sum(case when f.arr_delay > 30 then 1 else 0 end) as delay_over_30_count
    from flight f
    join airline a on f.airline_id = a.airline_id
    group by a.airline_name, f.cancelled
)
select
    airline_name,
    cancelled,
    total_flight,
    round(avg_arr_delay,0) as avg_arrival_delay,
    round(avg_dep_delay,0) as avg_departure_delay,
    round(avg_weather_delay,0) as avg_weather_delay,
    round(avg_late_aircraft_delay,0) as avg_late_aircraft_delay,
    total_arr_delay,
    total_dep_delay,
    total_weather_delay,
    total_late_aircraft_delay,
    round(100.0 * on_time_count / total_flight,2) as percentage_on_time,
    round(100.0 * delay_over_30_count / total_flight,2) as percentage_delay_over_30
from flight_stats
order by airline_name, cancelled;

-- ================= ANALISIS KETERLAMBATAN vs PEMBATALAN BANDARA ================= --

WITH flight_status AS (
    SELECT
        org.airport_name AS origin_airport,
        d.airport_name AS destination_airport,
        f.cancelled,
        COUNT(*) AS total_flight,
        -- rata-rata delay
        AVG(f.arr_delay) AS avg_arr_delay,
        AVG(f.dep_delay) AS avg_dep_delay,
        AVG(f.weather_delay) AS avg_weather_delay,
        AVG(f.late_aircraft_delay) AS avg_late_aircraft_delay,
        -- total delay
        SUM(f.arr_delay) AS total_arr_delay,
        SUM(f.dep_delay) AS total_dep_delay,
        SUM(f.weather_delay) AS total_weather_delay,
        SUM(f.late_aircraft_delay) AS total_late_aircraft_delay,
        -- on time + >30
        SUM(CASE WHEN f.arr_delay <= 0 THEN 1 ELSE 0 END) AS on_time_count,
        SUM(CASE WHEN f.arr_delay > 30 THEN 1 ELSE 0 END) AS delay_over_30_count
    FROM flight f
    JOIN airport org ON f.origin_airport = org.airport_id
    JOIN airport d ON f.dest_airport = d.airport_id
    GROUP BY org.airport_name, d.airport_name, f.cancelled
)
SELECT
    origin_airport,
    destination_airport,
    cancelled,
    total_flight,
    ROUND(avg_arr_delay, 0) AS avg_arrival_delay,
    ROUND(avg_dep_delay, 0) AS avg_departure_delay,
    ROUND(avg_weather_delay, 0) AS avg_weather_delay,
    ROUND(avg_late_aircraft_delay, 0) AS avg_late_aircraft_delay,
    total_arr_delay,
    total_dep_delay,
    total_weather_delay,
    total_late_aircraft_delay,
    -- operational delay = arr - weather - late aircraft
    ROUND( avg_arr_delay - avg_weather_delay - avg_late_aircraft_delay, 2) AS avg_operational_delay,
    ROUND(100.0 * on_time_count / total_flight, 2) AS percentage_on_time,
    ROUND(100.0 * delay_over_30_count / total_flight, 2) AS percentage_delay_over_30
FROM flight_status
ORDER BY origin_airport, destination_airport, cancelled;