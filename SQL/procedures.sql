-- procedimiento almacenado para registrar una venta
-- valida la existencia del cliente y el stock suficiente antes de procesar

CREATE OR REPLACE PROCEDURE registrar_venta(
    p_id_cliente INT,
    p_id_producto INT,
    p_cantidad INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_stock_actual INT;
    v_precio_unitario NUMERIC(10,2);
    v_subtotal NUMERIC(10,2);
    v_id_venta INT;
    v_cliente_existe INT;
BEGIN

    -- validar que el cliente exista
    SELECT COUNT(*) INTO v_cliente_existe 
    FROM clientes 
    WHERE id_cliente = p_id_cliente;

    IF v_cliente_existe = 0 THEN
        RAISE NOTICE 'El cliente con ID % no existe', p_id_cliente;
    END IF;

    -- obtener stock y precio unitario del producto
    SELECT stock, precio INTO v_stock_actual, v_precio_unitario
    FROM productos
    WHERE id_producto = p_id_producto;

    IF NOT FOUND THEN
        RAISE NOTICE 'El producto con ID % no existe', p_id_producto;
    END IF;

    -- verificar si hay stock suficiente
    IF v_stock_actual < p_cantidad THEN
        RAISE NOTICE 'Stock insuficiente. Stock actual: %, Cantidad solicitada: %', v_stock_actual, p_cantidad;
    END IF;

    -- calcular subtotal
    v_subtotal := p_cantidad * v_precio_unitario;

    -- insertar la venta principal
    INSERT INTO ventas (id_cliente, fecha_venta, total)
    VALUES (p_id_cliente, CURRENT_TIMESTAMP, v_subtotal)
    RETURNING id_venta INTO v_id_venta;

    -- insertar el detalle de la venta
    INSERT INTO detalle_ventas (id_venta, id_producto, cantidad, precio_unitario, subtotal)
    VALUES (v_id_venta, p_id_producto, p_cantidad, v_precio_unitario, v_subtotal);

    -- actualizar el inventario descontando el stock vendido
    UPDATE productos
    SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto;

    RAISE NOTICE 'Venta registrada exitosamente con ID %', v_id_venta;
END;
$$;