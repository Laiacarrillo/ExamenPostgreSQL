
-- Inserciones de Categorías
INSERT INTO categorias (nombre) VALUES 
('Acción'), ('Comedia'), ('Drama'), ('Terror'), ('Ciencia Ficción'), ('Romance');

-- Inserciones de Clientes
INSERT INTO clientes (nombre, email, telefono, direccion) VALUES
('Elena Vargas', 'elenavargas@example.com', '3101234567', 'Cra 50 #12-34'),
('Andrés Molina', 'andresmolina@example.com', '3112345678', 'Calle 89 #45-67'),
('Camila Suárez', 'camilasuarez@example.com', '3123456789', 'Av. 5 #67-89'),
('Pedro Mejía', 'pedromejia@example.com', '3134567890', 'Transv. 23 #45-90'),
('Valentina León', 'valentinaleon@example.com', '3145678901', 'Calle 10 #5-15'),
('Felipe Ramírez', 'feliperamirez@example.com', '3156789012', 'Av. Norte #78-90'),
('Natalia Quintero', 'nataliaquintero@example.com', '3167890123', 'Cra 9 #12-21'),
('Esteban Rojas', 'estebanrojas@example.com', '3178901234', 'Diagonal 55 #66-77'),
('Lucía Pardo', 'luciapardo@example.com', '3189012345', 'Calle 33 #88-99'),
('Mateo Gil', 'mateogil@example.com', '3190123456', 'Cra 20 #10-20');

-- Inserciones de Sucursales
INSERT INTO sucursales (nombre, direccion) VALUES
('Sucursal Central', 'Av. Caracas #123'),
('Sucursal Chapinero', 'Calle 60 #13-10'),
('Sucursal Suba', 'Calle 145 #104-12'),
('Sucursal Kennedy', 'Av. 1 de Mayo #32'),
('Sucursal Usaquén', 'Cra 7 #120-30');

-- Inserciones de Películas
INSERT INTO peliculas (titulo, director, anio_lanzamiento, precio_alquiler, disponibilidad, id_categoria) VALUES
('Mad Max: Fury Road', 'George Miller', 2015, 14.00, TRUE, 1),
('Deadpool', 'Tim Miller', 2016, 12.00, TRUE, 1),
('The Notebook', 'Nick Cassavetes', 2004, 9.00, TRUE, 6),
('Inside Out', 'Pete Docter', 2015, 8.00, TRUE, 2),
('A Quiet Place', 'John Krasinski', 2018, 10.00, TRUE, 4),
('Arrival', 'Denis Villeneuve', 2016, 13.00, TRUE, 5),
('The Godfather', 'Francis Ford Coppola', 1972, 11.00, TRUE, 3),
('Finding Nemo', 'Andrew Stanton', 2003, 7.00, TRUE, 2),
('Black Panther', 'Ryan Coogler', 2018, 15.00, TRUE, 1),
('The Shape of Water', 'Guillermo del Toro', 2017, 10.00, TRUE, 6),
('1917', 'Sam Mendes', 2019, 14.00, TRUE, 3),
('Get Out', 'Jordan Peele', 2017, 10.00, TRUE, 4),
('Tenet', 'Christopher Nolan', 2020, 13.00, TRUE, 5),
('Encanto', 'Byron Howard', 2021, 9.00, TRUE, 2),
('Roma', 'Alfonso Cuarón', 2018, 10.00, TRUE, 3);

-- Inserciones de Inventario
INSERT INTO inventario (id_pelicula, id_sucursal, cantidad) VALUES
(1, 1, 4), (2, 2, 5), (3, 3, 3), (4, 4, 6), (5, 5, 4),
(6, 1, 3), (7, 2, 6), (8, 3, 5), (9, 4, 4), (10, 5, 3),
(11, 1, 2), (12, 2, 3), (13, 3, 5), (14, 4, 4), (15, 5, 6);

-- Inserciones de Alquileres y Pagos
INSERT INTO alquileres (id_cliente, id_pelicula, fecha_inicio, fecha_devolucion, costo_total) VALUES
(1, 1, '2024-05-01', '2024-05-03', 14.00),
(2, 3, '2024-05-02', '2024-05-06', 9.00),
(3, 5, '2024-05-04', '2024-05-07', 10.00),
(4, 7, '2024-05-01', NULL, 11.00),
(5, 9, '2024-05-05', NULL, 15.00),
(6, 11, '2024-05-06', NULL, 14.00),
(7, 13, '2024-05-07', NULL, 13.00),
(8, 15, '2024-05-08', NULL, 10.00),
(9, 6, '2024-05-09', NULL, 13.00),
(10, 8, '2024-05-10', NULL, 7.00);

INSERT INTO pagos (id_cliente, fecha_pago, monto) VALUES
(1, '2024-05-01', 14.00), (2, '2024-05-02', 9.00),
(3, '2024-05-04', 10.00), (4, '2024-05-01', 11.00),
(5, '2024-05-05', 15.00), (6, '2024-05-06', 14.00),
(7, '2024-05-07', 13.00), (8, '2024-05-08', 10.00),
(9, '2024-05-09', 13.00), (10, '2024-05-10', 7.00);
