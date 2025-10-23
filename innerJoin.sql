select * from administradores;
select * from tecnicos;
select * from ubicacion;
select * from clientes;
select * from motos;
select * from informe;
select * from comprobante;
select * from detalles_orden_servicio;
select * from orden_servicio;
select * from productos;
select * from servicios;
select * from historial;
/* Todas las ordenes */
SELECT 
    o.ID_ORDEN_SERVICIO,
    a.Nombre AS administradores,
    c.Nombre AS Clientes, 
    t.Nombre AS Tecnicos, 
    m.Marca AS Motos,
    o.Fecha_inicio, o.Fecha_estimada, Fecha_fin,
    o.Estado
FROM orden_servicio o
INNER JOIN administradores a ON o.ID_ADMINISTRADOR = a.ID_ADMINISTRADOR
INNER JOIN clientes c ON o.ID_CLIENTES = c.ID_CLIENTES
INNER JOIN tecnicos t ON o.ID_TECNICOS = t.ID_TECNICOS
INNER JOIN motos m    ON o.ID_MOTOS =  m.ID_MOTOS;
/* Todos los clientes con su ubicacion */
SELECT c.Nombre, u.Ciudad, u.Direccion
FROM clientes c 
JOIN ubicacion u ON c.ID_UBICACION = u.ID_UBICACION = 'lugar';
/* Contar cuantos clientes hay por ciudad */
SELECT u.Ciudad, count(c.ID_CLIENTES) AS TotalClientes
FROM clientes c
JOIN ubicacion u ON c.ID_UBICACION = u.ID_UBICACION = 'lugar'
GROUP BY u.Ciudad;
/* Cantidad de ordenes atendidas por cada tecnico */ 
SELECT t.Nombre, count(o.ID_ORDEN_SERVICIO) AS TotalOrdenes
FROM tecnicos t 
JOIN orden_servicio o ON t.ID_TECNICOS = o.ID_TECNICOS 
GROUP BY t.Nombre 
ORDER BY TotalOrdenes DESC;
/* Ver servicios con sus precios */
SELECT Nombre, Precio FROM servicios;
/* Productos con precio mayor al promedio */
SELECT * FROM productos
WHERE Precio > (SELECT AVG(Precio) FROM productos);
/* Servicios mas caros */
SELECT * FROM productos 
WHERE Precio = (SELECT MAX(Precio) FROM Servicios);
/* Ver ordenes por cliente */
SELECT o.ID_ORDEN_SERVICIO, o.Estado, c.Nombre AS cliente 
FROM orden_servicio o
JOIN clientes c ON o.ID_CLIENTES = c.ID_CLIENTES
JOIN tecnicos t ON o.ID_TECNICOS = t.ID_TECNICOS;
/* Cantidad por ordenes de estado */
SELECT estado, count(*) AS Total
FROM orden_servicio 
GROUP BY estado;
/* ultimas ordenes registrdas */
SELECT * FROM orden_servicio
ORDER BY fecha_inicio DESC 
LIMIT 5;
/* Ver los detalles de cada orden */
SELECT d.ID_DETALLES_ORDEN_SERVICIO, o.ID_ORDEN_SERVICIO, d.Garantia
FROM detalles_orden_servicio d 
JOIN orden_servicio o ON d.ID_ORDEN_SERVICIO = o.ID_ORDEN_SERVICIO;