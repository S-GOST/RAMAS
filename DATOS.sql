select * from administradores;
select * from tecnicos;
select * from clientes;
select * from ubicacion;
select * from motos;
insert into historial(ID_TECNICOS,ID_CLIENTES,ID_ORDEN_SERVICIO,ID_COMPROBANTE,ID_INFORME,Descripcion,Fecha_registro) values ('1','1','1','1','1','Historial','2025-11-08 13:20:10');
update orden_servicio
set ID_MOTOS = 2
where ID_ORDEN_SERVICIO = 1;
delete from productos where ID_PRODUCTOS = 1;
select * from servicios;
select * from productos;
select * from orden_servicio;
select * from detalles_orden_servicio;
select * from informe;
select * from comprobante;
select * from historial;