INSERT INTO oficinas (id_oficina, ciudad, telefono, direccion, departamento, pais, codigoPostal, continente, tipo_oficina, es_activa)
VALUES
('OF001', 'New York', '+1 123-456-7890', '123 Main St', 'Sales', 'USA', '10001', 'América', 'Principal', true),
('OF002', 'Los Angeles', '+1 987-654-3210', '456 Elm St', 'Marketing', 'USA', '90001', 'América', 'Sucursal', true),
('OF003', 'Paris', '+33 1 2345-6789', '789 Rue Principale', 'Finance', 'France', '75001', 'Europa', 'Sucursal', true),
('OF004', 'Tokyo', '+81 3 4567-8901', '101 Sakura Ave', 'Development', 'Japan', '100-0001', 'Asia', 'Sucursal', true),
('OF005', 'Sydney', '+61 2 3456-7890', '567 Kangaroo St', 'Operations', 'Australia', '2000', 'Oceanía', 'Sucursal', true),
('OF006', 'São Paulo', '+55 11 9876-5432', '321 Avenida Paulista', 'HR', 'Brazil', '01310-000', 'América', 'Sucursal', true),
('OF007', 'Berlin', '+49 30 1234-5678', '987 Hauptstrasse', 'IT', 'Germany', '10115', 'Europa', 'Sucursal', true);

INSERT INTO lineasproductos (id_lineaProducto, nombreLinea, textoDescripcion, htmlDescripcion, imagen, es_activa)
VALUES
(1, 'Electronics', 'Electronic products line', '<p>Electronic products line description</p>', 'electronic.jpg', true),
(2, 'Clothing', 'Clothing and apparel', '<p>Clothing and apparel description</p>', 'clothing.jpg', true),
(3, 'Books', 'Books and literature', '<p>Books and literature description</p>', 'books.jpg', true),
(4, 'Toys', 'Toys and games', '<p>Toys and games description</p>', 'toys.jpg', true),
(5, 'Sports', 'Sports equipment', '<p>Sports equipment description</p>', 'sports.jpg', true),
(6, 'Home', 'Home and garden', '<p>Home and garden description</p>', 'home.jpg', true),
(7, 'Beauty', 'Beauty products', '<p>Beauty products description</p>', 'beauty.jpg', true);

INSERT INTO productos (id_producto, nombreProducto, id_lineaProducto, escala, cantidad, precioVenta, MSRP, es_disponible)
VALUES
('PROD001', 'Smartphone X', 1, '1:10', 100, 599.99, 699.99, true),
('PROD002', 'T-shirt Basic', 2, 'S', 500, 19.99, 24.99, true),
('PROD003', 'Book of Wonders', 3, '', 200, 9.99, 14.99, true),
('PROD004', 'LEGO Set 123', 4, '', 50, 49.99, 59.99, true),
('PROD005', 'Soccer Ball', 5, '', 100, 14.99, 19.99, true),
('PROD006', 'Garden Hose 30m', 6, '', 30, 29.99, 34.99, true),
('PROD007', 'Lipstick Red', 7, '', 300, 9.99, 12.99, true);

INSERT INTO empleados (documento, apellido, nombre, extension, email, id_oficina, jefe, cargo, tipo_contrato)
VALUES
(1001, 'Smith', 'John', '1234', 'jsmith@example.com', 'OF001', NULL, 'Sales Manager', 'Permanente'),
(1002, 'Garcia', 'Maria', '5678', 'mgarcia@example.com', 'OF002', 1001, 'Marketing Assistant', 'Permanente'),
(1003, 'Müller', 'Hans', '9101', 'hmuller@example.com', 'OF003', 1001, 'Financial Analyst', 'Permanente'),
(1004, 'Tanaka', 'Yuki', '2345', 'ytanaka@example.com', 'OF004', 1001, 'Software Developer', 'Permanente'),
(1005, 'Chen', 'Wei', '6789', 'wchen@example.com', 'OF005', 1001, 'Operations Coordinator', 'Permanente'),
(1006, 'Silva', 'Carlos', '1112', 'csilva@example.com', 'OF006', 1001, 'HR Specialist', 'Permanente'),
(1007, 'Schulz', 'Anna', '1314', 'aschulz@example.com', 'OF007', 1001, 'IT Technician', 'Permanente');


