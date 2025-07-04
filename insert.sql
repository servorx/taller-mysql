INSERT INTO paises (pais_name) VALUES ('Colombia'),('Argentina'),('México'),('Brasil'),('Chile');

INSERT INTO estados (estado_name, pais_id) VALUES ('Santander', 1),('Misiones',2),('Cundinamarca', 1),('Buenos Aires', 2),('Río de Janeiro', 4),('Yucatán', 3),('Valparaíso', 5);

INSERT INTO ciudades (ciudad_name, estado_id) VALUES ('Bogotá', 1),('estado x', 2),('Bucaramanga', 1),('Medellín', 3),('La Plata', 2),('Cancún', 6),('Santiago', 7),('Río', 4);

INSERT INTO clientes (nombre, apellidos) VALUES ('Juan', 'Pérez'),('Ana ','Garcia'),('Angel','Pinzon'), ('Hector','Mejia'),('Mario', 'Rojas'),('Daniela', 'Martínez'),('Camila', 'Ruiz'),('Pedro', 'Suárez'),('Laura', 'Cano'),('Julio', 'Salas');

INSERT INTO clientes_ubicacion (cliente_id, ciudad_id, direccion, codigo_postal, descripcion) VALUES (1, 1, 'Calle 123', '110111', 'Casa principal'),(2, 2, 'Av Reforma 456', '44100', 'Departamento'),(3, 3, 'Calle 50', '680001', 'Casa secundaria'),(4, 4, 'Av 80', '050021', 'Apartamento'),(5, 5, 'Calle 100', '1900', 'Casa con garaje'),(6, 6, 'Av Sol', '77500', 'Penthouse'),(7, 7, 'Calle Sur', '8320000', 'Casa de campo'),(8, 8, 'Rua das Flores', '20000', 'Condominio');

INSERT INTO clientes_correo (cliente_id, email_name, email_type) VALUES (1, 'juan@example.com', 'personal'),(2, 'ana@example.com', 'trabajo'),(3, 'mario.r@example.com', 'personal'),(4, 'danimart@example.com', 'trabajo'),(5, 'camiruiz@example.com', 'personal'),(6, 'psuarez@example.com', 'personal'),(7, 'laurac@example.com', 'trabajo'),(8, 'julios@example.com', 'personal');

INSERT INTO clientes_telefono (cliente_id, telefono, telefono_type, telefono_prefijo) VALUES (1, '3011234567', 'móvil', '+57'), (2, '3317654321', 'fijo', '+52'),(3, '3201234567', 'móvil', '+57'),(4, '3009988777', 'móvil', '+57'),(5, '3111122233', 'móvil', '+57'),(6, '3122233445', 'fijo', '+57'),(7, '3200001111', 'móvil', '+57'),(8, '3103332221', 'móvil', '+57');

INSERT INTO puestos (nombre_puesto) VALUES ('Vendedor'),('Administrador'),('Gerente'),('Técnico'),('Soporte'),('Mensajero'),('Analista');

INSERT INTO empleados (puesto_id, nombre, salario, fecha_contratacion) VALUES (1, 'Carlos López', 3000.00, '2023-01-10'),(2, 'Luisa Fernández', 4500.00, '2022-06-15'),(3, 'Andrea Torres', 2500.00, '2021-02-20'),(4, 'Luis Ramírez', 1800.00, '2020-08-01'),(5, 'Elena Castro', 3200.00, '2022-10-10'),(6, 'Jorge León', 5000.00, '2019-03-15'),(7, 'Sofía Mendoza', 2700.00, '2024-04-12'),(1, 'Juanito Perez', 2500.00, '2024-10-16');

INSERT INTO datos_empleados (empleado_id, direccion, estado_civil) VALUES (1, 'Calle 10 Sur', 'Soltero'),(2, 'Av Central', 'Casado'),(3, 'Calle 15', 'Soltero'),(4, 'Av Siempreviva 742', 'Casado'),(5, 'Calle Luna 22', 'Soltero'),(6, 'Cra 14', 'Divorciado'),(7, 'Av 33', 'Casado');

INSERT INTO datos_empleados_correo (datos_empleado_id, email_type, email_name) VALUES (1, 'corporativo', 'carlos@empresa.com'),(2, 'personal', 'luisa@personal.com'),(3, 'personal', 'andrea.t@example.com'),(4, 'corporativo', 'luis.ramirez@empresa.com'),(5, 'personal', 'elena@example.com'),(6, 'corporativo', 'jorge.leon@empresa.com'),(7, 'personal', 'sofia.m@example.com');

