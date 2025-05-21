
-- 1. Calcular los ingresos generados por cada sucursal en el último mes
SELECT s.nombre AS sucursal, SUM(a.costo_total) AS ingresos
FROM alquileres a
JOIN inventario i ON a.id_pelicula = i.id_pelicula
JOIN sucursales s ON i.id_sucursal = s.id_sucursal
WHERE a.fecha_inicio >= current_date - interval '1 month'
GROUP BY s.nombre;

-- 2. Consultar el cliente con el mayor monto total de pagos realizados
SELECT c.nombre, SUM(p.monto) AS total_pagado
FROM pagos p
JOIN clientes c ON p.id_cliente = c.id_cliente
GROUP BY c.nombre
ORDER BY total_pagado DESC
LIMIT 1;

-- 3. Obtener el porcentaje de películas alquiladas por género
SELECT cat.nombre AS genero, 
       ROUND(COUNT(a.id_pelicula) * 100.0 / (SELECT COUNT(*) FROM alquileres), 2) AS porcentaje
FROM alquileres a
JOIN peliculas p ON a.id_pelicula = p.id_pelicula
JOIN categorias cat ON p.id_categoria = cat.id_categoria
GROUP BY cat.nombre;

-- 4. Identificar las sucursales con mayor número de transacciones de alquiler
SELECT s.nombre AS sucursal, COUNT(a.id_alquiler) AS total_alquileres
FROM alquileres a
JOIN inventario i ON a.id_pelicula = i.id_pelicula
JOIN sucursales s ON i.id_sucursal = s.id_sucursal
GROUP BY s.nombre
ORDER BY total_alquileres DESC;

-- 5. Listar todas las películas disponibles para alquiler
SELECT p.titulo, c.nombre AS categoria, p.precio_alquiler
FROM peliculas p
JOIN categorias c ON p.id_categoria = c.id_categoria
WHERE p.disponibilidad = TRUE;

-- 6. Obtener el historial de alquileres de un cliente específico
SELECT c.nombre, p.titulo, a.fecha_inicio, a.fecha_devolucion
FROM alquileres a
JOIN clientes c ON a.id_cliente = c.id_cliente
JOIN peliculas p ON a.id_pelicula = p.id_pelicula
WHERE c.id_cliente = 1; -- Cambiar según el cliente deseado

-- 7. Consultar las películas con precios de alquiler superiores a un valor especificado
SELECT titulo, precio_alquiler
FROM peliculas
WHERE precio_alquiler > 12.00;

-- 8. Listar películas lanzadas en los últimos 5 años que están disponibles para alquiler
SELECT titulo, anio_lanzamiento, disponibilidad
FROM peliculas
WHERE anio_lanzamiento >= EXTRACT(YEAR FROM CURRENT_DATE) - 5 AND disponibilidad = TRUE;
