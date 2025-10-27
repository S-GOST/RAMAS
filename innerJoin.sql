
/* Todas las ordenes a cargo */
SELECT o.ID_ORDEN_SERVICIO, a.Nombre AS Administradores, t.Nombre AS Tecnicos, c.Nombre AS Clientes, o.Estado
FROM orden_servicio o
JOIN clientes c ON o.ID_CLIENTES = c.ID_CLIENTES
JOIN tecnicos t ON o.ID_TECNICOS = t.ID_TECNICOS
JOIN administradores a ON o.ID_ADMINISTRADOR = a.ID_ADMINISTRADOR;

update clientes
set ID_UBICACION = 1
where ID_CLIENTES = 1;
select * from clientes;
insert into ubicacion(ID_UBICACION,Departamento,Ciudad,Direccion) values ('3','Cundinamarca','El carmen','80');
select * from ubicacion;
select * from detalles_orden_servicio;
select * from orden_servicio;
select * from detalles_orden_servicio;

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

select o.ID_ORDEN_SERVICIO, Estado
from orden_servicio o
group by Estado;

/* Total de productos usados por cada orden */

select o.ID_ORDEN_SERVICIO, SUM(d.ID_PRODUCTOS) AS TotalProductos
from orden_servicio o
join detalles_orden_servicio d on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO
GROUP BY o.ID_ORDEN_SERVICIO;

/* Total de servicios usados por cada orden */

select o.ID_ORDEN_SERVICIO, SUM(d.ID_SERVICIOS) AS TotalServicios
from orden_servicio o
join detalles_orden_servicio d on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO
GROUP BY o.ID_ORDEN_SERVICIO;

/*Ver detalles de cada orden*/

select d.ID_DETALLES_ORDEN_SERVICIO, o.ID_ORDEN_SERVICIO
from detalles_orden_servicio d
join orden_servicio o on o.ID_ORDEN_SERVICIO = d.ID_ORDEN_SERVICIO;

/* Ver comprobante por cada informe */

select c.ID_COMPROBANTE, i.ID_INFORME, c.Monto
FROM comprobante c 
JOIN informe i  ON i.ID_INFORME = c.ID_INFORME;

/*Orden por cada cliente*/

select o.ID_ORDEN_SERVICIO, c.Nombre as clientes 
from orden_servicio o
join clientes c on o.ID_CLIENTES = c.ID_CLIENTES;

/*Motos por cada cliente con marca y placa*/

select o.ID_MOTOS, m.Marca, m.Placa
from clientes c 
join orden_servicio o ON c.ID_CLIENTES = o.ID_CLIENTES
join motos m ON o.ID_MOTOS = m.ID_MOTOS;

/* 