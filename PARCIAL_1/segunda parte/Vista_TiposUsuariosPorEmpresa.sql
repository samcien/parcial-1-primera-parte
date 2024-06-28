CREATE VIEW Vista_TiposUsuariosPorEmpresa AS
SELECT nombre_usuario, apellido, tipo_empresa
FROM Usuarios
ORDER BY tipo_empresa;


select * from vista_TiposUsuariosPorEmpresa 


