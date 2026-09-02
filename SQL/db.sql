CREATE DATABASE techzone_db;
USE techzone_db;

-- tabla de proveedores
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

-- tabla de clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- tabla de productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0),
    id_proveedor INT NOT NULL,
    CONSTRAINT fk_producto_proveedor FOREIGN KEY (id_proveedor) 
        REFERENCES proveedores(id_proveedor) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- tabla de ventas (cabecera)
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMERIC(10, 2) NOT NULL CHECK (total >= 0),
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) 
        REFERENCES clientes(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- tabla de detalle de ventas (relacion muchos a muchos entre ventas y productos)
CREATE TABLE detalle_ventas (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10, 2) NOT NULL CHECK (precio_unitario > 0),
    subtotal NUMERIC(10, 2) NOT NULL CHECK (subtotal >= 0),
    CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta) 
        REFERENCES ventas(id_venta) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) 
        REFERENCES productos(id_producto) ON UPDATE CASCADE ON DELETE RESTRICT
);
