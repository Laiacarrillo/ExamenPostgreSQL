
-- Base de Datos MovieRental

-- Tipos de Datos
CREATE TYPE genero_pelicula AS ENUM ('Acción', 'Comedia', 'Drama', 'Terror', 'Ciencia Ficción', 'Romance');

-- Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT NOT NULL
);

-- Categorías
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Sucursales
CREATE TABLE sucursales (
    id_sucursal SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL
);

-- Películas
CREATE TABLE peliculas (
    id_pelicula SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    director VARCHAR(100),
    anio_lanzamiento INT CHECK (anio_lanzamiento >= 1900),
    precio_alquiler DECIMAL(6,2) NOT NULL CHECK (precio_alquiler > 0),
    disponibilidad BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT REFERENCES categorias(id_categoria)
);

-- Inventario (relación sucursal - películas)
CREATE TABLE inventario (
    id_inventario SERIAL PRIMARY KEY,
    id_pelicula INT REFERENCES peliculas(id_pelicula),
    id_sucursal INT REFERENCES sucursales(id_sucursal),
    cantidad INT NOT NULL CHECK (cantidad >= 0)
);

-- Alquileres
CREATE TABLE alquileres (
    id_alquiler SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_pelicula INT REFERENCES peliculas(id_pelicula),
    fecha_inicio DATE NOT NULL,
    fecha_devolucion DATE,
    costo_total DECIMAL(6,2) NOT NULL
);

-- Pagos
CREATE TABLE pagos (
    id_pago SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    fecha_pago DATE NOT NULL,
    monto DECIMAL(8,2) NOT NULL CHECK (monto > 0)
);
