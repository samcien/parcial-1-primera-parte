CREATE VIEW Vista_Tipos_Pruebas_Activas AS
SELECT id_TPrueba, referencia, nombre, descripcion, fecha_ingreso,estado
FROM Tipos_Pruebas
WHERE estado = 'activado';



SELECT * FROM Vista_Tipos_Pruebas_Activas

