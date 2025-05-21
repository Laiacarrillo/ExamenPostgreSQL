
-- Procedimiento almacenado para registrar un pago con validación y transacción

CREATE OR REPLACE FUNCTION registrar_pago(p_id_cliente INT, p_monto DECIMAL)
RETURNS VOID AS $$
DECLARE
    cliente_existe BOOLEAN;
BEGIN
    -- Validar que el monto sea positivo
    IF p_monto <= 0 THEN
        RAISE EXCEPTION 'El monto del pago debe ser positivo.';
    END IF;

    -- Verificar existencia del cliente
    SELECT EXISTS (SELECT 1 FROM clientes WHERE id_cliente = p_id_cliente) INTO cliente_existe;

    IF NOT cliente_existe THEN
        RAISE EXCEPTION 'El cliente con ID % no existe.', p_id_cliente;
    END IF;

    -- Iniciar transacción manual (implícita en función)
    INSERT INTO pagos (id_cliente, fecha_pago, monto)
    VALUES (p_id_cliente, CURRENT_DATE, p_monto);

    -- Commit implícito si no hay errores
END;
$$ LANGUAGE plpgsql;
