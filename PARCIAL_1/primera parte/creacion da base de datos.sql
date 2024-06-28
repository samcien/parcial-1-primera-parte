CREATE DATABASE sistema_punto_ventas;
USE sistema_punto_ventas;

CREATE TABLE  oficinas (
    id_oficina VARCHAR(10) PRIMARY KEY,
    ciudad VARCHAR(50),
    telefono VARCHAR(50),
    direccion VARCHAR(50),
    departamento VARCHAR(50),
    pais VARCHAR(50),
    codigoPostal VARCHAR(15),
    continente VARCHAR(10),
    tipo_oficina ENUM('Principal', 'Sucursal'),-- tipo lista
    es_activa BOOLEAN-- tipo si/no
);

CREATE TABLE lineasproductos (
    id_lineaProducto INT PRIMARY KEY,
    nombreLinea VARCHAR(50) UNIQUE,-- columna única
    textoDescripcion VARCHAR(4000),
    htmlDescripcion VARCHAR(200),
    imagen VARCHAR(200),
    es_activa BOOLEAN -- tipo si/no
);

CREATE TABLE productos (
    id_producto VARCHAR(15) PRIMARY KEY,
    nombreProducto VARCHAR(70) UNIQUE,-- columna única
    id_lineaProducto INT,
    escala VARCHAR(10),
    cantidad INT,
    precioVenta DOUBLE,
    MSRP DOUBLE,
    es_disponible BOOLEAN,-- tipo si/no
    FOREIGN KEY (id_lineaProducto) REFERENCES lineasproductos(id_lineaProducto)
);

CREATE TABLE empleados (
    documento INT PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100) UNIQUE,-- columna única
    id_oficina VARCHAR(10),
    jefe INT,
    cargo VARCHAR(50),
    tipo_contrato ENUM('Permanente', 'Temporal'),-- tipo lista
    FOREIGN KEY (id_oficina) REFERENCES oficinas(id_oficina)
);

CREATE TABLE  clientes (
    id_cliente INT PRIMARY KEY,
    empresa VARCHAR(50),
    apellido VARCHAR(50),
    nombre VARCHAR(50),
    telefono VARCHAR(50) UNIQUE, -- columna única
    direccion VARCHAR(50),
    ciudad VARCHAR(50),
    departamento VARCHAR(50),
    codigoPostal VARCHAR(15),
    pais VARCHAR(50),
    empleadoAtiende INT,
    limiteCredito DOUBLE,
    tipo_cliente ENUM('Regular', 'Premium'),-- tipo lista
    FOREIGN KEY (empleadoAtiende) REFERENCES empleados(documento)
);

CREATE TABLE ordenes (
    id_orden INT PRIMARY KEY,
    fechaRecibido DATE,
    fechaLimiteEntrega DATE,
    fechaEntrega DATE,
    estado VARCHAR(15),
    observacion TEXT,
    id_cliente INT,
    tipo_envio ENUM('Normal', 'Express'),-- tipo lista
    es_internacional BOOLEAN,-- tipo si/no
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detallesordenes (
    id_orden INT,
    id_producto VARCHAR(15),
    cantidadPedida INT,
    valorUnitario DOUBLE,
    ordenEntrega INT,
    tipo_detalle ENUM('Regular', 'Especial'),-- tipo lista
    es_prioritario BOOLEAN,-- tipo si/no
    PRIMARY KEY (id_orden, id_producto),
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE pagos (
    id_cliente INT,
    numeroFactura VARCHAR(50) UNIQUE,-- columna única
    fechaPago DATE,
    totalPago DOUBLE,
    tipo_pago ENUM('Contado', 'Crédito'),-- tipo lista
    PRIMARY KEY (id_cliente, numeroFactura),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
