CREATE DATABASE PixelSecurity360;
USE PixelSecurity360;

CREATE TABLE Tipos_Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_usuario ENUM('Cliente', 'Administrador', 'Vendedor', 'Ejecutivo', 'Otro') NOT NULL,
    descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    token VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    estado_civil VARCHAR(20) NOT NULL,
    tipo_empresa ENUM('pública', 'privada') NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    id_tipo_usuario INT NOT NULL,
    FOREIGN KEY (id_tipo_usuario) REFERENCES Tipos_Usuarios(id)
);

CREATE TABLE Autenticacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    agente_usuario VARCHAR(100) NOT NULL,
    token VARCHAR(255) NOT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id)
);

CREATE TABLE Tipos_Pruebas (
    id_TPrueba INT AUTO_INCREMENT PRIMARY KEY,
    referencia VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    estado ENUM('activado', 'desactivado') NOT NULL
);

CREATE TABLE Tipos_Tarjetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_tarjeta ENUM('Visa', 'American Express', 'MasterCard', 'Discover') NOT NULL,
    imagen VARCHAR(255) NOT NULL
);

CREATE TABLE Pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    numero_tarjeta VARCHAR(16) NOT NULL,
    nombre_titular VARCHAR(100) NOT NULL,
    cvc VARCHAR(4) NOT NULL,
    fecha_expiracion DATE NOT NULL,
    por_defecto BOOLEAN NOT NULL,
    id_tipo_tarjeta INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_tipo_tarjeta) REFERENCES Tipos_Tarjetas(id)
);

CREATE TABLE Reportes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_TPrueba INT NOT NULL,
    contenido TEXT NOT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('pendiente', 'completado', 'en_progreso') NOT NULL,
    comentarios TEXT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_TPrueba) REFERENCES Tipos_Pruebas(id_TPrueba)
);
