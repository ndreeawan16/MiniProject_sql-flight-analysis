-- Cek koneksi pada database
SELECT current_database();

--Buat tabel maskapai
create table if not exists public.airline (
airline_id serial primary key,
airline_name varchar(100),
iata_code varchar(5)
);

-- Buat tabel bandara
create table if not exists public.airport (
airport_id serial primary key,
airport_name varchar(100),
city varchar(50),
state varchar(50),
iata_code varchar(50)
);

-- Buat tabel penerbangan
create table if not exists public.flight (
    flight_id serial primary key,
    airline_id int references airline(airline_id),
    origin_airport int references airport(airport_id),
    dest_airport int references airport(airport_id),
    flight_date date,
    dep_delay int,
    arr_delay int,
    cancelled BOOLEAN default false,
    weather_delay int,
    late_aircraft_delay int
);
