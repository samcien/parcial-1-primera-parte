CREATE VIEW Vista_Autenticacion_Usuarios AS
SELECT 
    a.nombre_usuario,
    u.apellido,
    u.ciudad,
    u.tipo_empresa,
    a.fecha_creacion
FROM 
    Usuarios u
JOIN 
    Autenticacion a ON u.id = a.id_usuario;
    
    
  select * from    Vista_Autenticacion_Usuarios
