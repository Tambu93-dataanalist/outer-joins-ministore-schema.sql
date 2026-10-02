




-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: [Tamburri Lucas Ivan]
-- Fecha: [01/10/2026]
-- ══════════════════════════════════════════

-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos?
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

SELECT
p.nombre AS productos,
v.venta_id AS ventas_xproducto

FROM productos AS p

LEFT JOIN ventas AS v

ON
	p.producto_id = v.producto_id

	WHERE 
			v.venta_id IS NULL;

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

SELECT
p.nombre AS productos,
v.venta_id AS ventas_xproducto

FROM productos AS p

RIGHT JOIN ventas AS v

ON
	p.producto_id = v.producto_id

	WHERE 
			p.nombre IS NULL;


-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

SELECT
p.nombre AS productos,
v.venta_id AS ventas_xproducto

FROM productos AS p

FULL OUTER JOIN ventas AS v

ON
	p.producto_id = v.producto_id;


