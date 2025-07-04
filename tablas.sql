
-- Creación de la base de datos
CREATE DATABASE vtaszfs;
USE vtaszfs;

-- Tabla Clientes
CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL
) ENGINE=INNODB;

-- tabla de normalizacion de correos de clientes
CREATE TABLE clientes_correo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  email_name VARCHAR(30) NOT NULL,
  email_type VARCHAR(30),
  CONSTRAINT fk_cliente_id_clientes_correo FOREIGN KEY (cliente_id) REFERENCES clientes(id)
) ENGINE=INNODB;

-- normalizacion para los numeros de telefono de clientes
CREATE TABLE clientes_telefono (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  telefono VARCHAR(30) NOT NULL,
  telefono_type VARCHAR(30),
  telefono_prefijo VARCHAR(5),
  CONSTRAINT fk_cliente_id_clientes_telefono FOREIGN KEY (cliente_id) REFERENCES clientes(id)
) ENGINE=INNODB;

-- tabla paises
CREATE TABLE paises (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pais_name VARCHAR(30) UNIQUE NOT NULL
) ENGINE=INNODB;

-- -- tabla estados
CREATE TABLE estados (
  id INT PRIMARY KEY AUTO_INCREMENT,
  estado_name VARCHAR(30) UNIQUE NOT NULL,
  pais_id INT NOT NULL,
  CONSTRAINT fk_pais_id_estados FOREIGN KEY (pais_id) REFERENCES paises(id)
) ENGINE=INNODB;

-- tabla ciudades
CREATE TABLE ciudades (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ciudad_name VARCHAR(30) UNIQUE NOT NULL,
  estado_id INT NOT NULL,
  CONSTRAINT fk_estado_id_ciudades FOREIGN KEY (estado_id) REFERENCES estados(id)
) ENGINE=INNODB;

-- Tabla clientes_ubicacion
CREATE TABLE clientes_ubicacion (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  ciudad_id INT NOT NULL, 
  direccion VARCHAR(80),
  codigo_postal VARCHAR(20),
  descripcion VARCHAR(255),
  CONSTRAINT fk_cliente_id_clientes_ubicacion FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  CONSTRAINT fk_ciudad_id_clientes_ubicacion FOREIGN KEY (ciudad_id) REFERENCES ciudades(id) 
) ENGINE=INNODB;

-- tabla de ubicaciones generica
CREATE TABLE ubicaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ciudad_id INT NOT NULL,
  direccion VARCHAR(80),
  codigo_postal VARCHAR(20),
  descripcion VARCHAR(255),
  CONSTRAINT fk_ciudad_id_ubicaciones FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
);

-- Tabla puestos
CREATE TABLE puestos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre_puesto VARCHAR(40) NOT NULL
) ENGINE=INNODB;

-- Tabla empleados
CREATE TABLE empleados (
  id INT PRIMARY KEY AUTO_INCREMENT,
  puesto_id INT,
  nombre VARCHAR(50) NOT NULL,
  salario DECIMAL(10, 2) NOT NULL,
  fecha_contratacion DATE NOT NULL,
  CONSTRAINT fk_puesto_id_empleados FOREIGN KEY (puesto_id) REFERENCES puestos(id)
) ENGINE=INNODB;

-- Tabla datos_empleados
CREATE TABLE datos_empleados (
  id INT PRIMARY KEY AUTO_INCREMENT,
  empleado_id INT,
  direccion VARCHAR(80) UNIQUE NOT NULL,
  estado_civil VARCHAR(20) NOT NULL,
  CONSTRAINT fk_empleado_id_datos_empleados FOREIGN KEY (empleado_id) REFERENCES empleados(id)
) ENGINE=INNODB;

-- Tabla datos_empleados_correo
CREATE TABLE datos_empleados_correo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  datos_empleado_id INT,
  email_type VARCHAR(50) NOT NULL,
  email_name VARCHAR(50) NOT NULL,
  CONSTRAINT fk_datos_empleado_id_datos_empleados_correo FOREIGN KEY (datos_empleado_id) REFERENCES datos_empleados(id)
) ENGINE=INNODB;

