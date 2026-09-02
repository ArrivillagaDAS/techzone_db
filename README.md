# Sistema de Gestion de Inventario y Ventas - TechZone

## Descripcion del Proyecto
TechZone es una tienda dedicada a la venta de productos tecnologicos. Este proyecto implementa una base de datos en PostgreSQL diseñada para optimizar el control de inventario, el registro de ventas, la administracion de proveedores y el seguimiento de clientes, garantizando la integridad de los datos y la automatizacion de procesos mediante transacciones seguras.

## Estructura del Repositorio
- `modelo_er.png`: Diagrama Entidad-Relacion normalizado hasta la tercera forma normal (3FN).
- `db.sql`: Script de creación de la base de datos y tablas.
- `insert.sql`: Script para insertar datos de prueba en la base de datos.
- `queries.sql`: Conjunto de consultas avanzadas para análisis de datos.
- `procedure.sql`: Procedimiento almacenado para gestionar ventas.
- `README.md`: Documentación del proyecto y guía de uso.

## Instrucciones para Importar y Ejecutar en PostgreSQL

1. **Crear la Base de Datos:**
   Abra su terminal o herramienta de PostgreSQL (como pgAdmin o psql) y cree una nueva base de datos:
   ```sql
   CREATE DATABASE techzone_db;
   ```

2. **Ejecutar los Scripts en Orden:**
   Conectese a la base de datos `techzone_db` y ejecute los archivos en el siguiente orden para asegurar que las dependencias y relaciones funcionen correctamente:
   - `db.sql` (Crea las tablas y restricciones)
   - `insert.sql` (Inserta los datos de prueba)
   - `queries.sql` (Ejecuta las consultas de analisis)
   - `procedure.sql` (Crea el procedimiento almacenado)

## Ejemplo de Uso del Procedimiento Almacenado

Para registrar una venta utilizando el procedimiento almacenado con validacion de stock y transacciones, ejecute la siguiente sentencia en PostgreSQL:

```sql
CALL registrar_venta(1, 2, 1);
```
* Parametro 1: ID del cliente (`1`).
* Parametro 2: ID del producto (`2` - Laptop Lenovo).
* Parametro 3: Cantidad a comprar (`1`).

Si el stock es suficiente, la venta se procesara y se descontara automaticamente del inventario. Si no hay stock suficiente, el sistema cancelara la insercion y enviara un aviso, al igual si el id del cliente no existe, enviara un aviso.





by - Angela Sofia de la Cruz Arrivillaga