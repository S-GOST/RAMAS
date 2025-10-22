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
INNER JOIN motos m    ON o.ID_MOTOS =  m.ID_MOTOS




