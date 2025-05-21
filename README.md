
# MovieRental - Sistema de Gestión de Alquiler de Películas - Laia Carrillo

## Descripción General

Este proyecto consiste en el diseño e implementación de una base de datos en PostgreSQL para una tienda de alquiler de películas. El sistema permite gestionar información sobre clientes, películas, alquileres, pagos, categorías y sucursales. También se incluyen consultas para análisis de datos y un procedimiento almacenado con control transaccional.

## Estructura del Proyecto

- **db.sql**: Script de creación de tablas, tipos y restricciones de integridad.
- **insert.sql** / **insert_v2.sql**: Inserción de datos representativos para poblar la base de datos.
- **consultas.sql**: Consultas SQL para extraer información clave y realizar análisis.
- **transaccion.sql**: Procedimiento almacenado `registrar_pago()` con control de errores y validaciones.

## Requisitos

- PostgreSQL instalado (v13 o superior recomendada)
- pgAdmin o terminal psql

## Instrucciones de Ejecución

1. Crear una base de datos llamada `movierental`:
   ```sql
   CREATE DATABASE movierental;
   ```

2. Conectarse a la base de datos:
   ```sql
   \c movierental
   ```

3. Ejecutar el script de creación de tablas:
   ```sql
   \i db.sql
   ```

4. Insertar los datos de prueba:
   ```sql
   \i insert.sql
   ```

   *(o usar `insert_v2.sql` para una versión alternativa)*

5. Ejecutar las consultas del sistema:
   ```sql
   \i consultas.sql
   ```

6. Crear el procedimiento con transacción:
   ```sql
   \i transaccion.sql
   ```

## Consultas Incluidas

- Ingresos por sucursal en el último mes
- Cliente con mayor monto pagado
- Porcentaje de alquileres por género
- Sucursales con mayor cantidad de alquileres
- Películas disponibles para alquiler
- Historial de alquileres de un cliente específico
- Películas con precio superior a un valor
- Películas disponibles de los últimos 5 años

## Procedimiento Almacenado

`registrar_pago(p_id_cliente INT, p_monto DECIMAL)`  
Este procedimiento:

- Verifica si el cliente existe.
- Valida que el monto sea positivo.
- Inserta el registro en la tabla de pagos.
- Si ocurre algún error, se lanza una excepción y se revierte la operación.

## Estado de Normalización

La base de datos fue diseñada cumpliendo con la **Tercera Forma Normal (3FN)** para garantizar integridad, minimizar redundancia y mejorar la eficiencia en las operaciones.

## Autor

Este proyecto fue desarrollado por **Laia Carrillo** como parte de un examen práctico de base de datos PostgreSQL.
