CREATE VIEW Vista_MediosPagos AS
SELECT Usuarios.nombre_usuario, Usuarios.estado_civil, Usuarios.direccion, Pagos.numero_tarjeta, Pagos.nombre_titular
FROM Usuarios
JOIN Pagos ON Usuarios.id = Pagos.id_usuario;


select * from vista_mediospagos