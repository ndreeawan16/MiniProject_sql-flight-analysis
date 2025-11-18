-- cek database
select current_database();

-- Masukan data maskapai
insert  into airline (airline_name, iata_code) values
('Garuda Indonesia', 'GA'),
('Lion Air', 'JT'),
('AirAsia Indonesia', 'QZ'),
('Citilink', 'QG'),
('Batik Air', 'ID'),
('Super Air Jet', 'IU'),
('Sriwijaya Air', 'SJ');

-- Masukan data bandara
insert into airport (airport_name, city, state, iata_code) values
('Soekarno-Hatta International Airport', 'Jakarta', 'Banten', 'CGK'),
('Ngurah Rai International Airport', 'Denpasar', 'Bali', 'DPS'),
('Juanda International Airport', 'Surabaya', 'Jawa Timur', 'SUB'),
('Kualanamu International Airport', 'Medan', 'Sumatera Utara', 'KNO'),
('Sultan Hasanuddin International Airport', 'Makassar', 'Sulawesi Selatan', 'UPG'),
('Minangkabau International Airport', 'Padang', 'Sumatera Barat', 'PDG'),
('Adisutjipto International Airport', 'Yogyakarta', 'DI Yogyakarta', 'JOG');

-- Masukan data penerbangan
insert into flight (airline_id, origin_airport, dest_airport, flight_date, dep_delay, arr_delay, cancelled, weather_delay, late_aircraft_delay)
values
(1, 1, 2, '2025-11-01', 5, 10, FALSE, 0, 5),
(1, 1, 3, '2025-11-02', 10, 15, FALSE, 0, 10),
(1, 2, 4, '2025-11-03', 0, -5, FALSE, 0, 0),
(1, 3, 5, '2025-11-04', 20, 25, FALSE, 5, 10),
(1, 4, 6, '2025-11-05', 45, 50, TRUE, 25, 15),
(2, 2, 3, '2025-11-06', 15, 10, FALSE, 0, 5),
(2, 2, 5, '2025-11-07', 30, 35, FALSE, 10, 15),
(2, 3, 6, '2025-11-08', 0, 0, FALSE, 0, 0),
(2, 4, 1, '2025-11-09', 25, 30, TRUE, 15, 10),
(2, 5, 7, '2025-11-10', 10, 15, FALSE, 0, 5),
(3, 3, 1, '2025-11-11', 5, 10, FALSE, 0, 5),
(3, 3, 2, '2025-11-12', 50, 60, TRUE, 30, 20),
(3, 4, 5, '2025-11-13', 15, 20, FALSE, 5, 5),
(3, 5, 6, '2025-11-14', 0, -10, FALSE, 0, 0),
(3, 6, 7, '2025-11-15', 40, 45, FALSE, 15, 15),
(4, 4, 2, '2025-11-16', 25, 30, FALSE, 5, 10),
(4, 5, 3, '2025-11-17', 0, 5, FALSE, 0, 5),
(4, 6, 1, '2025-11-18', 60, 70, TRUE, 35, 20),
(4, 7, 5, '2025-11-19', 15, 20, FALSE, 0, 10),
(4, 1, 4, '2025-11-20', 5, 10, FALSE, 0, 5),
(5, 5, 6, '2025-11-21', 10, 15, FALSE, 0, 5),
(5, 6, 7, '2025-11-22', 0, 0, FALSE, 0, 0),
(5, 7, 1, '2025-11-23', 25, 30, TRUE, 10, 15),
(5, 1, 2, '2025-11-24', 5, 10, FALSE, 0, 5),
(5, 2, 3, '2025-11-25', 20, 25, FALSE, 5, 10),
(6, 6, 3, '2025-11-26', 15, 20, FALSE, 0, 10),
(6, 7, 4, '2025-11-27', 35, 40, TRUE, 20, 15),
(6, 1, 5, '2025-11-28', 10, 10, FALSE, 0, 10),
(6, 2, 6, '2025-11-29', 0, -5, FALSE, 0, 0),
(6, 3, 7, '2025-11-30', 5, 5, FALSE, 0, 5),
(7, 7, 2, '2025-12-01', 10, 15, FALSE, 0, 5),
(7, 1, 3, '2025-12-02', 20, 25, FALSE, 5, 10),
(7, 2, 4, '2025-12-03', 0, 0, FALSE, 0, 0),
(7, 3, 5, '2025-12-04', 40, 45, TRUE, 25, 15),
(7, 4, 6, '2025-12-05', 10, 10, FALSE, 0, 10),
(7, 5, 7, '2025-12-06', 5, 0, FALSE, 0, 0),
(7, 6, 1, '2025-12-07', 50, 55, TRUE, 30, 20),
(7, 7, 3, '2025-12-08', 15, 20, FALSE, 5, 10),
(7, 1, 5, '2025-12-09', 0, -5, FALSE, 0, 0),
(7, 2, 6, '2025-12-10', 25, 30, FALSE, 10, 10);
