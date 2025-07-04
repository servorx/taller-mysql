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
SUM(pd.cantidad) AS veces_pedido
FROM productos AS p 
INNER JOIN pedidos_detalle AS pd ON p.id = pd.pedido_id
GROUP BY p.id
HAVING SUM(pd.cantidad) > 1;

-- 5
-- Listar pedidos cuyo total es mayor al promedio de todos los pedidos.

-- 6
-- Seleccionar los 3 proveedores con más productos.

-- 7
-- Consultar productos con precio superior al promedio en su tipo.

-- 8
-- Mostrar clientes que han realizado más pedidos que la media.

-- 9
-- Encontrar productos cuyo precio es mayor que el promedio de todos los productos.

-- 10
-- Mostrar empleados cuyo salario es menor al promedio del departamento.