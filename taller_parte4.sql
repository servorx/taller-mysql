-- CONSULTAS MULTITABLA

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
-- hacer join con las tablas de clientes, clientes_ubicacion, ciudades, estados y paises con pedidos.
SELECT 
  pedidos.id AS id_pedido,
  pedidos.fecha,
  pedidos.total,
  pedidos.descripcion,
  clientes.nombre,
  clientes_ubicacion.direccion,
  ciudades.ciudad_name,
  estados.estado_name,
  paises.pais_name
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
INNER JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
INNER JOIN ciudades ON clientes_ubicacion.ciudad_id = ciudades.id
INNER JOIN estados ON ciudades.estado_id = estados.id
INNER JOIN paises ON estados.pais_id = paises.id;

-- 23
-- relacionar productos con proveedores y producto_tipo
SELECT 
  productos.id AS id_producto,
  productos.nombre,
  productos.precio,
  proveedores.id AS proveedor_id,
  proveedores.nombre AS proveedor_nombre,
  producto_tipo.nombre_tipo
FROM productos
INNER JOIN proveedores ON productos.proveedor_id = proveedores.id
INNER JOIN producto_tipo ON productos.producto_tipo_id = producto_tipo.id;

-- 24
-- para este comando se requiere añadir una relacion entre empleados y pedidos cosa que ya se hizo en los comandos anteriores.

-- se tiene que hacer el JOIN con todas esas tablas para filtrar el pedido realizado por un cliente en una ciudad especifica 
SELECT 
  empleados.id AS id_empleado, 
  empleados.nombre
FROM empleados
INNER JOIN pedidos ON empleados.id = pedidos.empleado_id
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
INNER JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
INNER JOIN ciudades ON clientes_ubicacion.ciudad_id = ciudades.id
WHERE ciudades.ciudad_name = 'Bogotá';

-- 25
-- listar los 5 productos mas vendidos, la misma logica que en el ejercicio 19. Otra vez el GROUP BY por el sql_mode=only_full_group_by
SELECT 
  productos.id,
  productos.nombre,
  SUM(pedidos_detalle.cantidad) AS total_vendidos
FROM productos
INNER JOIN pedidos_detalle ON productos.id = pedidos_detalle.producto_id
GROUP BY productos.id, productos.nombre
ORDER BY total_vendidos DESC
LIMIT 5;

-- 26
-- GROUP BY porque toca agrupar la cantidad total de pedidos por cliente y ciudad
SELECT 
  clientes.id AS id_cliente,
  clientes.nombre,
  COUNT(pedidos.id) AS total_pedidos,
  ciudades.ciudad_name,
  estados.estado_name,
  paises.pais_name
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
INNER JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
INNER JOIN ciudades ON clientes_ubicacion.ciudad_id = ciudades.id
INNER JOIN estados ON ciudades.estado_id = estados.id
INNER JOIN paises ON estados.pais_id = paises.id
GROUP BY clientes.id, ciudades.id;

-- 27
-- para poder ejecutar este comando correctamente toca asignar una ciudad para proveedores y para ello se necesita volver a normalizar las tablas 
SELECT 
  clientes.nombre AS nombre_cliente,
  proveedores.nombre AS nombre_proveedor,
  ciudades.ciudad_name
FROM clientes
INNER JOIN clientes_ubicacion ON clientes.id = clientes_ubicacion.cliente_id
INNER JOIN ciudades ON clientes_ubicacion.ciudad_id = ciudades.id
INNER JOIN proveedores ON proveedores.direccion LIKE CONCAT('%', ciudades.ciudad_name, '%');

-- 28
-- se realiza la multiplicacion por la cantidad de productos con el precio unitario
SELECT 
  producto_tipo.id AS id_tipo,
  producto_tipo.nombre_tipo,
  SUM(pedidos_detalle.cantidad * pedidos_detalle.precio_unitario) AS total_ventas
FROM producto_tipo
INNER JOIN productos ON producto_tipo.id = productos.producto_tipo_id
INNER JOIN pedidos_detalle ON productos.id = pedidos_detalle.producto_id
GROUP BY producto_tipo.nombre_tipo;

-- 29
SELECT  
  empleados.id, empleados.nombre
FROM empleados
INNER JOIN pedidos ON empleados.id = pedidos.empleado_id
INNER JOIN pedidos_detalle ON pedidos.id = pedidos_detalle.pedido_id
INNER JOIN productos ON pedidos_detalle.producto_id = productos.id
INNER JOIN proveedores ON productos.proveedor_id = proveedores.id
WHERE proveedores.nombre = 'Proveedor B';

-- 30
SELECT 
  proveedores.id AS id_proveedor,
  proveedores.nombre,
  SUM(pedidos_detalle.cantidad * pedidos_detalle.precio_unitario) AS ingreso_total
FROM proveedores
INNER JOIN productos ON proveedores.id = productos.proveedor_id
INNER JOIN pedidos_detalle ON productos.id = pedidos_detalle.producto_id
GROUP BY proveedores.id, proveedores.nombre;
