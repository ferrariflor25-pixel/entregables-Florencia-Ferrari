USE empresa

select
fechaVenta
FROM dbo.Ventas;

--Resumen ejecutivo mensual--
select
month(fechaVenta) as mes,
Count(ID_VENTAS) as ventas,
sum(Cantidad * PrecioUnitario) as facturado
From dbo.Ventas
Group by month (fechaVenta);

--Ranking de productos--
SELECT 
TOP 5 sum(Cantidad* PrecioUnitario) as facturado,
sum(Cantidad) as vendido,
ID_Productos as productos
FROM dbo.Ventas
GROUP BY ID_Productos 
ORDER BY Facturado desc;

---Clientes recurrentes--
SELECT
ID_Cliente,
COUNT (ID_Ventas) as numerocompras,
SUM (Cantidad*PrecioUnitario) gastado
FROM dbo.Ventas
GROUP BY ID_Cliente
HAVING COUNT (ID_Ventas)>1;


select* from ventas;


--Meses por encima/ debajo promedio--
SELECT
SUM (Cantidad*PrecioUnitario) as facturado,
month (fechaVenta) as mes,
CASE 
WHEN ventames >=AVG(facturado) THEN 'Venta alta'
WHEN ventames<AVG(facturado) then 'Venta baja'
end as ventasmes
FROM dbo.Ventas
GROUP BY MONTH(fechaVenta);
--
WITH FacturacionMensual AS (
    SELECT
        MONTH(fechaVenta) AS mes,
        SUM(Cantidad * PrecioUnitario) AS facturado
    FROM dbo.Ventas
    GROUP BY MONTH(fechaVenta)
)
SELECT
    mes,
    facturado,
    CASE
        WHEN facturado > AVG(facturado) OVER ()
            THEN 'Venta alta'
        WHEN facturado < AVG(facturado) OVER ()
            THEN 'Venta baja'
        ELSE 'Venta promedio'
    END AS categoria_ventas
FROM FacturacionMensual
ORDER BY mes;

SELECT 
ID_Productos,
Nombreproducto
FROM dbo.Productos;

---En el mes de marzo se realizaron 10 ventas y fue un mes promedio
--Los productos mas vendidos fuero ID 1(laptop pro 15), 3(monitor 4k),5(SSD ext)  
--Todos los clientes tienen el mismo numero de compras 