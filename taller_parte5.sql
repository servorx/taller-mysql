-- SUBCONSULTAS

-- 1
-- Consultar el producto más caro en cada categoría.
SELECT p.id AS producto_id, 
p.nombre AS producto_nombre,
p.precio,
pt.nombre_tipo
FROM productos AS p 
INNER JOIN producto_tipo AS pt ON p.producto_tipo_id = pt.id
WHERE p.precio = (
  SELECT MAX(p2.precio)
  FROM productos AS p2 
  WHERE p2.producto_tipo_id = p.producto_tipo_id
)
;

-- 2
-- Encontrar el cliente con mayor total en pedidos
SELECT c.id AS cliente_id,
c.nombre,
COUNT(p.id) AS total_pedidos
FROM clientes AS c
JOIN pedidos AS p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre
HAVING COUNT(p.id) = (
  SELECT MAX(contador)
  FROM (
    SELECT COUNT(*) AS contador
    FROM pedidos
    GROUP BY cliente_id
  ) AS sub
);

-- 3
-- Listar empleados que ganan más que el salario promedio.
SELECT e.id, 
e.nombre,
e.salario
FROM empleados AS e 
WHERE e.salario > ( 
  SELECT AVG(e2.salario)
  FROM empleados AS e2
)
;

-- 4
-- Consultar productos que han sido pedidos más de 5 veces.
SELECT p.id,
p.nombre,
(
  SELECT SUM(pd.cantidad)
  FROM pedidos_detalle AS pd
  WHERE pd.producto_id = p.id
) AS total_veces_pedido
FROM productos AS p
WHERE (
  SELECT SUM(pd.cantidad)
  FROM pedidos_detalle AS pd
  WHERE pd.producto_id = p.id
) > 5;

-- 5
-- Listar pedidos cuyo total es mayor al promedio de todos los pedidos.
SELECT p.id, 
p.fecha,
p.total
FROM pedidos AS p 
WHERE p.total > (
  SELECT AVG(p2.total)
  FROM pedidos AS p2 
);

-- 6
-- Seleccionar los 3 proveedores con más productos.
SELECT 
  proveedores.id AS id_proveedor,
  proveedores.nombre AS nombre_proveedor,
  (
    SELECT COUNT(*) 
    FROM productos AS p 
    WHERE p.proveedor_id = proveedores.id
  ) AS total_productos
FROM proveedores
WHERE proveedores.id IN (
  SELECT proveedor_id
  FROM (
    SELECT proveedor_id, COUNT(*) AS total
    FROM productos
    GROUP BY proveedor_id
    ORDER BY total DESC
    LIMIT 3
  ) AS top_proveedores
);


-- 7
-- Consultar productos con precio superior al promedio en su tipo.
SELECT p.id, 
p.nombre,
p.precio,
pt.nombre_tipo
FROM productos AS p
INNER JOIN producto_tipo AS pt ON p.producto_tipo_id = pt.id 
WHERE p.precio > (
  SELECT AVG(p2.precio)
  FROM productos AS p2 
  WHERE p2.producto_tipo_id = p.producto_tipo_id
);

-- 8
-- Mostrar clientes que han realizado más pedidos que la media.
SELECT c.id AS cliente_id,
c.nombre,
COUNT(p.id) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id = p.cliente_id
GROUP BY c.id, c.nombre
HAVING COUNT(p.id) > (
  SELECT AVG(total)
  FROM (
    SELECT COUNT(*) AS total
    FROM pedidos
    GROUP BY cliente_id
  ) AS sub
);

-- 9
-- Encontrar productos cuyo precio es mayor que el promedio de todos los productos.
SELECT p.id,
p.nombre,
p.precio
FROM productos AS p 
WHERE p.precio > (
  SELECT AVG(p2.precio)
  FROM productos AS p2 
);

-- 10
-- Mostrar empleados cuyo salario es menor al promedio del departamento.
-- no comprendí bien si la logica si departamento se refería al cargo del empleados o al departamentos (Santander) en el que vive.
SELECT e.id, 
e.nombre,
e.salario
FROM empleados AS e 
WHERE e.salario < (
  SELECT AVG(e2.salario)
  FROM empleados AS e2 
  WHERE e2.puesto_id = e.puesto_id 
);