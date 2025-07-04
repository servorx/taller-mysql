-- JOINS

-- 1
-- Obtener la lista de todos los pedidos con los nombres de clientes usando INNER JOIN 
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
-- Listar los productos y proveedores que los suministran con INNER JOIN .
SELECT productos.id AS id_producto,
  productos.nombre AS producto_nombre,
  proveedores.id as id_proveedor,
  proveedores.nombre AS proveedor_nombre
FROM productos INNER JOIN proveedores ON productos.proveedor_id = proveedores.id;

-- 3
-- Mostrar los pedidos y las ubicaciones de los clientes con LEFT JOIN 
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
-- Consultar los empleados que han registrado pedidos, incluyendo empleados sin pedidos ( LEFT JOIN ).
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
-- Obtener el tipo de producto y los productos asociados con INNER JOIN .
SELECT 
  producto_tipo.id AS id_tipo,
  producto_tipo.nombre_tipo,
  productos.id AS id_producto,
  productos.nombre,
  productos.precio 
FROM producto_tipo
INNER JOIN productos ON productos.producto_tipo_id = producto_tipo.id;

-- 6
-- Listar todos los clientes y el número de pedidos realizados con COUNT y GROUP BY .
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
-- Combinar Pedidos y Empleados para mostrar qué empleados gestionaron pedidos específicos.
SELECT 
  pedidos.id AS id_pedido,
  pedidos.fecha,
  pedidos.total,
  empleados.nombre
FROM pedidos 
INNER JOIN empleados ON empleados.id = pedidos.empleado_id;

-- 8
-- Mostrar productos que no han sido pedidos ( RIGHT JOIN ).
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
-- Mostrar el total de pedidos y ubicación de clientes usando múltiples JOIN .
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
-- Unir Proveedores , Productos , y TiposProductos para un listado completo de inventario.
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
