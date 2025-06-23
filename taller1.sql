-- 1
SELECT 
  pedidos.id AS pedido_id,
  pedidos.fecha,
  pedidos.total,
  pedidos.descripcion,
  clientes.id AS cliente_id,
  clientes.nombre, 
  clientes.apellidos
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id;

-- 2
SELECT productos.id AS id_producto,
  productos.nombre,
  proveedores.id as id_proveedor,
  proveedores.nombre
FROM productos INNER JOIN proveedores ON productos.proveedor_id = proveedores.id;

-- 3
SELECT 
  pedidos.id AS id_pedido,
  pedidos.fecha,
  pedidos.total,
  clientes.nombre AS nombre_cliente,
  clientes_ubicacion.direccion,
  clientes_ubicacion.codigo_postal
FROM pedidos
LEFT JOIN clientes ON pedidos.cliente_id = clientes.id
LEFT JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id;

-- 4
-- esto para agregar una foreign key a pedidos y empleados y asi, poder relacionarlas
ALTER TABLE pedidos
ADD COLUMN empleado_id INT,
ADD CONSTRAINT fk_empleado_id_pedidos FOREIGN KEY (empleado_id) REFERENCES empleados(id);

-- insertar datos a pedidos para que un empleado registre un pedido 
INSERT INTO pedidos (cliente_id, fecha, total, descripcion, empleado_id)
VALUES (1, '2025-06-21', 300.00, 'Primer pedido de prueba', 1);

-- comando de la consulta 
SELECT 
  empleados.id AS id_empleado,
  empleados.nombre,
  pedidos.id AS id_pedido,
  pedidos.fecha,
  pedidos.total
FROM empleados 
LEFT JOIN pedidos ON pedidos.empleado_id = empleados.id;

-- 5
SELECT 
  producto_tipo.id AS id_tipo,
  producto_tipo.nombre_tipo,
  productos.id AS id_producto,
  productos.nombre,
  productos.precio 
FROM producto_tipo
INNER JOIN productos ON productos.producto_tipo_id = producto_tipo.id;

-- 6
-- group devuelve el numero de filas de un criterio
-- se usa left join para que aparezcan tambien los clientes con o sin pedidos
-- este comando se usa de esta forma ya que de otra me hubiera dado el error 'sql_mode=only_full_group_by'
SELECT 
  clientes.id AS cliente_id,
  clientes.nombre,
  clientes.apellidos,
COUNT(pedidos.id) AS total_pedidos
FROM clientes
LEFT JOIN pedidos ON pedidos.cliente_id = clientes.id
GROUP BY clientes.id, clientes.nombre, clientes.apellidos;

-- 7
SELECT 
  pedidos.id AS id_pedido,
  pedidos.fecha,
  pedidos.total,
  empleados.nombre
FROM pedidos 
INNER JOIN empleados ON empleados.id = pedidos.empleado_id;

-- 8
SELECT
  productos.id AS id_producto,
  productos.nombre,
  productos.precio,
  pedidos_detalle.producto_id,
  pedidos_detalle.pedido_id
FROM pedidos_detalle
RIGHT JOIN productos ON pedidos_detalle.producto_id = productos.id
WHERE pedidos_detalle.producto_id IS NULL;

-- 9
-- en este caso muestra un resultado por cada pedido para simplificar el procedimiento de la consula
SELECT 
  pedidos.id AS id_pedido,
  pedidos.fecha,
  pedidos.total,
  clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,
  clientes_ubicacion.direccion,
  ciudades.ciudad_name,
  estados.estado_name,
  paises.pais_name
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
INNER JOIN clientes_ubicacion ON clientes_ubicacion.cliente_id = clientes.id
INNER JOIN ciudades ON ciudades.id = clientes_ubicacion.ciudad_id
INNER JOIN estados ON estados.id = ciudades.estado_id
INNER JOIN paises ON paises.id = estados.pais_id;

-- 10
SELECT 
  productos.id AS id_producto,
  productos.nombre,
  productos.precio,
  proveedores.id AS id_proveedor,
  proveedores.nombre, 
  proveedores.direccion,
  producto_tipo.nombre_tipo
