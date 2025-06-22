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