INSERT INTO datos_empleados_telefono (datos_empleado_id, telefono, telefono_type, telefono_prefijo) VALUES (1, '3100000001', 'móvil', '+57'),(2, '5551002002', 'fijo', '+52'),(3, '3101239876', 'móvil', '+57'),(4, '3050007894', 'móvil', '+57'),(5, '3204569873', 'fijo', '+57'),(6, '3132224455', 'móvil', '+57'),(7, '3001231231', 'fijo', '+57');

INSERT INTO proveedores (nombre, direccion, ciudad_id) VALUES ('Proveedor A', 'Cra 10 #20-30', 1),('Proveedor B', 'Av 15 #45-60', 2),('Proveedor C', 'Calle 123 Local 4', 3),('Proveedor D', 'Zona Industrial Km 5', 4),('Proveedor E', 'Av Norte 101', 5);

INSERT INTO producto_tipo (nombre_tipo, descripcion) VALUES ('Electrónica', 'Productos electrónicos en general'),('Computadores', 'Laptops y PCs'),('Periféricos', 'Teclados, mouse, audífonos, etc.'),('Accesorios', 'Fundas, protectores, soportes'),('Software', 'Sistemas operativos y programas'),('Redes', 'Routers, switches, cables de red');

INSERT INTO jerarquia_tipos (tipo_id, padre_id) VALUES (2, 1),(3, 1),(4, 1),(5, 1),(6, 1);

INSERT INTO productos (proveedor_id, producto_tipo_id, nombre, precio) VALUES (1, 1, 'Audífonos', 120.00),(2, 2, 'Laptop Lenovo', 2300.00),(1, 3, 'Mouse Logitech', 80.00),(2, 4, 'Funda Laptop', 40.00),(3, 2, 'Teclado Mecánico', 150.00),(4, 5, 'Windows 11 Pro', 350.00),(5, 6, 'Router TP-Link', 200.00),(3, 1, 'Tablet Samsung', 850.00),(1, 2, 'Teclado', 50.00), (1, 2, 'Mouse', 25.00), (1, 2, 'Monitor', 200.00), (1, 2, 'CPU', 500.00), (1, 2, 'Impresora', 150.00), (1, 2, 'Parlantes', 80.00);

INSERT INTO pedidos (cliente_id, fecha, total, descripcion, empleado_id) VALUES (1, '2024-06-01', 2420.00, 'Compra en línea', 1),(2, '2024-06-02', 120.00, 'Compra física', 2),(3, '2024-06-03', 850.00, 'Compra de tablet',3),(4, '2024-06-04', 270.00, 'Compra periféricos',4),(5, '2024-06-05', 350.00, 'Compra software',5),(6, '2024-06-06', 200.00, 'Compra red', 6),(7, '2024-06-07', 40.00, 'Compra accesorio',7),(8, '2024-06-08', 150.00, 'Teclado mecánico',1);

INSERT INTO pedidos_detalle (pedido_id, producto_id, cantidad, precio_unitario) VALUES (1, 2, 1, 2300.00),(1, 1, 1, 120.00),(2, 1, 1, 120.00),(3, 8, 1, 850.00),  (4, 3, 2, 80.00),   (4, 5, 1, 110.00),  (5, 6, 1, 350.00),  (6, 7, 1, 200.00),  (7, 4, 1, 40.00),   (8, 5, 1, 150.00);

INSERT INTO pedidos_historial (pedido_id, cambio_fecha, cambio_total, cambio_descripcion) VALUES (1, '2024-06-01 12:00:00', 2420.00, 'Compra registrada'),(2, '2024-06-02 13:00:00', 120.00, 'Pago en caja'),(3, '2024-06-03 11:00:00', 850.00, 'Compra tablet'),(4, '2024-06-04 12:30:00', 270.00, 'Compra accesorios y mouse'),(5, '2024-06-05 14:45:00', 350.00, 'Compra de software'),(6, '2024-06-06 16:00:00', 200.00, 'Compra de router'),(7, '2024-06-07 10:00:00', 40.00, 'Compra funda laptop'),(8, '2024-06-08 13:15:00', 150.00, 'Compra teclado mecánico');

INSERT INTO proveedores_contacto (proveedor_id, contacto, tipo_contacto) VALUES (1, 'contactoA@proveedor.com', 'correo'),(2, 'contactoB@proveedor.com', 'correo'),(3, 'contactoC@proveedor.com', 'correo'),(4, 'contactoD@proveedor.com', 'correo'),(5, 'contactoE@proveedor.com', 'correo');

INSERT INTO proveedores_telefono (proveedor_id, telefono, telefono_type, telefono_prefijo) VALUES (1, '3101112233', 'móvil', '+57'),(2, '3204445566', 'fijo', '+57'),(3, '3102223344', 'móvil', '+57'),(4, '3113334455', 'fijo', '+57'),(5, '3124445566', 'móvil', '+57');

INSERT INTO proveedores_empleados (empleado_id, proveedor_id) VALUES (1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 1),(7, 2); 