-- Tabla datos_empleados_telefono
CREATE TABLE datos_empleados_telefono (
  id INT PRIMARY KEY AUTO_INCREMENT,
  datos_empleado_id INT,
  telefono VARCHAR(30) NOT NULL,
  telefono_type VARCHAR(30) NOT NULL,
  telefono_prefijo VARCHAR(5) NOT NULL,
  CONSTRAINT fk_datos_empleado_id_datos_empleados_telefono FOREIGN KEY (datos_empleado_id) REFERENCES datos_empleados(id)
) ENGINE=INNODB;

-- Tabla Pedidos
CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  fecha DATE NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  descripcion VARCHAR(255),
  CONSTRAINT fk_cliente_id_pedidos FOREIGN KEY (cliente_id) REFERENCES clientes(id)
) ENGINE=INNODB;

-- Tabla Proveedores
CREATE TABLE proveedores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(255) NOT NULL,
  ciudad_id INT NOT NULL,
  CONSTRAINT fk_ciudad_id_proveedores FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
) ENGINE=INNODB;

-- Tabla TiposProductos
CREATE TABLE producto_tipo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre_tipo VARCHAR(80) UNIQUE NOT NULL,
  descripcion VARCHAR(255) UNIQUE NOT NULL
) ENGINE=INNODB;

-- Tabla Productos
CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  proveedor_id INT NOT NULL,
  producto_tipo_id INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  CONSTRAINT fk_proveedor_id_productos FOREIGN KEY (proveedor_id) REFERENCES proveedores(id),
  CONSTRAINT fk_producto_tipo_id_productos FOREIGN KEY (producto_tipo_id) REFERENCES producto_tipo(id)
) ENGINE=INNODB;

-- Tabla DetallesPedido
CREATE TABLE pedidos_detalle (
  pedido_id INT,
  producto_id INT,
  PRIMARY KEY(pedido_id, producto_id),
  cantidad INT,
  precio_unitario DECIMAL(10, 2),
  CONSTRAINT fk_pedido_id_pedidos_detalle FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  CONSTRAINT fk_producto_id_pedidos_detalle FOREIGN KEY (producto_id) REFERENCES productos(id)
) ENGINE=INNODB;

-- tabla pedidos_historial
CREATE TABLE pedidos_historial (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  cambio_fecha DATETIME NOT NULL,
  cambio_total DECIMAL(10, 2) NOT NULL,
  cambio_descripcion VARCHAR(255) NOT NULL,
  CONSTRAINT fk_pedido_id_pedidos_historial FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
) ENGINE=INNODB;

-- Tabla Proveedores
CREATE TABLE proveedores_contacto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  proveedor_id INT,
  contacto VARCHAR(100) UNIQUE NOT NULL,
  tipo_contacto VARCHAR(50),
  CONSTRAINT fk_proveedor_id_proveedores_contacto FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
) ENGINE=INNODB;

-- Tabla Proveedores
CREATE TABLE proveedores_telefono (
  id INT PRIMARY KEY AUTO_INCREMENT,
  proveedor_id INT,
  telefono VARCHAR(30) NOT NULL,
  telefono_type VARCHAR(30) NOT NULL,
  telefono_prefijo VARCHAR(5) NOT NULL,
  CONSTRAINT fk_proveedor_id_proveedores_telefono FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
) ENGINE=INNODB;

-- Tabla Proveedores
CREATE TABLE proveedores_empleados (
  empleado_id INT,
  proveedor_id INT,
  PRIMARY KEY (empleado_id, proveedor_id),
  CONSTRAINT fk_empleado_id_proveedores_empleados FOREIGN KEY (empleado_id) REFERENCES empleados(id),
  CONSTRAINT fk_proveedor_id_proveedores_empleados FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
) ENGINE=INNODB;

CREATE TABLE jerarquia_tipos (
  tipo_id INT,
  padre_id INT, 
  PRIMARY KEY (tipo_id, padre_id),
  CONSTRAINT fk_tipo_id_jerarquia_tipos FOREIGN KEY (tipo_id) REFERENCES producto_tipo(id),
  CONSTRAINT fk_padre_id_jerarquia_tipos FOREIGN KEY (padre_id) REFERENCES producto_tipo(id)
) ENGINE=INNODB;