INSERT INTO clientes (id_cliente, empresa, apellido, nombre, telefono, direccion, ciudad, departamento, codigoPostal, pais, empleadoAtiende, limiteCredito, tipo_cliente)
VALUES
(1, 'Tech Solutions', 'Johnson', 'Robert', '+1 555-1234', '456 Tech Ave', 'New York', 'Sales', '10005', 'USA', 1001, 5000.00, 'Regular'),
(2, 'Fashionista', 'Gomez', 'Isabella', '+1 555-5678', '789 Fashion St', 'Los Angeles', 'Marketing', '90010', 'USA', 1002, 10000.00, 'Premium'),
(3, 'Books & More', 'Dubois', 'Émilie', '+33 1 2345-6789', '101 Rue du Livre', 'Paris', 'Finance', '75005', 'France', 1003, 7500.00, 'Regular'),
(4, 'Tech Japan', 'Yamamoto', 'Takashi', '+81 3 4567-8901', '789 Gadget Blvd', 'Tokyo', 'Development', '100-0003', 'Japan', 1004, 30000.00, 'Premium'),
(5, 'Aussie Gadgets', 'White', 'Emily', '+61 2 3456-7890', '123 Kangaroo Ave', 'Sydney', 'Operations', '2000', 'Australia', 1005, 15000.00, 'Regular'),
(6, 'Brazil Beauty', 'Oliveira', 'Lucas', '+55 11 9876-5432', '456 Beleza St', 'São Paulo', 'HR', '01315-000', 'Brazil', 1006, 20000.00, 'Premium'),
(7, 'Berlin Books', 'Schmidt', 'Lena', '+49 30 1234-5678', '789 Buchstrasse', 'Berlin', 'IT', '10117', 'Germany', 1007, 12000.00, 'Regular');

INSERT INTO ordenes (id_orden, fechaRecibido, fechaLimiteEntrega, fechaEntrega, estado, observacion, id_cliente, tipo_envio, es_internacional)
VALUES
(1001, '2024-06-01', '2024-06-10', '2024-06-08', 'Entregado', 'Cliente satisfecho', 1, 'Normal', false),
(1002, '2024-06-02', '2024-06-12', NULL, 'En proceso', 'Esperando confirmación de pago', 2, 'Express', false),
(1003, '2024-06-03', '2024-06-15', NULL, 'En proceso', 'Productos en backorder', 3, 'Normal', true),
(1004, '2024-06-04', '2024-06-14', '2024-06-13', 'Entregado', 'Entrega exitosa', 4, 'Express', false),
(1005, '2024-06-05', '2024-06-20', NULL, 'En proceso', 'Revisión aduanal pendiente', 5, 'Normal', true),
(1006, '2024-06-06', '2024-06-18', '2024-06-17', 'Entregado', 'Cliente recogió en tienda', 6, 'Express', false),
(1007, '2024-06-07', '2024-06-22', NULL, 'En proceso', 'Esperando confirmación de stock', 7, 'Normal', true);

INSERT INTO detallesordenes (id_orden, id_producto, cantidadPedida, valorUnitario, ordenEntrega, tipo_detalle, es_prioritario)
VALUES
(1001, 'PROD001', 10, 599.99, 1, 'Regular', true),
(1001, 'PROD002', 20, 19.99, 2, 'Regular', false),
(1002, 'PROD003', 5, 9.99, 1, 'Regular', true),
(1003, 'PROD004', 2, 49.99, 1, 'Especial', false),
(1004, 'PROD005', 15, 14.99, 1, 'Regular', true),
(1005, 'PROD006', 1, 29.99, 1, 'Regular', true),
(1005, 'PROD007', 50, 9.99, 2, 'Regular', false);

INSERT INTO pagos (id_cliente, numeroFactura, fechaPago, totalPago, tipo_pago)
VALUES
(1, 'F2024-001', '2024-06-10', 5999.90, 'Crédito'),
(2, 'F2024-002', '2024-06-12', 399.95, 'Contado'),
(3, 'F2024-003', '2024-06-15', 49.95, 'Contado'),
(4, 'F2024-004', '2024-06-14', 749.85, 'Crédito'),
(5, 'F2024-005', '2024-06-20', 224.85, 'Crédito'),
(6, 'F2024-006', '2024-06-17', 149.95, 'Contado'),
(7, 'F2024-007', '2024-06-22', 499.50, 'Crédito');

