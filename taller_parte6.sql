-- PROCEDIMIENTOS ALMACENADOS

-- 1
-- Crear un procedimiento para actualizar el precio de todos los productos de un proveedor.
DELIMITER $$

CREATE PROCEDURE update_price_3(
  IN p_proveedor_id INT,
  IN p_nuevo_precio DECIMAL(10,2)
)
BEGIN
  DECLARE mensaje VARCHAR(80);

  UPDATE productos 
  SET precio = p_nuevo_precio
  WHERE proveedor_id = p_proveedor_id;

  IF ROW_COUNT() > 0 THEN
    SET mensaje = 'Registro actualizado correctamente';
  ELSE
    SET mensaje = 'Error al actualizar el precio';
  END IF;

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL update_price_3(2, 1231.75);

-- 2
-- Un procedimiento que devuelva la dirección de un cliente por ID.
DELIMITER $$

CREATE PROCEDURE direction_output(
  IN d_cliente_id INT,
  OUT d_direccion VARCHAR(80)
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  SELECT direccion INTO d_direccion
  FROM clientes_ubicacion
  WHERE cliente_id = d_cliente_id;

  IF ROW_COUNT() > 0 THEN
    SET mensaje = 'Registro sacado correctamente';
  ELSE
    SET mensaje = 'Error al sacar el registro';
  END IF;

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

-- hace que direccion sea una variable con el valor d_direccion que se pueda devolver con el select
CALL direction_output(2, @direccion);
SELECT @direccion AS Direccion;

-- 3
-- Crear un procedimiento que registre un pedido nuevo y sus detalles.
DELIMITER $$

CREATE PROCEDURE insert_new_product(
  IN p_proveedor_id INT,
  IN p_producto_tipo_id INT ,
  IN p_nombre VARCHAR(40),
  IN p_precio DECIMAL(10,2)
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  INSERT INTO productos (proveedor_id, producto_tipo_id, nombre, precio)
  VALUES (p_proveedor_id, p_producto_tipo_id, p_nombre, p_precio);

  IF ROW_COUNT() > 0 THEN 
    SET mensaje = "registro exitoso";
  ELSE 
    SET mensaje = "error al registrar";
  END IF;

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL insert_new_product(1, 1, 'lapiz', 32.00);

-- 4
-- Un procedimiento para calcular el total de ventas de un cliente.
DELIMITER $$

CREATE PROCEDURE calculate_ventas(
  IN p_cliente_id INT,
  OUT p_total DECIMAL(10,2) 
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  SELECT SUM(pd.cantidad * precio_unitario) 
  INTO p_total
  FROM pedidos AS p 
  INNER JOIN pedidos_detalle AS pd ON p.id = pd.pedido_id
  WHERE p.cliente_id = p_cliente_id;

  IF ROW_COUNT() > 0 THEN
    SET mensaje = 'Registro insertado correctamente';
  ELSE
    SET mensaje = 'Error al insertar el registro';
  END IF;

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL calculate_ventas(1, @total_cliente);
SELECT @total_cliente AS total_de_compras;

-- 5
-- Crear un procedimiento para obtener los empleados por puesto.
DELIMITER $$

CREATE PROCEDURE contar_empleados_puesto(
  IN e_puesto_id INT,
  OUT e_total INT 
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  SELECT COUNT(e.id)
  INTO e_total
  FROM empleados AS e
  WHERE e.puesto_id = e_puesto_id;

  IF ROW_COUNT() > 0 THEN
    SET mensaje = "calculo hecho con exito";
  ELSE
    SET mensaje = "error al calcular";
  END IF;

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL contar_empleados_puesto(1, @total_empleados);
SELECT @total_empleados AS total_empleados;

-- 6
-- Un procedimiento que actualice el salario de empleados por puesto.
DELIMITER $$

CREATE PROCEDURE actualizar_salario(
  IN e_puesto_id INT,
  IN e_nuevo_salario DECIMAL(10, 2)
) 
BEGIN 
  DECLARE mensaje VARCHAR(80);

  UPDATE empleados 
  SET salario = e_nuevo_salario
  WHERE puesto_id = e_puesto_id;

  IF ROW_COUNT() > 0 THEN 
    SET mensaje = "salario actualizado correctamente";
  ELSE 
    SET mensaje = "error al actualizar salario";
  END IF;

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL actualizar_salario(1, 2500.69); 

-- 7
-- Crear un procedimiento que liste los pedidos entre dos fechas.
DELIMITER $$

CREATE PROCEDURE listar_pedidos_1(
  IN p_fecha_1 DATE,
  IN p_fecha_2 DATE
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  SELECT * 
  FROM pedidos
  WHERE fecha BETWEEN p_fecha_1 AND p_fecha_2;

  SET mensaje = 'Listado de pedidos generado';
  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL listar_pedidos_1('2023-01-01','2025-01-01');

-- 8
-- Un procedimiento para aplicar un descuento a productos de una categoría.
DELIMITER $$

CREATE PROCEDURE descuento_7(
  IN d_porcentaje INT,
  IN d_id_producto_tipo INT,
  OUT d_total DECIMAL(10, 2)
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  SELECT SUM(precio * d_porcentaje / 100)
  INTO d_total
  FROM productos
  WHERE  producto_tipo_id = d_id_producto_tipo;

  IF d_total IS NOT NULL THEN
    SET mensaje = 'porcentaje calculado correctamente';
  ELSE
    SET mensaje = 'Error en el calculo';
  END IF;

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL descuento_7(25, 2, @total_descuento);
SELECT @total_descuento AS Descuento;

-- 9
-- Crear un procedimiento que liste todos los proveedores de un tipo de producto.
DELIMITER $$

CREATE PROCEDURE listar_proveedores_5(
  IN p_producto_tipo_id INT
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  SELECT DISTINCT pr.id AS proveedor_id, 
  pr.nombre AS proveedor_nombre,
  p.producto_tipo_id AS producto_tipo_id
  FROM productos AS p
  JOIN proveedores AS pr ON p.proveedor_id = pr.id
  WHERE p.producto_tipo_id = p_producto_tipo_id;

  SET mensaje = 'resultados listados';

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL listar_proveedores_5(1);

-- 10
-- Un procedimiento que devuelva el pedido de mayor valor.
DELIMITER $$

CREATE PROCEDURE pedido_mayor_3(
  OUT p_total DECIMAL(10, 2)
)
BEGIN 
  DECLARE mensaje VARCHAR(80);

  SELECT MAX(total)
  INTO p_total 
  FROM pedidos;

  SET mensaje = 'resultados listados';

  SELECT mensaje AS Mensaje;
END $$

DELIMITER ;

CALL pedido_mayor_3(@pedido_mayor);
SELECT @pedido_mayor AS pedido_mayor;
