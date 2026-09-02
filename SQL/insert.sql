-- insercion de datos de prueba para techzone
-- al menos 15 registros por tabla

-- 1. proveedores (15 registros)
INSERT INTO proveedores (nombre, contacto, telefono, correo) VALUES
('proveedor1', 'Carlos Velasco', '5555-0101', 'proveedor1@gmail.com'),
('proveedor2', 'Allison Vargas', '5555-0202', 'proveedor2@gmail.com'),
('proveedor3', 'Sofia Arrivillaga', '5555-0303', 'proveedor3@gmail.com'),
('proveedor4', 'Selvin Lem', '5555-0404', 'proveedor4@gmail.com'),
('proveedor5', 'Jakelin Quino', '5555-0505', 'proveedor5@gmail.com'),
('proveedor6', 'Lucas Pajarito', '5555-0606', 'proveedor6@gmail.com'),
('proveedor7', 'Antonio Canux', '5555-0707', 'proveedor7@gmail.com'),
('proveedor8', 'Eduin Salas', '5555-0808', 'proveedor8@gmail.com'),
('proveedor9', 'Juan Mariño', '5555-0909', 'proveedor9@gmail.com'),
('proveedor10', 'Nathalie Rodriguez', '5555-1010', 'proveedor10@gmail.com'),
('proveedor11', 'Pablo Monzon', '5555-1111', 'proveedor11@gmail.com'),
('proveedor12', 'Daniel Aguilar', '5555-1212', 'proveedor12@gmail.gt'),
('proveedor13', 'Evelyn Barrios', '5555-1313', 'proveedor13@gmail.com'),
('proveedor14', 'Angela de la Cruz', '5555-1414', 'proveedor14@gmail.com'),
('proveedor15', 'Lilian Perdomo', '5555-1515', 'proveedor15@gmail.com');


-- 2. clientes (16 registros)
INSERT INTO clientes (nombre, correo, telefono, fecha_registro) VALUES
('Juan', 'juan@gmail.com', '4111-2222', '2025-10-10 10:00:00'),
('Maria', 'maria@gmail.com', '4222-3333', '2025-11-15 11:30:00'),
('Carlos', 'carlos@gmail.com', '4333-4444', '2026-01-05 14:20:00'),
('Ana', 'ana@gmail.com', '4444-5555', '2026-02-10 09:15:00'),
('Luis', 'luis@gmail.com', '4555-6666', '2026-03-01 16:40:00'),
('Elena', 'elena@gmail.com', '4666-7777', '2026-03-12 12:00:00'),
('Jorge', 'jorge@gmail.com', '4777-8888', '2026-04-02 15:10:00'),
('Sofia', 'sofia@gmail.com', '4888-9999', '2026-04-20 08:45:00'),
('Miguel', 'miguel@gmail.com', '4999-0000', '2026-05-05 13:25:00'),
('Lucia', 'lucia@gmail.com', '5111-1111', '2026-05-18 10:50:00'),
('David', 'david@gmail.com', '5222-2222', '2025-01-10 09:00:00'),
('Carmen', 'carmen@gmail.com', '5333-3333', '2025-02-14 11:00:00'),
('Fernando', 'fernando@gmail.com', '5444-4444', '2025-03-20 14:00:00'),
('Patricia', 'patricia@gmail.com', '5555-5555', '2025-04-15 16:00:00'),
('Roberto', 'roberto@gmail.com', '5666-6666', '2025-05-10 10:30:00'),
('Claudia', 'claudia@gmail.com', '5777-7777', '2026-06-01 12:15:00');


-- 3. productos (16 registros)
INSERT INTO productos (nombre, categoria, precio, stock, id_proveedor) VALUES
('laptop HP', 'laptops', 750.00, 12, 1),
('laptop Lenovo', 'laptops', 600.00, 3, 2),
('macbook Air', 'laptops', 999.99, 5, 3),
('celular Samsung', 'telefonos', 850.00, 8, 4),
('celular Xiaomi', 'telefonos', 250.00, 2, 5),
('iPhone 14 pro', 'telefonos', 1100.00, 4, 6),
('monitor gamer', 'monitores', 220.00, 15, 7),
('monitor LG', 'monitores', 300.00, 4, 8),
('teclado mecanico', 'accesorios', 65.00, 25, 9),
('mouse inalambrico', 'accesorios', 35.00, 30, 10),
('audifonos gamer', 'accesorios', 50.00, 2, 11),
('tarjeta grafica', 'componentes', 380.00, 6, 12),
('procesador intel core i9', 'componentes', 320.00, 10, 13),
('memoria RAM 16GB', 'componentes', 55.00, 18, 14),
('disco duro SSD 1TB', 'componentes', 85.00, 14, 15),
('impresora HP', 'impresoras', 180.00, 3, 1);


-- 4. ventas (16 registros)
INSERT INTO ventas (id_cliente, fecha_venta, total) VALUES
(1, '2026-06-10 10:30:00', 815.00),
(2, '2026-06-12 14:15:00', 999.99),
(3, '2026-06-15 09:45:00', 1100.00),
(4, '2026-06-18 16:20:00', 285.00),
(5, '2026-06-20 11:10:00', 380.00),
(6, '2026-06-22 13:50:00', 320.00),
(7, '2026-06-25 15:30:00', 140.00),
(8, '2026-06-28 10:00:00', 850.00),
(9, '2026-07-02 12:30:00', 750.00),
(10, '2026-07-05 16:00:00', 600.00),
(1, '2026-07-10 11:20:00', 250.00),
(2, '2026-07-15 14:40:00', 300.00),
(3, '2026-07-20 09:15:00', 105.00),
(4, '2026-07-25 17:00:00', 55.00),
(5, '2026-08-01 10:10:00', 180.00),
(6, '2026-08-05 13:20:00', 999.99);


-- 5. detalle_ventas (16 registros)
INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 750.00, 750.00),
(1, 10, 1, 35.00, 35.00),
(2, 3, 1, 999.99, 999.99),
(3, 6, 1, 1100.00, 1100.00),
(4, 7, 1, 220.00, 220.00),
(4, 10, 1, 35.00, 35.00),
(5, 12, 1, 380.00, 380.00),
(6, 13, 1, 320.00, 320.00),
(7, 9, 2, 65.00, 130.00),
(8, 4, 1, 850.00, 850.00),
(9, 1, 1, 750.00, 750.00),
(10, 2, 1, 600.00, 600.00),
(11, 5, 1, 250.00, 250.00),
(12, 8, 1, 300.00, 300.00),
(13, 9, 1, 65.00, 65.00),
(13, 10, 1, 35.00, 35.00);
