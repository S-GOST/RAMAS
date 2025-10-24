/* Todas las ordenes a cargo */
SELECT o.ID_ORDEN_SERVICIO, a.Nombre AS Administradores, t.Nombre AS Tecnicos, c.Nombre AS Clientes, o.Estado
FROM orden_servicio o
JOIN clientes c ON o.ID_CLIENTES = c.ID_CLIENTES
JOIN tecnicos t ON o.ID_TECNICOS = t.ID_TECNICOS
JOIN administradores a ON o.ID_ADMINISTRADOR = a.ID_ADMINISTRADOR;
/* Clientes con su ubicacion */
select c.Nombre, u.Ciudad, u.Direccion
from clientes c
join ubicacion u on c.ID_UBICACION = u.ID_UBICACION;
/* Cuantos cliente por ciudad */
select u.Ciudad, count(c.ID_CLIENTES) AS TotalClientes
FROM clientes c
JOIN ubicacion u ON c.ID_UBICACION = u.ID_UBICACION
group by u.Ciudad;
/* Cantidad de ordenes atendidas por cada tecnico */
select t.Nombre, COUNT(o.ID_ORDEN_SERVICIO) AS TotalOrdenes
from tecnicos t 
join orden_servicio o ON t.ID_TECNICOS = o.ID_TECNICOS
GROUP BY t.Nombre 
ORDER BY TotalOrdenes DESC;
/* Productos con precio mayor al promedio */
select * from productos
where precio >(select avg(precio) from productos);
/* Servicios mas caros */
select * from servicios
where precio = (select max(precio)from servicios);
/* Cantidad de ordenes por estado */ 
select Estado, count(*) as Total
from orden_servicio
group by Estado;
/* Total de productos usados por cada orden */
select o.ID_ORDEN_SERVICIO, SUM(d.ID_PRODUCTOS) AS TotalProductos
from orden_servicio o
join detalles_orden_servicio d on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO;

/* Ver comprobante por cada orden */
select c.ID_COMPROBANTE, o.ID_ORDEN_SERVICIO, c.Monto
FROM comprobante c 
JOIN orden_servicio o ON c.ID_ORDEN_SERVICIO = o.ID_ORDEN_SERVICIO;