FROM productos
INNER JOIN proveedores ON productos.proveedor_id = proveedores.id 
INNER JOIN producto_tipo ON productos.producto_tipo_id = producto_tipo.id;

-- 11
SELECT * FROM productos WHERE precio > 50;

-- 12
SELECT clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,  
  clientes_ubicacion.ciudad_id AS id_ciudad,
  ciudades.ciudad_name
FROM clientes 
INNER JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
INNER JOIN ciudades ON clientes_ubicacion.ciudad_id = ciudades.id
WHERE ciudades.ciudad_name = 'Bogotá';

-- 13
-- inserta un empleado contratado actualmente
INSERT empleados(nombre, salario, fecha_contratacion) VALUES ('Juanito Perez', 2500.00, '2024-10-16');

SELECT empleados.id AS id_empleado,
  empleados.nombre,
  empleados.salario,
  empleados.fecha_contratacion
FROM empleados
WHERE fecha_contratacion > '2023-06-22';

-- 14
-- insertar varios productos para un proveedor
INSERT INTO productos (proveedor_id, producto_tipo_id, nombre, precio) VALUES (1, 2, 'Teclado', 50.00), (1, 2, 'Mouse', 25.00), (1, 2, 'Monitor', 200.00), (1, 2, 'CPU', 500.00), (1, 2, 'Impresora', 150.00), (1, 2, 'Parlantes', 80.00);

-- el uso de having es necesario ya que el where no sirve con funciones agregadas como count. Y el group by se usa por el mismo error de sql_mode=only_full_group_by
SELECT proveedores.id,
  proveedores.nombre,
  COUNT(productos.id) AS total_productos
FROM proveedores
JOIN productos ON proveedores.id = productos.proveedor_id
GROUP BY proveedores.id, proveedores.nombre
HAVING COUNT(productos.id) > 5;

-- 15
-- ingresar un cliente sin direccion 
INSERT INTO clientes(nombre, apellidos) VALUES ('fabio', 'camelo');

-- sale null porque estos clientes no tienen direccion
SELECT 
  clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,
  clientes_ubicacion.direccion
FROM clientes
LEFT JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
WHERE clientes_ubicacion.id IS NULL;

-- 16
-- en este caso se usa la funcion reservada de sum para poder sumar el total de cada cliente teniendo en cuenta su pedido y porque vuelve a salir el error de sql_mode=only_full_group_by
SELECT 
  clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,
  SUM(pedidos.total) AS total_ventas
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nombre, clientes.apellidos;

-- 17
-- promedio de salario de todos los empleados de la empresa 
SELECT AVG(salario) AS promedio_salario FROM empleados;

-- 18 
SELECT 
  producto_tipo.id AS id_tipo,
  producto_tipo.nombre_tipo,
  producto_tipo.descripcion,
  productos.nombre,
  productos.precio
FROM producto_tipo
INNER JOIN productos ON producto_tipo.id = productos.producto_tipo_id;

-- 19
-- para este caso se debe de usar el ORDER BY para ordernar de acuerdo al precio de los productos y el LIMIT para que solo aparezcan los 3 con mayor valor.
SELECT 
  id AS id_producto,
  nombre,
  precio
FROM productos
ORDER BY precio DESC
LIMIT 3;

-- 20 
-- se cuental los pedidos con count id, se agrupa la consulta por clientes, se ordena de orden ascencidente de acuerdo al numero de pedidos por cliente y se muestra el primero, es decir, el que mas pedidos tiene 
SELECT 
  clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,
  COUNT(pedidos.id) AS total_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nombre, clientes.apellidos
ORDER BY total_pedidos DESC
LIMIT 1;

-- 21
-- relacionar pedidos con clientes
SELECT 
  pedidos.id AS id_pedido,
  pedidos.fecha,
  pedidos.total,
  clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id;

-- 22
-- 23
-- 24
-- 25
-- 26
-- 27
-- 28
-- 29
-- 30