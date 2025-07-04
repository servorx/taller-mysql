-- CONSULTAS SIMPLES

-- 1
-- Seleccionar todos los productos con precio mayor a $50
SELECT * FROM productos WHERE precio > 50;

-- 2
-- Consultar clientes registrados en una ciudad específica.
SELECT clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,  
  clientes_ubicacion.ciudad_id AS id_ciudad,
  ciudades.ciudad_name
FROM clientes 
INNER JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
INNER JOIN ciudades ON clientes_ubicacion.ciudad_id = ciudades.id
WHERE ciudades.ciudad_name = 'Bogotá';

-- 3
-- Mostrar empleados contratados en los últimos 2 años
SELECT empleados.id AS id_empleado,
  empleados.nombre,
  empleados.salario,
  empleados.fecha_contratacion
FROM empleados
WHERE fecha_contratacion > '2023-06-22';

-- 4
-- Seleccionar proveedores que suministran más de 5 productos.
-- el uso de having es necesario ya que el where no sirve con funciones agregadas como count. Y el group by se usa por el mismo error de sql_mode=only_full_group_by
SELECT proveedores.id,
  proveedores.nombre,
  COUNT(productos.id) AS total_productos
FROM proveedores
JOIN productos ON proveedores.id = productos.proveedor_id
GROUP BY proveedores.id, proveedores.nombre
HAVING COUNT(productos.id) > 5;

-- 5
-- Listar clientes que no tienen dirección registrada en UbicacionCliente .
SELECT 
  clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,
  clientes_ubicacion.direccion
FROM clientes
LEFT JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
WHERE clientes_ubicacion.id IS NULL;

-- 6
-- Calcular el total de ventas por cada cliente.
-- en este caso se usa la funcion reservada de sum para poder sumar el total de cada cliente teniendo en cuenta su pedido y porque vuelve a salir el error de sql_mode=only_full_group_by
SELECT 
  clientes.id AS id_cliente,
  clientes.nombre,
  clientes.apellidos,
  SUM(pedidos.total) AS total_ventas
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nombre, clientes.apellidos;

-- 7
-- Mostrar el salario promedio de los empleados.
-- promedio de salario de todos los empleados de la empresa 
SELECT AVG(salario) AS promedio_salario FROM empleados;

-- 8 
-- Consultar el tipo de productos disponibles en TiposProductos
SELECT 
  producto_tipo.id AS id_tipo,
  producto_tipo.nombre_tipo,
  producto_tipo.descripcion,
  productos.nombre,
  productos.precio
FROM producto_tipo
INNER JOIN productos ON producto_tipo.id = productos.producto_tipo_id;

-- 9
-- Seleccionar los 3 productos más caros.
-- para este caso se debe de usar el ORDER BY para ordernar de acuerdo al precio de los productos y el LIMIT para que solo aparezcan los 3 con mayor valor.
SELECT 
  id AS id_producto,
  nombre,
  precio
FROM productos
ORDER BY precio DESC
LIMIT 3;

-- 10
-- Consultar el cliente con el mayor número de pedidos.
-- se cuentan los pedidos con count id, se agrupa la consulta por clientes, se ordena de orden ascencidente de acuerdo al numero de pedidos por cliente y se muestra el primero, es decir, el que mas pedidos tiene 
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
