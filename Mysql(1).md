[TOC]



# SQL

**Structured Query Language** (Lenguaje de Consulta Estructurado), es un lenguaje de programación diseñado para gestionar y manipular bases de datos relacionales. A través de SQL, una persona puede realizar una amplia variedad de operaciones sobre las bases de datos, como consultar, insertar, actualizar o eliminar datos.

Este lenguaje se utiliza en sistemas de bases de datos como MySQL, PostgreSQL, Oracle, SQL Server, entre otros. SQL permite interactuar con los datos de manera eficiente, permitiendo, por ejemplo, recuperar información específica de grandes conjuntos de datos, establecer relaciones entre diferentes tablas o crear y modificar la estructura de una base de datos.

SQL está compuesto por varios tipos de instrucciones, como:

- **DDL (Data Definition Language)**: Para definir y modificar la estructura de la base de datos (e.g., `CREATE`, `ALTER`, `DROP`).
- **DML (Data Manipulation Language)**: Para manipular los datos (e.g., `INSERT`, `UPDATE`, `DELETE`, `SELECT`).
- **DCL (Data Control Language)**: Para controlar el acceso a los datos (e.g., `GRANT`, `REVOKE`).
- **TCL (Transaction Control Language)**: Para manejar transacciones (e.g., `COMMIT`, `ROLLBACK`).

SQL es ampliamente utilizado en el desarrollo de aplicaciones empresariales y sitios web que requieren manejar grandes cantidades de datos, facilitando la interacción y gestión de la información de manera estructurada y eficiente.

### **DDL (Data Definition Language) - Lenguaje de Definición de Datos**

El DDL se utiliza para definir y modificar la estructura de las bases de datos, como crear o eliminar tablas, índices y otras estructuras. Las sentencias DDL no manipulan los datos propiamente dichos, sino la estructura de la base de datos.

**Principales comandos DDL:**

**CREATE**
Crea una nueva tabla, índice, base de datos o vista.

  ```sql
  CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
  );
  ```

ALTER
Modifica la estructura de una tabla existente (agregar, eliminar columnas o modificar sus propiedades).

  ```sql
  ALTER TABLE Clientes ADD direccion VARCHAR(100);
  ```

DROP

Elimina una tabla o base de datos, destruyendo completamente su estructura y datos.

```
DROP TABLE Clientes;
```

TRUNCATE

Elimina todos los registros de una tabla, pero conserva su estructura.

```
TRUNCATE TABLE Clientes;
```

### **DML (Data Manipulation Language) - Lenguaje de Manipulación de Datos**

El DML se utiliza para gestionar los datos dentro de las estructuras definidas por el DDL. Este tipo de comandos permite insertar, actualizar, eliminar y recuperar datos de las tablas.

**Principales comandos DML:**

INSERT

Inserta nuevos registros en una tabla.

```
INSERT INTO Clientes (id, nombre) VALUES (1, 'Juan Perez');
```

UPDATE

Actualiza los valores de campos existentes en los registros.

```
UPDATE TABLA SET nombre = 'Carlos Martinez' WHERE id = 1;
```

DELETE

Elimina registros de una tabla según una condición.

```
DELETE FROM Clientes WHERE id = 1;
```

SELECT

Recupera datos de una o más tablas.

```
SELECT nombre FROM Clientes WHERE id = 1;
```

### **DCL (Data Control Language) - Lenguaje de Control de Datos**

El DCL se utiliza para controlar el acceso a los datos en la base de datos. A través de estos comandos, es posible otorgar o revocar permisos a usuarios o grupos, asegurando que solo los usuarios autorizados puedan acceder a ciertos datos o realizar ciertas operaciones.

**Principales comandos DCL:**

GRANT

Otorga permisos a usuarios para realizar acciones específicas en la base de datos (como SELECT, INSERT, DELETE).

```
GRANT SELECT, INSERT ON Clientes TO 'usuario1';
```

REVOKE

Revoca permisos previamente otorgados.

```
REVOKE INSERT ON Clientes FROM 'usuario1';
```

### **TCL (Transaction Control Language) - Lenguaje de Control de Transacciones**

El TCL se utiliza para manejar transacciones dentro de una base de datos. Las transacciones son grupos de operaciones que deben ejecutarse como una única unidad, garantizando que todas las operaciones tengan éxito o, en caso de fallo, todas se reviertan.

**Principales comandos TCL:**

COMMIT

Confirma una transacción, haciendo permanentes todos los cambios realizados.

```
COMMIT;
```

ROLLBACK

Deshace todas las operaciones realizadas desde el último  COMMIT, revirtiendo la base de datos al estado anterior.

```
ROLLBACK;
```

SAVEPOINT

Establece un punto de guardado dentro de una transacción, permitiendo hacer un rollback parcial hasta ese punto específico.

```
SAVEPOINT savepoint1;
```

RELEASE SAVEPOINT

Elimina un savepoint específico.

```
RELEASE SAVEPOINT savepoint1;
```

# MYSQL

MySQL es un  sistema manejador de bases de datos de libre uso y distribución bajo licencia GPL de los más utilizados y que está disponible para varios sistemas operativos  (DUBOIS, 2009).
Su popularidad se debe principalmente a su licencia libre y a su facilidad de uso y administración. Por otra parte ha sido integrada con otras herramientas libres como son Linux, Apache,PHP, entre otras. Esta combinación e integración de tecnologías dio nombre a la plataforma de desarrollo conocida como LAMP (Linux, Apache, MySQL y PHP).
En años recientes MySQL fue adquirida por Sun Microsystems que luego fue adquirida por Oracle. Lo anterior no signiﬁca que Mysql deje de ser libre ya que su desarrollo está bajo la licencia GPL. Sin embargo, Oracle ofrece otras versiones de MySQL orientadas a empresas con modelo de licenciamiento de pago.
Para una mejor compresión del recurso es necesario que el aprendiz haya estudiado los recursos de introducción al lenguaje SQL de la actividad de proyecto 6.
Para el desarrollo de este recurso se requiere que se tenga instalado el MySQL en el computador del aprendiz. Para apoyar la instalación existe un video tutorial en el área de materiales de la actividad de proyecto 6.

## **MySQL como manejador de bases de datos (SGBD) presenta las siguientes características (DUBOIS,2009)**

![](https://i.ibb.co/MRjHNDQ/image.png)

## Tipos de datos.

### Numericos

| **TIPO**           | **Bytes** | **Valor Mínimo (Con signo/Sin signo)**                | **Valor Máximo (Con signo/Sin signo)**     |
| ------------------ | --------- | ----------------------------------------------------- | ------------------------------------------ |
| TINYINT            | 1         | -128 / 0                                              | 127 / 255                                  |
| BIT (BOOL,BOOLEAN) |           | Número entero con valor 0 o 1. Sinónimo de TINYINT(1) |                                            |
| SMALLINT           | 2         | -32768 / 0                                            | 32767 / 65535                              |
| MEDIUMINT          | 3         | -8388608 / 0                                          | 8388607 / 16777215                         |
| INT                | 4         | -2147483648 / 0                                       | 2147483647 / 4294967295                    |
| BIGINT             | 8         | -9.223.372.036.854.775.808 / 0                        | 9223372036854775807 / 18446744073709551615 |

| **Tipo**        | **Tamaño**                                                   |
| --------------- | ------------------------------------------------------------ |
| FLOAT (m,d)     | Contiene un número en coma flotante de precisión sencilla. El valor M es la anchura a mostrar y D es el número de decimales. |
| DOUBLE (m,d)    | Contiene un número en coma flotante de precisión doble. Igual que FLOAT, la diferencia es el rango de valores posibles. |
| DECIMAL (m[,d]) | Se usan para guardar valores para los que es importante preservar una precisión exacta, por ejemplo con datos monetarios. Ejemplo: salario DECIMAL(5,2). Si se omite D, el valor por defecto es 0, los valores no tendrán punto decimal ni decimales. |

### Cadena

| **Tipo**                | **Tamaño**                                                   | **Sintaxis**               |
| ----------------------- | ------------------------------------------------------------ | -------------------------- |
| CHAR (M)                | Los valores válidos para M son de 0 a 255 caracteres. Contiene una cadena de longitud constante. Para mantener la longitud de la cadena, se rellena a la derecha con espacios. Estos espacios se eliminan al recuperar el valor. | PacIdentificacion CHAR(10) |
| VARCHAR (M)             | Los valores válidos para M son de 0 a 255 caracteres. Contiene una cadena de longitud variable. Los espacios al final se eliminan. | PacNombres VARCHAR(50)     |
| BLOB                    | Una longitud máxima de 65.535 caracteres. Válido para objetos binarios como imágenes, ficheros de texto, audio o video. | PacImagenFoto BLOB         |
| TEXT                    | Una longitud máxima de 65.535 caracteres. Sirve para almacenar texto plano sin formato. Distingue entre minúsculas y mayúsculas. | PacDescripcion TEXT        |
| TINYBLOB / TINYTEXT     | Longitud máxima de 255 caracteres.                           |                            |
| MEDIUMBLOB / MEDIUMTEXT | Longitud máxima de 16.777.215 caracteres.                    |                            |
| LONGBLOB / LONGTEXT     | Longitud máxima de 4.294.967.298 caracteres.                 |                            |

### Fecha

| **TIPO**  | **RANGO**                                                    | **FORMATO**         |
| --------- | ------------------------------------------------------------ | ------------------- |
| DATE      | Válido para almacenar una fecha con año, mes y día. Su rango oscila entre: ‘1000-01-01’ y ‘9999-12-31’. | AAAA-MM-DD          |
| DATETIME  | Almacena una fecha y una hora. Su rango oscila entre ‘1000-01-01 00:00:00’ y ‘9999-12-31 23:59:59’. | AAAA-MM-DD HH:MM:SS |
| TIME      | Una hora. El rango está entre '-838:59:59' y '838:59:59'.    | HH:MM:SS            |
| TIMESTAMP | Almacena una fecha y hora UTC. El rango está entre ‘1970-01-01 00:00:00’ y algún momento del año 2037. | AAAA-MM-DD HH:MM:SS |

## Modiﬁcadores - Restricciones

| **MODIFICADOR** | **USO**                                                      | **TIPO DE CAMPO QUE APLICA** |
| --------------- | ------------------------------------------------------------ | ---------------------------- |
| AUTO_INCREMENT  | El valor se va incrementando automáticamente en cada registro (1, 2, 3, etc.). | Enteros                      |
| DEFAULT         | Coloca un valor por defecto (el valor se coloca justo detrás de esta palabra). | Todos excepto TEXT y BLOB    |
| NOT NULL        | Impide que un campo sea nulo.                                | Todos                        |
| PRIMARY KEY     | Hace que el campo se considere llave primaria.               | Todos                        |
| UNIQUE          | Evita la repetición de valores.                              | Todos                        |

# COMANDOS SQL MYSQL

## **Comandos ddl Administración de base de datos**

Cuando se inicia sesión en un servidor de base de datos MySQL utilizando la herramienta cliente mysql sin especificar un nombre de base de datos, el servidor MySQL establecerá la base de datos actual en NULL.

Primero, acceda a MySQL como el usuario root:

```
mysql -u root -p
```

### Seleccionar base de datos

```sql
USE database_name;
```

### Crear base de datos

```sql
CREATE DATABASE [IF NOT EXISTS] database_name
[CHARACTER SET charset_name]
[COLLATE collation_name];
```

**Explicación**

- Primero, se debe especificar el nombre de la base de datos después de las palabras clave `CREATE DATABASE`. El nombre de la base de datos debe ser único dentro de la instancia del servidor MySQL. Si se intenta crear una base de datos con un nombre que ya existe, MySQL generará un error.
- En segundo lugar, se puede utilizar la opción `IF NOT EXISTS` para crear la base de datos de manera condicional, solo si no existe previamente.
- Finalmente, se debe definir el conjunto de caracteres y la intercalación (collation) para la nueva base de datos. Si no se incluyen las cláusulas `CHARACTER SET` y `COLLATE`, MySQL utilizará el conjunto de caracteres y la intercalación predeterminados para la nueva base de datos.

Antes de crear una base de datos verifique con el comando **SHOW DATABASES;** que la base de datos no exista.

Ejemplo

```sql
CREATE DATABASE testdb;
```

### Eliminar base de datos

```sql
DROP DATABASE [IF EXISTS] database_name;
```

En MySQL, el esquema es sinónimo de la base de datos. Por lo tanto, se pueden usar de manera intercambiable.

```sql
DROP SCHEMA [IF EXISTS] database_name;
```

Ejemplo

```sql
DROP DATABASE testdb;
```

## Comandos de administración de tablas

### Crear tabla

```sql
CREATE TABLE [IF NOT EXISTS] table_name(
   column1 datatype constraints,
   column2 datatype constraints,
   ...
) ENGINE=storage_engine;
```

- **table_name**: Este es el nombre de la tabla que se desea crear. 
- **column1, column2**, etc.: Los nombres de las columnas en la tabla. 
- **datatype**: El tipo de datos de cada columna, como INT, VARCHAR, DATE, etc. 
- **constraints**: Estas son restricciones opcionales como NOT NULL, UNIQUE, PRIMARY KEY y FOREIGN KEY.

Ejemplo

```sql
CREATE TABLE tasks (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE
);
```

Si se desea visualizar todas las tablas que se encuentran creadas en la base de datos use el comando **SHOW TABLES;**

### Renombrar tablas

```sql
RENAME TABLE table_name
TO new_table_name;
//Ejemplo
RENAME TABLE employees TO people;
```

### Agregar columnas

```sql
ALTER TABLE table_name
ADD COLUMN new_column_name data_type 
[FIRST | AFTER existing_column];
```

Ejemplo

```sql
ALTER TABLE vendors
ADD COLUMN phone VARCHAR(15) AFTER name;

ALTER TABLE vendors
ADD COLUMN vendor_group INT NOT NULL;
```

Si desea visualizar la estructura de una tabla en mysql puede usar el comando DESC.

```SQL
DESC vendors;
DESCRIBE table_name;
```

### Eliminar columnas

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

Si desea eliminar multiples columas use la siguiente sintaxis:

```sql
ALTER TABLE table_name
DROP COLUMN column_name_1,
DROP COLUMN column_name_2,
...;
```

Ejemplo

```sql
ALTER TABLE posts
DROP COLUMN excerpt;
```

### Tablas temporales en Mysql

En MySQL, una tabla temporal es un tipo especial de tabla que permite almacenar un conjunto de resultados temporales, los cuales se pueden reutilizar varias veces en una misma sesión.

Una tabla temporal es útil cuando es imposible o costoso consultar datos que requieren una única instrucción `SELECT`. En tales casos, puedes usar una tabla temporal para almacenar el resultado inmediato y luego utilizar otra consulta para procesarlo.

Una tabla temporal en MySQL tiene las siguientes características:

- Una tabla temporal se crea utilizando la instrucción `CREATE TEMPORARY TABLE`. Observa que la palabra clave `TEMPORARY` se agrega entre las palabras clave `CREATE` y `TABLE`.
- MySQL elimina la tabla temporal automáticamente cuando la sesión finaliza o la conexión se termina. También puedes usar la instrucción `DROP TABLE` para eliminar explícitamente una tabla temporal cuando ya no la estés utilizando.
- Una tabla temporal solo está disponible y accesible para el cliente que la crea. Clientes diferentes pueden crear tablas temporales con el mismo nombre sin causar errores porque solo el cliente que la crea puede verla. Sin embargo, en la misma sesión, dos tablas temporales no pueden compartir el mismo nombre.
- Una tabla temporal puede tener el mismo nombre que una tabla regular en la base de datos. Por ejemplo, si creas una tabla temporal llamada `employees` en la base de datos de ejemplo, la tabla existente `employees` se volverá inaccesible. Cualquier consulta que realices contra la tabla `employees` ahora se referirá a la tabla temporal `employees`. Cuando elimines la tabla temporal `employees`, la tabla regular `employees` estará disponible nuevamente.
- Aunque una tabla temporal puede tener el mismo nombre que una tabla regular, no se recomienda hacerlo, ya que esto puede generar confusión y, potencialmente, causar una pérdida de datos inesperada.

Por ejemplo, si la conexión al servidor de base de datos se pierde y te reconectas automáticamente, no podrás diferenciar entre la tabla temporal y la tabla regular.

En ese caso, podrías emitir una instrucción `DROP TABLE` para eliminar la tabla permanente en lugar de la tabla temporal, lo cual no es lo esperado.

Para evitar este problema, puedes usar la instrucción `DROP TEMPORARY TABLE` para eliminar una tabla temporal en lugar de la instrucción `DROP TABLE`.

#### Crear tabla temporal

```sql
CREATE TEMPORARY TABLE table_name(
   column1 datatype constraints,
   column1 datatype constraints,
   ...,
   table_constraints
);
```

Si se desea crear una tabla temporal basada en otra tabla puede usar el siguiente comando:

```sql
CREATE TEMPORARY TABLE temp_table_name
SELECT * FROM original_table
LIMIT 0;
```

Ejemplo

```sql
CREATE TEMPORARY TABLE credits(
  customerNumber INT PRIMARY KEY, 
  creditLimit DEC(10, 2)
);
```

En mysql puede insertar datos de otra tabla usando consultas select

```sql
INSERT INTO credits(customerNumber, creditLimit)
SELECT 
  customerNumber, 
  creditLimit 
FROM 
  customers 
WHERE 
  creditLimit > 0;
```

Creación de una tabla temporal basado en una query

```sql
CREATE TEMPORARY TABLE top_customers
SELECT p.customerNumber, 
       c.customerName, 
       ROUND(SUM(p.amount),2) sales
FROM payments p
INNER JOIN customers c ON c.customerNumber = p.customerNumber
GROUP BY p.customerNumber
ORDER BY sales DESC
LIMIT 10;
```

#### Eliminar una tabla temporal

```sql
DROP TEMPORARY TABLE table_name;
```

Ejemplo

```sql
DROP TEMPORARY TABLE top_customers;
```

## Constraints (Restricciones)

#### MySQL primary key

##### Crear llave primaria

```
CREATE TABLE table_name(
   column1 datatype PRIMARY KEY,
   column2 datatype, 
   ...
);
```

```
CREATE TABLE table_name(
   column1 datatype,
   column2 datatype, 
   ...,
   PRIMARY KEY(column1)
);
```

##### Llaves primarias compuestas

```
CREATE TABLE table_name(
   column1 datatype,
   column2 datatype,
   column3 datatype,
   ...,
   PRIMARY KEY(column1, column2)
);
```

##### **Agregar llave primaria a una tabla existente**

```
ALTER TABLE table_name
ADD PRIMARY KEY(column1, column2, ...);
```

##### Eliminar una llave primaria

```
ALTER TABLE table_name
DROP PRIMARY KEY;
```

Ejemplos

```sql
CREATE TABLE products(
   id INT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);
```

### AUTO_INCREMENT

`AUTO_INCREMENT` en MySQL es una propiedad que se asigna a una columna, usualmente de tipo entero, para que su valor se incremente automáticamente cada vez que se inserta un nuevo registro en la tabla. Se utiliza comúnmente en columnas que funcionan como claves primarias (`PRIMARY KEY`), ya que asegura que cada fila tenga un identificador único sin necesidad de especificar el valor manualmente.

#### Características de `AUTO_INCREMENT`:

1. **Generación automática**: MySQL asigna automáticamente un valor único a la columna para cada nueva fila insertada, empezando por 1 y aumentando en 1 (o el valor que se defina) para cada nuevo registro.
2. **Solo para una columna**: En una tabla, solo una columna puede tener el atributo `AUTO_INCREMENT`.
3. **Uso común**: Se utiliza principalmente en campos de tipo `INT` o `BIGINT` que sirven como identificadores únicos.
4. **Valor por defecto**: Si no se especifica un valor para la columna `AUTO_INCREMENT` al insertar un registro, MySQL asignará el siguiente número en la secuencia.

Ejemplos

```sql
CREATE TABLE products(
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL
);
```

```sql
CREATE TABLE faviorites(
    customer_id INT,
    product_id INT,
    favorite_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(customer_id, product_id)
);
```

### MySQL foreign key

Una clave foránea es una columna o un grupo de columnas en una tabla que se vincula a una columna o grupo de columnas en otra tabla. La clave foránea impone restricciones sobre los datos en las tablas relacionadas, lo que permite a MySQL mantener la integridad referencial.

```sql
[CONSTRAINT constraint_name]
FOREIGN KEY [foreign_key_name] (column_name, ...)
REFERENCES parent_table(colunm_name,...)
[ON DELETE reference_option]
[ON UPDATE reference_option]
```

MySQL tiene cinco opciones de referencia: `CASCADE`, `SET NULL`, `NO ACTION`, `RESTRICT` y `SET DEFAULT`.

- **CASCADE**: Si una fila de la tabla padre se elimina o actualiza, los valores de las filas correspondientes en la tabla hija se eliminan o actualizan automáticamente.
- **SET NULL**: Si una fila de la tabla padre se elimina o actualiza, los valores de la columna (o columnas) de clave foránea en la tabla hija se establecen en `NULL`.
- **RESTRICT**: Si una fila de la tabla padre tiene una fila coincidente en la tabla hija, MySQL rechaza la eliminación o actualización de las filas en la tabla padre.
- **NO ACTION**: Es lo mismo que `RESTRICT`.
- **SET DEFAULT**: Es reconocido por el analizador de MySQL. Sin embargo, esta acción es rechazada tanto por las tablas InnoDB como NDB.

```sql
ALTER TABLE regions
ADD COLUMN countryId INT(11);

ALTER TABLE tabla
ADD FOREIGN KEY (fk) REFERENCES tablaPadre(pk);

ALTER TABLE tabla
ADD CONSTRAINT NombreConstraint
FOREIGN KEY (fk) REFERENCES tablaPadre(pk);
```

Ejemplos

```sql
CREATE TABLE categories(
  categoryId INT AUTO_INCREMENT PRIMARY KEY, 
  categoryName VARCHAR(100) NOT NULL
) ENGINE = INNODB;

CREATE TABLE products(
  productId INT AUTO_INCREMENT PRIMARY KEY, 
  productName VARCHAR(100) NOT NULL, 
  categoryId INT, 
  CONSTRAINT fk_category FOREIGN KEY (categoryId) REFERENCES categories(categoryId)
) ENGINE = INNODB;

```

**CASCADE action**

```sql
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
    REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB;
```

### MySQL UNIQUE

En MySQL, **`UNIQUE`** es una restricción que se utiliza para asegurar que todos los valores en una columna o conjunto de columnas sean únicos, es decir, no se repitan dentro de una tabla. Esta restricción garantiza que no haya dos filas con el mismo valor en la(s) columna(s) que tienen la restricción `UNIQUE`.

#### Características de `UNIQUE`:

1. **Valores únicos**: No permite que se repitan valores en la columna o combinación de columnas a las que se aplica.
2. **Múltiples valores `NULL` permitidos**: A diferencia de la clave primaria (`PRIMARY KEY`), una columna `UNIQUE` puede contener varios valores `NULL` porque `NULL` no se considera un valor repetido.
3. **Índice automático**: Al aplicar `UNIQUE` a una columna, MySQL crea automáticamente un índice único en esa columna, lo que ayuda a mejorar el rendimiento de las consultas que buscan valores en esa columna.

```
CREATE TABLE table_name(
    ...,
    column1 datatype UNIQUE,
    ...
);
```

```
CREATE TABLE table_name(
   ...
   column1 datatype,
   column2 datatype,
   ...,
   UNIQUE(column1, column2)
);
```

```sql
[CONSTRAINT constraint_name]
UNIQUE(column_list)
```

```sql
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address UNIQUE (name,address)
);
```

```
phone VARCHAR(12) NOT NULL UNIQUE
```

### MySQL CHECK

En MySQL, la restricción **`CHECK`** se utiliza para definir una condición que debe cumplirse para los valores que se insertan o actualizan en una columna. Esta restricción asegura que los datos en una tabla cumplan con ciertos criterios.

```sql
CREATE TABLE nombre_tabla (
    columna1 tipo_dato,
    columna2 tipo_dato CHECK (condición)
);
```

```sql
CREATE TABLE Empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2) CHECK (salario > 0)
);
```

#### Agregar `CHECK` a una tabla existente:

Si se desea agregar una restricción `CHECK` a una tabla que ya ha sido creada, puedes hacerlo con la siguiente instrucción `ALTER TABLE`:

```sql
ALTER TABLE Empleados ADD CONSTRAINT check_salario CHECK (salario > 0);
```

### MySQL NOT NULL

En MySQL, la restricción **`NOT NULL`** se utiliza para garantizar que una columna no pueda contener valores `NULL`. Es decir, cuando una columna tiene la restricción `NOT NULL`, siempre debe recibir un valor válido al insertar o actualizar datos.

#### Características de `NOT NULL`:

1. **Evita valores nulos**: Asegura que la columna siempre tenga un valor y no permita valores nulos (`NULL`).
2. **Obligatorio**: Se debe proporcionar un valor para la columna cuando se inserta una nueva fila o se actualiza una existente.
3. **Combinable**: Puede usarse en combinación con otras restricciones, como `UNIQUE` o `PRIMARY KEY`.

```sql
CREATE TABLE nombre_tabla (
    columna1 tipo_dato NOT NULL,
    columna2 tipo_dato
);
```

```sql
CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100)
);
```



## COMANDOS DML

![](https://i.ibb.co/Qc5sw9j/image.png)

### MySQL SELECT FROM

La instrucción `SELECT` en MySQL te permite recuperar datos de una o más tablas. Aquí tienes la sintaxis básica de una instrucción `SELECT`:

```sql
SELECT columna1, columna2, ...
FROM nombre_tabla;
```

**SELECT**: Especifica las columnas que deseas recuperar de la tabla.

**columna1, columna2, ...**: Las columnas específicas de las que deseas obtener los datos. También puedes usar `*` para seleccionar todas las columnas.

**FROM**: Especifica la tabla de la cual se recuperarán los datos.

**nombre_tabla**: El nombre de la tabla que contiene los datos.

**WHERE**: Una cláusula opcional para filtrar las filas que cumplan con una condición específica.

### MySQL ORDER BY

Cuando se utiliza la instrucción `SELECT` para consultar datos de una tabla, el orden de las filas en el conjunto de resultados no está especificado.

Para ordenar las filas en el conjunto de resultados, se debe agregar la cláusula `ORDER BY` a la instrucción `SELECT`.

```sql
SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;
```

ASC significa ascendente y DESC significa descendente. Se utiliza ASC para ordenar el conjunto de resultados en orden ascendente y DESC para ordenar el conjunto de resultados en orden descendente.

Al ejecutar la instrucción `SELECT` con una cláusula `ORDER BY`, MySQL siempre evalúa la cláusula `ORDER BY` después de las cláusulas `FROM` y `SELECT`.

![](https://i.ibb.co/m6mqmFp/image.png)

​					Obtenido: https://www.mysqltutorial.org/mysql-basics/mysql-order-by/

Ejemplos:

```sql
SELECT 
  contactLastname, 
  contactFirstname 
FROM 
  customers 
ORDER BY 
  contactLastname;
```

![image-20241023101904521](C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241023101904521.png)

```sql
SELECT 
    contactLastname, contactFirstname
FROM
    customers
ORDER BY contactLastname DESC;
```

![image-20241023102028476](C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241023102028476.png)

Si deseas ordenar a los clientes por el apellido en orden descendente y luego por el nombre en orden ascendente, debes especificar tanto `DESC` como `ASC` en estas respectivas columnas de la siguiente manera:

```sql
SELECT 
    contactLastname, contactFirstname
FROM
    customers
ORDER BY contactLastname DESC , contactFirstname ASC;
```

![image-20241023102225165](C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241023102225165.png)

### MySQL WHERE

La cláusula `WHERE` permite especificar una condición de búsqueda para las filas devueltas por una consulta. A continuación se muestra la sintaxis de la cláusula `WHERE`:

```sql
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
```

Una condición de búsqueda puede definirse como una o más expresiones combinadas con operadores lógicos: AND, OR y NOT.

En MySQL, un predicado es una expresión booleana que devuelve TRUE, FALSE o UNKNOWN. La instrucción SELECT devuelve todas las filas del conjunto de resultados que cumplan con la condición WHERE. Además de la instrucción SELECT, la cláusula WHERE puede utilizarse en una instrucción UPDATE o DELETE para indicar qué filas se van a actualizar o eliminar.

Cuando se ejecuta un comando con la cláusula WHERE, MySQL evalúa las condiciones proporcionadas en la cláusula WHERE después de la cláusula FROM, pero antes de la ejecución de las cláusulas SELECT y ORDER BY.

![](https://i.ibb.co/0ZkBCk8/image.png)

Ejemplo

```sql
SELECT
	lastname,
	firstname,
	jobtitle
FROM
	employees
WHERE
	jobtitle = 'Sales Rep';
```

<img src="C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241023102913726.png" alt="image-20241023102913726" style="zoom:67%;" />

```sql
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;
```

<img src="C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241023103028618.png" alt="image-20241023103028618" style="zoom:67%;" />

# FUNCIONES AGREGADAS

Las **funciones agregadas** en MySQL son funciones que realizan cálculos sobre un conjunto de valores y devuelven un único valor. Estas funciones son comúnmente utilizadas en combinación con la cláusula `GROUP BY` para agrupar los resultados y obtener resúmenes de datos.

## Principales funciones agregadas:

**`COUNT()`**:

- Devuelve el número de filas que coinciden con un criterio.

```
SELECT COUNT(*) FROM Empleados;
```

**`SUM()`**:

- Calcula la suma total de una columna de valores numéricos.

```
SELECT SUM(salario) FROM Empleados;
```

**`AVG()`** (Average):

- Calcula el valor promedio de una columna numérica.

```SQL
SELECT AVG(salario) FROM Empleados;
-------------------------------------------
SELECT e.name
FROM empleados AS e
WHERE salario > (SELECT AVG(salario) FROM empleados);
------------------------------------------
SELECT e.name
FROM empleados AS e
WHERE salario > 2000000;
-------------------------------------------
SELECT e.name
FROM empleados AS e
WHERE salario BETWEEN 1000000 AND 2000000;
```

**`MAX()`**:

- Devuelve el valor máximo de una columna.

```
SELECT MAX(salario) FROM Empleados;
----------------------------------------------------
DEP - 		EMPLEADOS
id    		id
descrip		name
			salario
			dep_id
			
SELECT e.name,MAX(e.salario)
FROM empleados AS e
WHERE dep_id IN (SELECT id FROM dep)
```

**`MIN()`**:

- Devuelve el valor mínimo de una columna.

```
SELECT MIN(salario) FROM Empleados;
```

**`GROUP_CONCAT()`**:

- Devuelve una cadena resultante de la concatenación de valores de un grupo, separados por comas (o cualquier otro delimitador).

```
SELECT GROUP_CONCAT(nombre) FROM Empleados;
```

Esto concatena todos los nombres de los empleados en una única cadena separada por comas.

```
SELECT departamento_id, AVG(salario)
FROM Empleados
GROUP BY departamento_id;
```

## **MySQL HAVING**

La cláusula `HAVING` en MySQL se utiliza para filtrar los resultados de una consulta después de que se haya aplicado una agrupación (`GROUP BY`). Es similar a la cláusula `WHERE`, pero mientras `WHERE` filtra filas antes de la agrupación, `HAVING` filtra las agrupaciones generadas.

### Diferencias entre `WHERE` y `HAVING`:

- **`WHERE`**: Filtra las filas individuales antes de agrupar los datos.
- **`HAVING`**: Filtra los resultados después de aplicar la función agregada y la agrupación de los datos.

Sintaxis basica

```sql
SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
```

Ejemplo

Imaginando que se tiene una tabla llamada `Ventas` con las columnas `vendedor_id`, `producto` y `total_venta`, si se desea encontrar a los vendedores cuyos ingresos totales superan los $5000, se haría lo siguiente:

```sql
SELECT vendedor_id, COUNT(producto) AS total_productos_vendidos
FROM Ventas
WHERE total_venta > 5000
GROUP BY vendedor_id
HAVING total_productos_vendidos > 10;
```

Explicación

**`WHERE total_venta > 100`**: Filtra las filas antes de la agrupación, excluyendo aquellas ventas cuyo total sea mayor a $100.

**`GROUP BY vendedor_id`**: Agrupa las ventas por vendedor.

**`HAVING total_productos_vendidos > 10`**: Después de agrupar, filtra aquellos vendedores que han vendido más de 10 productos en total.

Ejemplo

![](https://i.ibb.co/Mk5rNWk/image.png)

Lo siguiente utiliza la cláusula `GROUP BY` para obtener los números de pedido, la cantidad de artículos vendidos por pedido y las ventas totales de cada uno en la tabla `orderdetails`:

```sql
SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM 
  orderdetails 
GROUP BY 
  ordernumber;
```

```
+-------------+------------+----------+
| ordernumber | itemsCount | total    |
+-------------+------------+----------+
|       10100 |        151 | 10223.83 |
|       10101 |        142 | 10549.01 |
|       10102 |         80 |  5494.78 |
|       10103 |        541 | 50218.95 |
+-------------------------------------+
```

Ahora, se puede encontrar qué pedido tiene ventas totales superiores a 1000 utilizando la cláusula `HAVING` de la siguiente manera:

```sql
SELECT 
  ordernumber, 
  SUM(quantityOrdered) AS itemsCount, 
  SUM(priceeach * quantityOrdered) AS total 
FROM 
  orderdetails 
GROUP BY 
  ordernumber 
HAVING 
  total > 1000;
```

![image-20241023123704196](C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241023123704196.png)

El siguiente ejemplo utiliza la cláusula `HAVING` para encontrar pedidos que tienen montos totales mayores a 1000 y contienen más de 600 artículos:

```sql
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(quantityOrdered*priceeach) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING total > 1000 AND itemsCount > 600;
```

![image-20241023124415346](C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241023124415346.png)

> Utilice la cláusula `HAVING` de MySQL junto con la cláusula `GROUP BY` para especificar una condición de filtrado para grupos de filas o agregados.

## MySQL DISTINCT

`DISTINCT` es una palabra clave en SQL utilizada en consultas para eliminar valores duplicados en los resultados. Cuando aplicas `DISTINCT` a una columna o conjunto de columnas en una consulta `SELECT`, el sistema te devolverá únicamente filas con valores únicos, descartando cualquier repetición.

![](https://i.ibb.co/VgcRQ9J/image.png)

```sql
SELECT DISTINCT
    select_list
FROM
    table_name
WHERE 
    search_condition
ORDER BY 
    sort_expression;
```

```sql
SELECT DISTINCT nombre FROM clientes;
```

### Ejemplos

![](https://i.ibb.co/6mGp66V/image.png)

```sql
SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
/* -------------------------------
+-----------+
| lastname  |
+-----------+
| Bondur    |
| Bondur    |
| Bott      |
| Bow       |
| Castillo  |
| Firrelli  |
| Firrelli  |
| Fixter    |
*/
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;
    
+-----------+
| lastname  |
+-----------+
| Bondur    |
| Bott      |
| Bow       |
| Castillo  |
| Firrelli  |

SELECT 
    DISTINCT lastname,fn
FROM
    employees
GROUP BY 
    lastname,fn;
```

Ejemplo Obtenido: https://www.mysqltutorial.org/mysql-basics/mysql-distinct/

### MySQL DISTINCT and NULL values

Cuando especificas una columna que tiene valores NULL en la cláusula DISTINCT, la cláusula DISTINCT mantendrá solo un valor NULL porque considera que todos los valores NULL son iguales.

### MySQL DISTINCT and NULL values

Cuando se especifican varias columnas en la cláusula DISTINCT, esta utilizará la combinación de valores en esas columnas para determinar la unicidad de la fila en el conjunto de resultados.

Por ejemplo, para obtener una combinación única de ciudad y estado de la tabla de clientes, se usa la siguiente consulta:

```mysql
SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
```

## MySQL LIMIT

En MySQL, la cláusula `LIMIT` se utiliza para restringir la cantidad de filas devueltas en los resultados de una consulta `SELECT`. Esto es útil cuando solo se desea ver una parte de los datos, como en la paginación de resultados o cuando se necesita un número específico de registros.

![](https://i.ibb.co/6mpQSC8/image.png)

```sql
SELECT columna1, columna2 FROM tabla LIMIT cantidad_filas;
```

```sql
SELECT * FROM clientes LIMIT 5;
```

### Las cláusulas LIMIT y ORDER BY

De forma predeterminada, la instrucción SELECT devuelve las filas en un orden no especificado. Al añadir la cláusula LIMIT a la instrucción SELECT, las filas devueltas son impredecibles.

Por lo tanto, para asegurarse de que la cláusula LIMIT devuelva un resultado esperado, siempre debe usarse junto con una cláusula ORDER BY de esta manera:

```sql
SELECT 
    select_list
FROM 
    table_name
ORDER BY 
    sort_expression
LIMIT offset, row_count;
```

![](https://i.ibb.co/kXs8Lpz/image.png)

### Uso de MySQL LIMIT para obtener las filas con los valores más altos o más bajos

Esta instrucción utiliza la cláusula LIMIT para obtener los cinco clientes principales que tienen el crédito más alto:

```sql
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;
```

De manera similar, este ejemplo utiliza la cláusula LIMIT para encontrar cinco clientes que tienen los créditos más bajos:

```sql
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit
LIMIT 5;
```



### Uso de `LIMIT` con `OFFSET`

`LIMIT` también permite establecer un `OFFSET`, que indica desde qué fila comenzar a devolver resultados. La sintaxis es:

```sql
SELECT columna1, columna2 FROM tabla LIMIT offset, cantidad_filas;
```

Ejemplo

```sql
SELECT * FROM clientes LIMIT 1, 5;
```

### Uso de la cláusula LIMIT de MySQL para la paginación

Cuando se muestra información en la pantalla, a menudo se quiere dividir las filas en páginas, donde cada página contiene un número limitado de filas, como 10 o 20.

Para calcular el número de páginas, se toma el total de filas y se divide por el número de filas por página. Para obtener las filas de una página específica, se puede usar la cláusula LIMIT.

Esta consulta utiliza la función agregada COUNT(*) para obtener el total de filas de la tabla customers:

```sql
SELECT 
    COUNT(*) 
FROM 
    customers;
```

Supongamos que cada página tiene 10 filas; para mostrar 122 clientes, se tienen 13 páginas. La última, la página 13, contiene solo dos filas. Esta consulta utiliza la cláusula LIMIT para obtener las filas de la página 1, que contiene los primeros 10 clientes ordenados por el nombre del cliente:

```sql
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10;
/-------------------------------------------
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 2;
```

Uso de MySQL LIMIT para obtener el enésimo valor más alto o más bajo. Para obtener el enésimo valor más alto o más bajo, se utiliza la siguiente cláusula LIMIT:

```sql
SELECT column_name
FROM table_name
ORDER BY column_name DESC
LIMIT n - 1, 1;
```

### Cláusulas LIMIT y DISTINCT en MySQL

Si se utiliza la cláusula LIMIT junto con la cláusula DISTINCT, MySQL detiene la búsqueda inmediatamente cuando encuentra el número de filas únicas especificadas en la cláusula LIMIT.

El siguiente ejemplo utiliza la cláusula LIMIT con la cláusula DISTINCT para devolver los primeros cinco estados únicos en la tabla `customers`:

```sql
SELECT DISTINCT state 
FROM customers 
LIMIT 5;
```

# MySQL Aliases

En MySQL, los alias son nombres temporales asignados a columnas o tablas en una consulta. Los alias hacen que los nombres de columnas y tablas sean más fáciles de leer o abreviar, especialmente en consultas complejas. Para crear un alias, se utiliza la palabra clave `AS`, aunque `AS` es opcional en muchos casos.

## Alias para Columnas

Se puede asignar un alias a una columna para cambiar su nombre en el resultado de la consulta.

```sql
SELECT customerName AS name, creditLimit AS credit 
FROM customers;
```

En este caso:

- `customerName` se muestra como `name`.
- `creditLimit` se muestra como `credit`.

## Alias para Tablas

También se pueden asignar alias a tablas, lo cual es útil cuando se usan uniones (joins) o se necesita hacer referencia a la misma tabla varias veces en una consulta.

```sql
SELECT c.customerName, o.orderNumber 
FROM customers AS c
JOIN orders AS o ON c.customerNumber = o.customerNumber;
```

En este caso:

- La tabla `customers` tiene el alias `c`.
- La tabla `orders` tiene el alias `o`.

Los alias simplifican la consulta, especialmente en consultas largas y con múltiples tablas.

## MySQL Join

Introducción a las cláusulas de JOIN en MySQL
Una base de datos relacional consiste en múltiples tablas relacionadas que están vinculadas entre sí mediante columnas comunes, conocidas como columnas de claves foráneas. Debido a esto, los datos en cada tabla son incompletos desde una perspectiva de negocio.

![](https://i.ibb.co/5XDxSKb/image.png)

### Cláusula INNER JOIN en MySQL

La cláusula `INNER JOIN` combina cada fila de una tabla con cada fila de otras tablas y permite consultar filas que contienen columnas de ambas tablas.

`INNER JOIN` es una cláusula opcional de la instrucción `SELECT` y aparece inmediatamente después de la cláusula `FROM`.

```
SELECT column1, column2, ...
FROM table1
INNER JOIN table2 ON table1.common_column = table2.common_column;
```

```sql
SELECT orders.orderNumber, orders.orderDate, orderdetails.productCode, orderdetails.quantityOrdered
FROM orders
INNER JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber;
```

#### Ejemplo

<img src="C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241028122755382.png" alt="image-20241028122755382" style="zoom:67%;" />

En este diagrama, la tabla **products** tiene la columna **productLine** que hace referencia a la columna **productline** de la tabla **productlines**. La columna **productLine** en la tabla **products** se llama columna de clave foránea.

Normalmente, se unen tablas que tienen relaciones de clave foránea, como las tablas **productlines** y **products**.

Supongamos que se desea obtener:

- **productCode** y **productName** de la tabla **products**.
- **textDescription** de las líneas de productos de la tabla **productlines**.

Para hacer esto, se necesita seleccionar datos de ambas tablas emparejando filas según los valores en la columna **productline** usando la cláusula `INNER JOIN`, de la siguiente manera:

```sql
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);
```

#### MySQL INNER JOIN with GROUP BY

<img src="C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241028123231006.png" alt="image-20241028123231006" style="zoom:80%;" />

Esta consulta devuelve el número de pedido, el estado del pedido y las ventas totales de las tablas **orders** y **orderdetails** usando la cláusula `INNER JOIN` junto con la cláusula `GROUP BY`:

```sql
SELECT 
    o.orderNumber,
    o.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders as o
INNER JOIN orderdetails as od
    ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;
```

### MySQL LEFT JOIN

La cláusula `LEFT JOIN` permite recuperar datos de dos o más tablas. Al igual que la cláusula `INNER JOIN`, `LEFT JOIN` es una cláusula opcional de la instrucción `SELECT`, que aparece inmediatamente después de la cláusula `FROM`.

La siguiente instrucción ilustra cómo usar la cláusula `LEFT JOIN` para unir las dos tablas, **t1** y **t2**:

```sql
SELECT t1.column1, t2.column2
FROM t1
LEFT JOIN t2 ON t1.common_column = t2.common_column;
```

En esta consulta:

- `LEFT JOIN` devuelve todas las filas de la tabla **t1**, incluso si no hay coincidencias en la tabla **t2**. Para aquellas filas de **t1** que no tienen coincidencia en **t2**, los resultados de **t2** serán `NULL`.
- `ON t1.common_column = t2.common_column` especifica la condición de unión, indicando cómo las filas de **t1** y **t2** deben relacionarse entre sí.

La cláusula `LEFT JOIN` selecciona datos comenzando desde la tabla izquierda (**t1**), emparejando cada fila de la tabla izquierda (**t1**) con cada fila correspondiente de la tabla derecha (**t2**) según la `join_condition`.

Si las filas de ambas tablas cumplen con la condición de unión, el `LEFT JOIN` combina columnas de ambas tablas en una nueva fila y la incluye en los resultados.

Si una fila de la tabla izquierda (**t1**) no coincide con ninguna fila de la tabla derecha (**t2**), el `LEFT JOIN` aún combina las columnas de ambas tablas en una nueva fila y la incluye en el conjunto de resultados. Sin embargo, rellena las columnas de la fila de la tabla derecha con valores `NULL`.

En esencia, el `LEFT JOIN` devuelve todas las filas de la tabla izquierda, independientemente de si existe o no una fila coincidente en la tabla derecha.

En ausencia de coincidencia, las columnas de la fila de la tabla derecha se llenarán con valores `NULL`.

#### Ejemplo

```sql
SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber;
```

Dado que las tablas **customers** y **orders** comparten el mismo nombre de columna (**customerNumber**) en la condición de unión usando el operador igual, se puede utilizar la sintaxis `USING` de la siguiente manera:

```sql
SELECT customers.customerName, orders.orderNumber
FROM customers
JOIN orders USING (customerNumber);

```

### MySQL RIGHT JOIN

En MySQL, la cláusula `RIGHT JOIN` es similar a `LEFT JOIN`, pero devuelve todas las filas de la tabla derecha, incluso si no hay coincidencias en la tabla izquierda. Si no se encuentra una coincidencia en la tabla izquierda, las columnas de esa tabla se completan con valores `NULL`.

```sql
SELECT 
    select_list
FROM t1
RIGHT JOIN t2 ON 
    join_condition;
```

El `RIGHT JOIN` comienza seleccionando datos desde la tabla derecha (**t2**). Empareja cada fila de la tabla derecha con cada fila de la tabla izquierda. Si ambas filas cumplen la condición de unión (evaluada como `TRUE`), el `RIGHT JOIN` combina las columnas de estas filas en una nueva fila y la incluye en el conjunto de resultados.

Si una fila de la tabla derecha no tiene una fila coincidente en la tabla izquierda, el `RIGHT JOIN` combina las columnas de esa fila de la tabla derecha con valores `NULL` en todas las columnas de la tabla izquierda y la incluye en el conjunto de resultados.

En otras palabras, el `RIGHT JOIN` devuelve todas las filas de la tabla derecha, independientemente de si tienen o no filas coincidentes en la tabla izquierda.

Es importante enfatizar que las cláusulas `RIGHT JOIN` y `LEFT JOIN` son funcionalmente equivalentes y pueden reemplazarse entre sí siempre que se invierta el orden de las tablas.

**Es importante notar que `RIGHT OUTER JOIN` es un sinónimo de `RIGHT JOIN`. Por lo tanto, pueden usarse de manera intercambiable.**

#### Ejemplo

<img src="C:\Users\developer\AppData\Roaming\Typora\typora-user-images\image-20241028125840825.png" alt="image-20241028125840825" style="zoom:80%;" />

La columna **salesRepEmployeeNumber** en la tabla **customers** está vinculada a la columna **employeeNumber** en la tabla **employees**.

Un representante de ventas, o empleado, puede estar a cargo de cero o más clientes. Y cada cliente es atendido por cero o un representante de ventas.

Si el valor en la columna **salesRepEmployeeNumber** es `NULL`, significa que el cliente no tiene ningún representante de ventas.

```sql
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;
```

### Uso de `RIGHT JOIN` en MySQL para encontrar filas no coincidentes

La siguiente instrucción utiliza la cláusula `RIGHT JOIN` para encontrar empleados que no están a cargo de ningún cliente:

```sql
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;
```

### MySQL CROSS JOIN

En MySQL, la cláusula `CROSS JOIN` se utiliza para obtener el producto cartesiano de dos tablas, lo que significa que cada fila de una tabla se combina con cada fila de la otra tabla. Esto resulta en un conjunto de resultados que contiene todas las combinaciones posibles de filas entre las dos tablas.

```sql
SELECT select_list 
FROM t1
CROSS JOIN t2;
```

Para crear una baraja de 52 cartas usando un `CROSS JOIN`, necesitamos combinar dos conjuntos: uno con los **palos** (como corazones, diamantes, tréboles y picas) y otro con los **valores** (como As, 2, 3, ..., 10, J, Q, K).

### Ejemplo

Supongamos que tenemos dos tablas, `suits` y `ranks`, que contienen los palos y los valores respectivamente:

- La tabla `suits` tiene los registros: `Hearts`, `Diamonds`, `Clubs`, `Spades`.
- La tabla `ranks` tiene los registros: `A`, `2`, `3`, ..., `10`, `J`, `Q`, `K`.

```sql
CREATE TABLE suits (
    suit_id INT,
    suit_name VARCHAR(10)
);
CREATE TABLE ranks (
    rank_id INT,
    rank_name VARCHAR(5)
);

INSERT INTO suits (suit_id, suit_name) VALUES
    (1, 'Hearts'),
    (2, 'Diamonds'),
    (3, 'Clubs'),
    (4, 'Spades');

INSERT INTO ranks (rank_id, rank_name) VALUES
    (1, 'Ace'),
    (2, '2'),
    (3, '3'),
    (4, '4'),
    (5, '5'),
    (6, '6'),
    (7, '7'),
    (8, '8'),
    (9, '9'),
    (10, '10'),
    (11, 'Jack'),
    (12, 'Queen'),
    (13, 'King');
```

```sql
SELECT 
  suit_name, 
  rank_name 
FROM 
  suits CROSS 
  JOIN ranks 
ORDER BY 
  suit_name, 
  rank_name;
```

### Ejercicios

```sql
CREATE DATABASE TiendaOnline;
USE TiendaOnline;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(15),
    direccion TEXT
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE detalle_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
);
```

```sql
-- Insertar más clientes (10 registros)
INSERT INTO clientes (nombre, correo, telefono, direccion) VALUES
('Luis Torres', 'luis.t@gmail.com', '3123456789', 'Calle 1, Bogotá'),
('Andrea Ríos', 'andrea.r@gmail.com', '3169876543', 'Carrera 2, Medellín'),
('Fernando Díaz', 'fernando.d@gmail.com', '3101239876', 'Avenida 3, Cali'),
('Laura Méndez', 'laura.m@gmail.com', '3174563210', 'Calle 4, Barranquilla'),
('Miguel Ángel', 'miguel.a@gmail.com', '3117892345', 'Carrera 5, Cartagena'),
('Patricia Guzmán', 'patricia.g@gmail.com', '3186549872', 'Calle 6, Bucaramanga'),
('Ricardo Pérez', 'ricardo.p@gmail.com', '3198765432', 'Carrera 7, Cúcuta'),
('Elena Castro', 'elena.c@gmail.com', '3145678901', 'Calle 8, Manizales'),
('Oscar Gómez', 'oscar.g@gmail.com', '3133456789', 'Carrera 9, Pereira'),
('Camila Vargas', 'camila.v@gmail.com', '3125678904', 'Calle 10, Pasto');

-- Insertar más productos (10 registros)
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Teclado Gamer RGB', 'Teclado mecánico con luces RGB', 70.00, 30),
('Mouse Gaming', 'Mouse óptico con DPI ajustable', 40.00, 50),
('Monitor Curvo', 'Monitor curvo 32 pulgadas', 300.00, 15),
('Impresora Multifuncional', 'Impresora láser con escáner', 150.00, 20),
('Cámara Web HD', 'Cámara web con micrófono integrado', 60.00, 25),
('Smartwatch', 'Reloj inteligente con sensores de salud', 120.00, 35),
('Disco Externo 2TB', 'Disco duro portátil USB 3.0', 95.00, 40),
('Micro SD 128GB', 'Tarjeta de memoria para celulares y cámaras', 25.00, 100),
('Router WiFi 6', 'Router de alta velocidad con 5GHz', 80.00, 18),
('Parlantes Bluetooth', 'Parlantes inalámbricos con bajos potentes', 50.00, 60);

-- Insertar más pedidos (10 registros)
INSERT INTO pedidos (cliente_id, total) VALUES
(1, 140.00),
(2, 320.00),
(3, 225.00),
(4, 500.00),
(5, 760.00),
(6, 280.00),
(7, 390.00),
(8, 420.00),
(9, 150.00),
(10, 300.00);

-- Insertar más detalles de pedidos (20 registros)
INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad, subtotal) VALUES
(1, 11, 2, 140.00),
(2, 12, 4, 160.00),
(2, 13, 2, 160.00),
(3, 14, 3, 225.00),
(4, 15, 5, 300.00),
(4, 16, 2, 200.00),
(5, 17, 4, 380.00),
(5, 18, 2, 50.00),
(5, 19, 3, 240.00),
(6, 20, 2, 160.00),
(6, 11, 2, 120.00),
(7, 12, 3, 120.00),
(7, 13, 1, 80.00),
(7, 14, 1, 190.00),
(8, 15, 2, 120.00),
(8, 16, 3, 300.00),
(9, 17, 1, 95.00),
(9, 18, 2, 50.00),
(10, 19, 2, 160.00),
(10, 20, 2, 140.00);
```

### 📌 **1. Listar todos los pedidos con información del cliente**

```sql
SELECT p.id AS pedido_id, c.nombre AS cliente, c.correo, p.fecha_pedido, p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
ORDER BY p.fecha_pedido DESC;
```

✅ **Muestra:** Todos los pedidos junto con el nombre y correo del cliente que los realizó.

------

### 📌 **2. Ver los productos más vendidos**

```sql
SELECT p.nombre, SUM(dp.cantidad) AS total_vendido
FROM detalle_pedido dp
JOIN productos p ON dp.producto_id = p.id
GROUP BY p.nombre
ORDER BY total_vendido DESC;
```

✅ **Muestra:** Lista de productos ordenados por el número total de unidades vendidas.

------

### 📌 **3. Ver los clientes que más han gastado**

```sql
SELECT c.nombre, c.correo, SUM(p.total) AS total_gastado
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
GROUP BY c.id
ORDER BY total_gastado DESC
LIMIT 5;
```

✅ **Muestra:** Los 5 clientes que han gastado más dinero en compras.

------

### 📌 **4. Ver detalles de un pedido específico**

```sql
SELECT p.id AS pedido_id, c.nombre AS cliente, pr.nombre AS producto, dp.cantidad, dp.subtotal
FROM detalle_pedido dp
JOIN pedidos p ON dp.pedido_id = p.id
JOIN clientes c ON p.cliente_id = c.id
JOIN productos pr ON dp.producto_id = pr.id
WHERE p.id = 1;  -- Cambia el ID del pedido según sea necesario
```

✅ **Muestra:** Todos los productos dentro del pedido con su cantidad y subtotal.

------

### 📌 **5. Calcular el total de ingresos de la tienda**

```sql
SELECT SUM(total) AS ingresos_totales FROM pedidos;
```

✅ **Muestra:** La cantidad total de ingresos generados por la tienda.

------

### 📌 **6. Productos con menos de 10 unidades en stock (bajo inventario)**

```
SELECT nombre, stock 
FROM productos 
WHERE stock < 10;
```

✅ **Muestra:** Lista de productos con inventario bajo.

------

### 📌 **7. Ver los pedidos realizados en el último mes**

```
SELECT p.id, c.nombre AS cliente, p.fecha_pedido, p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
WHERE p.fecha_pedido >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
ORDER BY p.fecha_pedido DESC;
```

✅ **Muestra:** Todos los pedidos hechos en el último mes.

------

### 📌 **8. Ver qué productos nunca han sido comprados**

```
SELECT p.nombre 
FROM productos p
LEFT JOIN detalle_pedido dp ON p.id = dp.producto_id
WHERE dp.producto_id IS NULL;
```

✅ **Muestra:** Lista de productos que nunca han sido vendidos.

------

### 📌 **9. Ver la cantidad de pedidos realizados por cada cliente**

```
SELECT c.nombre, COUNT(p.id) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id
ORDER BY total_pedidos DESC;
```

✅ **Muestra:** Cantidad de pedidos realizados por cada cliente.

------

### 📌 **10. Calcular el precio promedio de los productos**

```
SELECT AVG(precio) AS precio_promedio FROM productos;
```

✅ **Muestra:** El precio promedio de todos los productos en la base de datos.

### 📌 **11. Obtener el pedido con el monto más alto**

```
SELECT p.id AS pedido_id, c.nombre AS cliente, p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
ORDER BY p.total DESC
LIMIT 1;
```

✅ **Muestra:** El pedido con el monto más alto y el cliente que lo realizó.

------

### 📌 **12. Obtener el cliente que ha hecho más pedidos**

```
SELECT c.nombre, c.correo, COUNT(p.id) AS cantidad_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id
ORDER BY cantidad_pedidos DESC
LIMIT 1;
```

✅ **Muestra:** El cliente que más compras ha hecho.

------

### 📌 **13. Listar los pedidos junto con el número de productos en cada uno**

```
SELECT p.id AS pedido_id, c.nombre AS cliente, COUNT(dp.id) AS cantidad_productos
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN detalle_pedido dp ON p.id = dp.pedido_id
GROUP BY p.id
ORDER BY cantidad_productos DESC;
```

✅ **Muestra:** La cantidad de productos en cada pedido.

------

### 📌 **14. Mostrar la fecha en que se realizó el primer y último pedido**

```
SELECT 
    MIN(fecha_pedido) AS primer_pedido,
    MAX(fecha_pedido) AS ultimo_pedido
FROM pedidos;
```

✅ **Muestra:** La primera y última fecha en la que se registraron pedidos.

------

### 📌 **15. Ver cuántos productos diferentes se han vendido en total**

```
SELECT COUNT(DISTINCT producto_id) AS total_productos_vendidos
FROM detalle_pedido;
```

✅ **Muestra:** El número de productos únicos que han sido vendidos al menos una vez.

------

### 📌 **16. Calcular el promedio de productos comprados por pedido**

```
SELECT AVG(cantidad) AS promedio_productos_por_pedido
FROM detalle_pedido;
```

✅ **Muestra:** El número promedio de productos comprados en cada pedido.

------

### 📌 **17. Ver los clientes que han gastado más de $500 en total**

```
SELECT c.nombre, SUM(p.total) AS total_gastado
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id
HAVING total_gastado > 500
ORDER BY total_gastado DESC;
```

✅ **Muestra:** Clientes que han gastado más de $500 en total.

------

### 📌 **18. Ver qué clientes han comprado más de 3 veces**

```
SELECT c.nombre, COUNT(p.id) AS cantidad_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id
HAVING cantidad_pedidos > 3;
```

✅ **Muestra:** Clientes que han hecho más de 3 pedidos.

------

### 📌 **19. Mostrar las ventas agrupadas por mes**

```
SELECT DATE_FORMAT(fecha_pedido, '%Y-%m') AS mes, SUM(total) AS total_ventas
FROM pedidos
GROUP BY mes
ORDER BY mes DESC;
```

✅ **Muestra:** Las ventas totales agrupadas por mes.

------

### 📌 **20. Ver los clientes que NO han realizado compras**

```
SELECT c.nombre, c.correo
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE p.id IS NULL;
```

✅ **Muestra:** Clientes que están registrados pero nunca han realizado un pedido.

------

### 📌 **21. Obtener los ingresos generados por cada producto**

```
SELECT p.nombre, SUM(dp.subtotal) AS ingresos_totales
FROM detalle_pedido dp
JOIN productos p ON dp.producto_id = p.id
GROUP BY p.id
ORDER BY ingresos_totales DESC;
```

✅ **Muestra:** Los productos ordenados por los ingresos generados.

------

### 📌 **22. Ver la cantidad de pedidos hechos en cada ciudad**

```
SELECT c.direccion, COUNT(p.id) AS cantidad_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.direccion
ORDER BY cantidad_pedidos DESC;
```

✅ **Muestra:** Cantidad de pedidos hechos en cada ciudad/dirección.

------

### 📌 **23. Obtener la cantidad de productos comprados por cada cliente**

```
SELECT c.nombre, SUM(dp.cantidad) AS total_productos_comprados
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
JOIN detalle_pedido dp ON p.id = dp.pedido_id
GROUP BY c.id
ORDER BY total_productos_comprados DESC;
```

✅ **Muestra:** Cuántos productos ha comprado cada cliente.

------

### 📌 **24. Mostrar los productos con mayor cantidad de unidades vendidas**

```
SELECT p.nombre, SUM(dp.cantidad) AS total_vendido
FROM productos p
JOIN detalle_pedido dp ON p.id = dp.producto_id
GROUP BY p.id
ORDER BY total_vendido DESC
LIMIT 5;
```

✅ **Muestra:** Los 5 productos más vendidos.

------

### 📌 **25. Ver cuántos pedidos tienen más de 3 productos diferentes**

```
SELECT p.id AS pedido_id, COUNT(DISTINCT dp.producto_id) AS total_productos
FROM pedidos p
JOIN detalle_pedido dp ON p.id = dp.pedido_id
GROUP BY p.id
HAVING total_productos > 3;
```

✅ **Muestra:** Pedidos que contienen más de 3 productos diferentes.

# SUBCONSULTAS

Las **subconsultas** en MySQL son consultas anidadas dentro de otras consultas. Son consultas secundarias que se colocan dentro de la cláusula `SELECT`, `FROM`, `WHERE`, o `HAVING` de otra consulta principal, y su propósito es devolver un conjunto de resultados que luego se utilizan para la consulta externa.

![](https://i.ibb.co/g4sgCJm/image.png)

### Características de las subconsultas:

1. **Dependencia de la consulta externa**: La subconsulta se ejecuta primero, y su resultado es utilizado por la consulta externa.
2. **Niveles de subconsulta**: Una subconsulta puede estar anidada a uno o más niveles.
3. **Puede devolver múltiples valores**: Dependiendo de la cláusula en la que se utilice, una subconsulta puede devolver un solo valor o varios valores.

### Tipos de subconsultas:

**Subconsulta escalar**: Devuelve un solo valor (un solo campo y una sola fila) y puede ser utilizada, por ejemplo, en la cláusula `SELECT` o `WHERE`.

```sql
SELECT nombre, salario
FROM Empleados
WHERE salario > (SELECT AVG(salario) FROM Empleados);
```

**Subconsulta de varias filas**: Devuelve múltiples filas, pero una sola columna, y se utiliza generalmente con operadores como `IN`, `ANY`, o `ALL`.

```sql
SELECT nombre
FROM Empleados
WHERE departamento_id IN (SELECT departamento_id FROM Departamentos WHERE nombre = 'Ventas');

SELECT e.nombre
FROM Empleados AS e
INNER JOIN Oficina as o ON e.idofi = o.ide
WHERE o.nombre = 'Ventas'

```

**Subconsulta correlacionada**: Esta subconsulta se ejecuta por cada fila de la consulta externa y depende de ella.

```sql
SELECT nombre
FROM Empleados E
WHERE salario > (SELECT AVG(salario) FROM Empleados WHERE departamento_id = E.departamento_id);
```

### Uso de subconsultas:

Las subconsultas se puede de la subconsulta como una tabla temporal.

- **En la cláusula `SELECT`**: Para devolver valores calculados.

### Ventajas de las subconsultas:

- Simplifican consultas complejas dividiéndolas en pasos.
- Permiten escribir consultas sin la necesidad de usar múltiples uniones (joins).

Sin embargo, es importante tener en cuenta que las subconsultas pueden afectar el rendimiento en grandes conjuntos de datos, y en algunos casos, una consulta con `JOIN` puede ser más eficiente.

### Estructura de una Subconsulta en la Cláusula WHERE

Una subconsulta en la cláusula `WHERE` generalmente devuelve un valor (o conjunto de valores) que la consulta principal usa para aplicar filtros. Esta subconsulta puede ser correlacionada o no correlacionada:

- **Subconsulta no correlacionada**: La subconsulta se ejecuta independientemente de la consulta principal.
- **Subconsulta correlacionada**: La subconsulta depende de cada fila en la consulta principal.

#### Ejemplo 1: Subconsulta No Correlacionada

Supongamos que tienes dos tablas, `orders` (pedidos) y `customers` (clientes), y deseas encontrar todos los pedidos realizados por clientes que viven en "California".

```
SELECT order_id, customer_id, order_date
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE state = 'California'
);
```

En este ejemplo:

- La subconsulta `(SELECT customer_id FROM customers WHERE state = 'California')` encuentra todos los IDs de clientes que están en California.
- La consulta principal luego recupera solo los pedidos de esos clientes.

#### Ejemplo 2: Subconsulta Correlacionada

Ahora, supongamos que deseas encontrar a todos los empleados que ganan más que el salario promedio en su departamento. Aquí, una subconsulta correlacionada puede ser útil:

```
SELECT employee_id, department_id, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);
```

En este ejemplo:

- La subconsulta `(SELECT AVG(salary) FROM employees WHERE department_id = e.department_id)` calcula el salario promedio dentro de cada departamento.
- La consulta principal filtra los empleados cuyo salario es superior al promedio de sus respectivos departamentos.

```sql
SELECT 
    productname, 
    buyprice
FROM
    products p1
WHERE
    buyprice > (SELECT 
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline);
```



#### Usando Otros Operadores de Comparación

Las subconsultas en la cláusula `WHERE` se pueden combinar con otros operadores como `=`, `<>`, `>`, `<`, `>=`, `<=`, y `EXISTS`. Aquí tienes un ejemplo rápido usando `EXISTS`

```
SELECT order_id, customer_id, order_date
FROM orders o
WHERE EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.customer_id = o.customer_id
    AND c.state = 'California'
);
```

#### Puntos Clave para la Optimización

- **Usa `EXISTS`** para comprobar la existencia en lugar de `IN` si la subconsulta devuelve un conjunto grande de datos.
- **Indexación**: Asegúrate de que los campos usados en las condiciones de la subconsulta estén indexados para un filtrado más rápido.
- **Limita las subconsultas correlacionadas**: Evita subconsultas correlacionadas en conjuntos de datos grandes siempre que sea posible, ya que pueden ralentizar la consulta significativamente.

### Uso del Operador `IN` con una Subconsulta

El operador `IN` permite filtrar resultados según si el valor de un campo coincide con cualquiera de los valores devueltos por una subconsulta. Aquí tienes un ejemplo:

Supongamos que tienes dos tablas, `employees` (empleados) y `departments` (departamentos), y quieres encontrar todos los empleados que trabajan en el departamento de "Ventas" o "Marketing".

```sql
SELECT employee_id, name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('Ventas', 'Marketing')
);
```

En este ejemplo:

- La subconsulta `(SELECT department_id FROM departments WHERE department_name IN ('Ventas', 'Marketing'))` devuelve los IDs de los departamentos de "Ventas" y "Marketing".
- La consulta principal luego encuentra a todos los empleados que trabajan en estos departamentos.

#### Uso del Operador `NOT IN` con una Subconsulta

```
SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);
```

El operador `NOT IN`, en cambio, filtra resultados para encontrar valores que **no coincidan** con ninguno de los valores devueltos por la subconsulta.

Ampliemos el ejemplo anterior para encontrar a todos los empleados que **no** trabajan en los departamentos de "Ventas" o "Marketing":

```sql
SELECT employee_id, name, department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('Ventas', 'Marketing')
);
```

En este ejemplo:

- La subconsulta `(SELECT department_id FROM departments WHERE department_name IN ('Ventas', 'Marketing'))` sigue devolviendo los IDs de los departamentos de "Ventas" y "Marketing".
- La consulta principal ahora excluye a los empleados que trabajan en esos departamentos, mostrando solo aquellos de otros departamentos.

#### Nota Importante sobre `NOT IN` y Valores Nulos



Al usar `NOT IN` con una subconsulta, si alguno de los valores en el resultado de la subconsulta contiene `NULL`, `NOT IN` devolverá **ninguna fila**. Para evitar esto, asegúrate de que la subconsulta no devuelva valores `NULL`. Aquí tienes un ejemplo con una cláusula `WHERE` para filtrar los `NULL` en la subconsulta:

```sql
SELECT employee_id, name, department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('Ventas', 'Marketing')
    AND department_id IS NOT NULL
);
```

Esta consulta ahora excluye departamentos con valores `NULL` en `department_id` de la consideración.

#### Consejos de Optimización

- **Indexación**: Asegúrate de que los campos usados en las condiciones `IN` y `NOT IN` estén indexados.
- **Usar `EXISTS` como Alternativa**: Para conjuntos de datos grandes, `EXISTS` puede ser más eficiente que `IN`, especialmente si la subconsulta tiene muchas filas.

### MySQL subquery in the FROM clause



```
SELECT 
    MAX(items), 
    MIN(items), 
    FLOOR(AVG(items))
FROM
    (SELECT 
        orderNumber, COUNT(orderNumber) AS items
    FROM
        orderdetails
    GROUP BY orderNumber) AS lineitems;
```

En MySQL, usar una subconsulta en la cláusula `FROM` es una técnica que permite utilizar el resultado de una subconsulta como una tabla temporal para la consulta principal. Esto es útil cuando necesitas calcular datos o realizar filtros complejos antes de realizar uniones (`JOIN`) o aplicar más filtros en la consulta principal.

#### Estructura de una Subconsulta en la Cláusula `FROM`

La subconsulta en la cláusula `FROM` actúa como una tabla derivada, y generalmente debe tener un alias para referenciar sus columnas en la consulta principal.

#### Ejemplo Básico de Subconsulta en `FROM`

Supongamos que tienes una tabla `ventas` y quieres encontrar el total de ventas para cada cliente. Puedes hacer esto usando una subconsulta en `FROM` para calcular el total de ventas por cliente y luego seleccionarlo en la consulta principal.

```sql
SELECT cliente_id, total_ventas
FROM (
    SELECT cliente_id, SUM(monto) AS total_ventas
    FROM ventas
    GROUP BY cliente_id
) AS ventas_por_cliente;
```

En este ejemplo:

- La subconsulta `(SELECT cliente_id, SUM(monto) AS total_ventas FROM ventas GROUP BY cliente_id)` calcula el total de ventas por cada cliente.
- La consulta principal luego selecciona el `cliente_id` y `total_ventas` de esta tabla derivada, `ventas_por_cliente`, que es un alias para la subconsulta.

#### Ejemplo con Subconsulta en `FROM` y Uniones (`JOIN`)

Supón que además tienes una tabla `clientes` y quieres obtener los nombres de los clientes junto con su total de ventas. Puedes usar una subconsulta en `FROM` y luego unir (`JOIN`) el resultado con la tabla `clientes`.

```sql
SELECT c.nombre, vc.total_ventas
FROM clientes c
JOIN (
    SELECT cliente_id, SUM(monto) AS total_ventas
    FROM ventas
    GROUP BY cliente_id
) AS vc ON c.cliente_id = vc.cliente_id;
```

En este ejemplo:

- La subconsulta en `FROM` (`SELECT cliente_id, SUM(monto) AS total_ventas FROM ventas GROUP BY cliente_id`) crea una tabla temporal con el total de ventas por cliente.
- Luego, la consulta principal une (`JOIN`) esta tabla derivada `vc` con la tabla `clientes` para obtener el `nombre` de cada cliente junto con su `total_ventas`.

#### Ventajas y Casos de Uso de las Subconsultas en `FROM`

Usar subconsultas en `FROM` es útil cuando:

- Necesitas calcular valores agregados que luego serán usados en la consulta principal.
- Quieres simplificar una consulta compleja dividiéndola en partes.
- Requieres tablas temporales para realizar uniones o filtros adicionales.

#### Notas de Optimización

- **Indexación**: Asegúrate de que los campos usados en la subconsulta estén indexados, especialmente si se unen a otras tablas.
- **Alias Claros**: Usa alias descriptivos para que las columnas y la estructura de la consulta sean fáciles de seguir.

# Taller

**Bienvenidos al Taller de SQL**, donde exploraremos juntos los fundamentos de SQL y aprenderemos a trabajar con consultas básicas y subconsultas en MySQL. Este taller está diseñado tanto para principiantes en SQL como para aquellos que buscan mejorar sus habilidades en la gestión y consulta de bases de datos.

### **Objetivos del Taller**

Durante este taller, aprenderás a:

1. Realizar consultas SQL básicas para extraer, filtrar y organizar datos de una base de datos.
2. Comprender y aplicar subconsultas para resolver problemas complejos y optimizar tus consultas.
3. Utilizar subconsultas en diferentes cláusulas como `WHERE` y `FROM`, permitiéndote realizar análisis avanzados y cálculos detallados.
4. Construir consultas prácticas para casos de uso real en base de datos relacionales.

### **¿Qué es SQL?**

SQL (Structured Query Language) es el lenguaje estándar para interactuar con bases de datos relacionales. Nos permite crear, modificar y consultar datos, lo que es esencial para gestionar la información en casi cualquier sistema moderno, desde aplicaciones web hasta sistemas de reportes empresariales.

### **¿Qué Son las Subconsultas?**

Las subconsultas son consultas anidadas dentro de otras consultas. Nos permiten extraer datos específicos y usarlos en otra consulta, lo cual es especialmente útil cuando necesitamos realizar cálculos intermedios o consultas complejas sobre datos relacionados. En este taller aprenderemos cómo y cuándo utilizar subconsultas para simplificar y optimizar el proceso de recuperación de datos.

### **¿Qué Vamos a Cubrir?**

Este taller se divide en las siguientes secciones:

1. **Consultas Básicas**: Introducción a `SELECT`, `WHERE`, `ORDER BY`, y `GROUP BY` para consultar datos fundamentales.
2. **Subconsultas en `WHERE`**: Cómo usar subconsultas en la cláusula `WHERE` para filtrar datos basados en condiciones específicas.
3. **Subconsultas en `FROM`**: Uso de subconsultas en la cláusula `FROM` para crear tablas temporales y realizar cálculos avanzados.
4. **Ejercicios Prácticos**: Resolver problemas reales usando consultas y subconsultas.

### Estructura de la Base de Datos

La base de datos consta de cinco tablas principales:

1. **clientes**: Información de los clientes.
2. **productos**: Información de los productos en venta.
3. **pedidos**: Detalles de cada pedido realizado por los clientes.
4. **detalles_pedidos**: Información específica de los productos en cada pedido.
5. **empleados**: Información de los empleados de la tienda.

```sql
-- Tabla de Clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    telefono VARCHAR(15),
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    fecha_registro DATE
);

-- Tabla de Productos
CREATE TABLE productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);
-- Tabla de Empleados
CREATE TABLE empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    puesto VARCHAR(50),
    fecha_contratacion DATE,
    salario DECIMAL(10, 2)
);
-- Tabla de Pedidos
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    empleado_id INT,
    fecha_pedido DATE,
    estado VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

-- Tabla de Detalles de Pedidos
CREATE TABLE detalles_pedidos (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);


```

Data

Clientes

```sql
INSERT INTO clientes (nombre, email, telefono, direccion, ciudad, pais, fecha_registro) VALUES
('Ana Pérez', 'ana.perez@gmail.com', '555-1234', 'Calle 123', 'Madrid', 'España', '2022-01-15'),
('Juan García', 'juan.garcia@hotmail.com', '555-5678', 'Avenida 45', 'Barcelona', 'España', '2021-11-22'),
('María López', 'maria.lopez@gmail.com', '555-7890', 'Calle Falsa 123', 'Sevilla', 'España', '2023-02-03'),
('Carlos Sánchez', 'carlos.sanchez@yahoo.com', '555-4321', 'Av. Libertad 90', 'Valencia', 'España', '2023-05-17'),
('Lucía Fernández', 'lucia.fernandez@gmail.com', '555-8765', 'Plaza Mayor 12', 'Zaragoza', 'España', '2022-08-21'),
('Pablo Martínez', 'pablo.martinez@gmail.com', '555-2345', 'Calle Nueva 45', 'Bilbao', 'España', '2021-09-15'),
('Raúl Torres', 'raul.torres@hotmail.com', '555-6789', 'Av. Central 120', 'Málaga', 'España', '2022-04-01'),
('Elena Ramírez', 'elena.ramirez@gmail.com', '555-1234', 'Paseo del Prado 5', 'Madrid', 'España', '2021-12-20'),
('Sofía Gómez', 'sofia.gomez@gmail.com', '555-5432', 'Calle Sol 18', 'Córdoba', 'España', '2022-11-30'),
('Andrés Ortega', 'andres.ortega@hotmail.com', '555-9876', 'Av. Buenavista 67', 'Murcia', 'España', '2022-07-14'),
('Laura Morales', 'laura.morales@hotmail.com', '555-3333', 'Calle Luna 8', 'Pamplona', 'España', '2023-01-11'),
('Iván Navarro', 'ivan.navarro@gmail.com', '555-2222', 'Av. del Rey 21', 'Santander', 'España', '2022-02-05'),
('Daniel Ruiz', 'daniel.ruiz@yahoo.com', '555-4444', 'Calle Grande 99', 'Valencia', 'España', '2023-02-17'),
('Esther Blanco', 'esther.blanco@gmail.com', '555-1111', 'Av. Colón 3', 'Valladolid', 'España', '2022-10-20'),
('Nuria Gil', 'nuria.gil@gmail.com', '555-5555', 'Calle Olmo 30', 'Madrid', 'España', '2021-06-30'),
('Miguel Torres', 'miguel.torres@hotmail.com', '555-6666', 'Paseo Marítimo 12', 'Cádiz', 'España', '2023-04-05'),
('Paula Castro', 'paula.castro@gmail.com', '555-7777', 'Plaza Carmen 8', 'Granada', 'España', '2021-12-05'),
('Sergio Márquez', 'sergio.marquez@hotmail.com', '555-8888', 'Av. Sol 45', 'Málaga', 'España', '2022-05-22'),
('Beatriz Vega', 'beatriz.vega@gmail.com', '555-9999', 'Calle Verde 67', 'Alicante', 'España', '2023-03-30'),
('Álvaro Ramos', 'alvaro.ramos@gmail.com', '555-0000', 'Av. Central 55', 'Logroño', 'España', '2022-09-10');
```

Empleados

```sql
INSERT INTO empleados (nombre, puesto, fecha_contratacion, salario) VALUES
('Carlos López', 'Gerente de Ventas', '2020-05-10', 3500.00),
('Marta Fernández', 'Asistente de Ventas', '2021-08-20', 2200.00),
('Sergio Molina', 'Representante de Ventas', '2022-01-11', 2500.00),
('Teresa Ortega', 'Asistente de Marketing', '2021-04-15', 2100.00),
('Rafael Castro', 'Analista de Datos', '2020-12-05', 2800.00),
('Gloria Morales', 'Ejecutiva de Cuentas', '2023-02-10', 2400.00),
('Pablo Vega', 'Supervisor de Ventas', '2022-10-23', 2600.00),
('Raquel Sánchez', 'Gerente de Finanzas', '2019-11-07', 4000.00),
('Luis Ramos', 'Auxiliar Administrativo', '2021-03-18', 2000.00),
('Natalia Ruiz', 'Desarrolladora', '2022-07-30', 3000.00),
('Daniel Lara', 'Representante de Ventas', '2020-11-15', 2600.00),
('Manuel García', 'Encargado de Almacén', '2021-01-18', 2200.00),
('José Martínez', 'Especialista de Soporte', '2022-06-25', 2100.00),
('Patricia León', 'Gerente de Proyectos', '2018-10-05', 4200.00),
('Lola Díaz', 'Coordinadora de Logística', '2019-08-19', 3100.00),
('Juan Cruz', 'Asistente Administrativo', '2020-12-01', 1900.00),
('Paula Rueda', 'Jefe de Compras', '2018-05-10', 3600.00),
('Miguel Gil', 'Consultor de Negocios', '2021-04-12', 2900.00),
('Rocío López', 'Especialista en Ventas', '2022-02-20', 2300.00),
('Andrés Navas', 'Desarrollador', '2021-12-13', 3100.00);
```

Productos

```sql
INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Laptop', 'Electrónica', 999.99, 50),
('Smartphone', 'Electrónica', 499.99, 150),
('Televisor', 'Electrónica', 300.00, 40),
('Auriculares', 'Accesorios', 25.00, 200),
('Teclado', 'Accesorios', 45.00, 120),
('Ratón', 'Accesorios', 20.00, 180),
('Impresora', 'Oficina', 150.00, 60),
('Escritorio', 'Muebles', 200.00, 25),
('Silla', 'Muebles', 120.00, 80),
('Tableta', 'Electrónica', 250.00, 90),
('Lámpara', 'Hogar', 35.00, 100),
('Ventilador', 'Hogar', 60.00, 50),
('Microondas', 'Hogar', 80.00, 30),
('Licuadora', 'Hogar', 45.00, 70),
('Refrigerador', 'Electrodomésticos', 500.00, 20),
('Cafetera', 'Electrodomésticos', 75.00, 60),
('Altavoces', 'Audio', 55.00, 90),
('Monitor', 'Electrónica', 180.00, 40),
('Bicicleta', 'Deporte', 300.00, 15),
('Reloj Inteligente', 'Electrónica', 150.00, 100);
```

Pedidos

```sql
INSERT INTO pedidos (cliente_id, empleado_id, fecha_pedido, estado) VALUES
(1, 1, '2023-02-10', 'Completado'),
(2, 2, '2023-02-12', 'Pendiente'),
(3, 3, '2023-03-15', 'Cancelado'),
(4, 4, '2023-03-16', 'Completado'),
(5, 5, '2023-04-10', 'Pendiente'),
(6, 6, '2023-04-12', 'Completado'),
(7, 7, '2023-05-05', 'Pendiente'),
(8, 8, '2023-05-07', 'Pendiente'),
(9, 9, '2023-05-10', 'Completado'),
(10, 10, '2023-06-01', 'Completado'),
(11, 11, '2023-06-02', 'Cancelado'),
(12, 12, '2023-06-03', 'Completado'),
(13, 13, '2023-07-12', 'Pendiente'),
(14, 14, '2023-07-20', 'Cancelado'),
(15, 15, '2023-08-15', 'Completado'),
(16, 16, '2023-08-30', 'Completado'),
(17, 17, '2023-09-10', 'Pendiente'),
(18, 18, '2023-09-25', 'Pendiente'),
(19, 19, '2023-10-05', 'Completado'),
(20, 20, '2023-10-18', 'Completado');
```

detalles_pedidos

```sql
INSERT INTO detalles_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 2, 999.99),
(2, 2, 1, 499.99),
(3, 3, 3, 300.00),
(4, 4, 1, 999.99),
(5, 5, 5, 45.00),
(6, 6, 4, 25.00),
(7, 7, 2, 499.99),
(8, 8, 1, 999.99),
(9, 9, 8, 200.00),
(10, 10, 3, 300.00),
(11, 11, 6, 150.00),
(12, 12, 7, 200.00),
(13, 13, 4, 25.00),
(14, 14, 5, 45.00),
(15, 15, 9, 120.00),
(16, 16, 10, 20.00),
(17, 17, 5, 150.00),
(18, 18, 4, 250.00),
(19, 19, 11, 55.00),
(20, 20, 12, 60.00);
```

### Consultas básicas

1. Consulta todos los datos de la tabla `clientes` para ver la lista completa de clientes.
2. Muestra los nombres y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.
3. Obtén una lista de productos con un precio mayor a $100, mostrando solo el nombre y el precio.
4. Encuentra todos los empleados que tienen un salario superior a $2500, mostrando su nombre, puesto y salario.
5. Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente.
6. Muestra los detalles de los pedidos que están en estado "Pendiente", incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.
7. Encuentra el nombre y el precio del producto más caro en la base de datos.
8. Obtén el total de pedidos realizados por cada cliente, mostrando el ID del cliente y el total de pedidos.
9. Calcula el promedio de salario de todos los empleados en la empresa.
10. Encuentra el número de productos en cada categoría, mostrando la categoría y el número de productos

### Consultas multitabla joins

1. Encuentra los nombres de los clientes y los detalles de sus pedidos.
2. Lista todos los productos pedidos junto con el precio unitario de cada pedido
3. Encuentra los nombres de los clientes y los nombres de los empleados que gestionaron sus pedidos
4. Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando `LEFT JOIN`
5. Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`.
6. Lista todos los empleados junto con los pedidos que han gestionado, si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.
7. Encuentra los empleados que no han gestionado ningún pedido usando un `LEFT JOIN` combinado con `WHERE`.
8. Calcula el total gastado en cada pedido, mostrando el ID del pedido y el total, usando `JOIN`.
9. Realiza un `CROSS JOIN` entre clientes y productos para mostrar todas las combinaciones posibles de clientes y productos.
10. Encuentra los nombres de los clientes y los productos que han comprado, si existen, incluyendo los clientes que no han realizado pedidos usando `LEFT JOIN`.

### Subconsultas

1. Encuentra los nombres de los clientes que han realizado al menos un pedido de más de $500.
2. Muestra los productos que nunca han sido pedidos.
3. Lista los empleados que han gestionado pedidos en los últimos 6 meses.
4. Encuentra el pedido con el total de ventas más alto.
5. Muestra los nombres de los clientes que han realizado más pedidos que el promedio de pedidos de todos los clientes.
6. Obtén los productos cuyo precio es superior al precio promedio de todos los productos.
7. Lista los clientes que han gastado más de $1,000 en total.
8. Encuentra los empleados que ganan un salario mayor al promedio de la empresa.
9. Obtén los productos que generaron ingresos mayores al ingreso promedio por producto.
10. Encuentra el nombre del cliente que realizó el pedido más reciente.
11. Muestra los productos pedidos al menos una vez en los últimos 3 meses.
12. Lista los empleados que no han gestionado ningún pedido.
13. Encuentra los clientes que han comprado más de tres tipos distintos de productos.
14. Muestra el nombre del producto más caro que se ha pedido al menos cinco veces.
15. Lista los clientes cuyo primer pedido fue un año después de su registro.

16. Encuentra los nombres de los productos que tienen un stock inferior al promedio del stock de todos los productos.
17. Lista los clientes que han realizado menos de tres pedidos.
18. Encuentra los nombres de los productos que fueron pedidos por los clientes que registraron en el último año.
19. Obtén el nombre del empleado que gestionó el mayor número de pedidos.
20. Lista los productos que han sido comprados en cantidades mayores que el promedio de cantidad de compra de todos los productos.

# Procedimientos almacenados

Los procedimientos almacenados en MySQL son bloques de código SQL que se pueden guardar y ejecutar posteriormente en el servidor de la base de datos. Funcionan como una función o rutina que se puede invocar para realizar una tarea específica, como insertar datos, actualizar registros, realizar cálculos, entre otros. A continuación, se explican los conceptos básicos y se presentan algunos ejemplos para comprender mejor cómo funcionan los procedimientos almacenados.

### ¿Qué es un procedimiento almacenado?

Un procedimiento almacenado es una secuencia de comandos SQL que se almacena en la base de datos y se ejecuta en el servidor cuando se le invoca. Esto permite realizar operaciones repetitivas sin tener que escribir el código completo cada vez. Además, los procedimientos almacenados pueden aceptar parámetros y devolver resultados, lo que los hace muy flexibles.

### Ventajas de los procedimientos almacenados

- **Eficiencia**: El código se ejecuta directamente en el servidor, lo que reduce la carga en el lado del cliente.
- **Reutilización**: Una vez definido, el procedimiento puede llamarse múltiples veces desde diferentes partes de la aplicación.
- **Seguridad**: Es posible otorgar permisos para ejecutar el procedimiento sin dar acceso completo a las tablas.
- **Mantenimiento**: Modificar el procedimiento en la base de datos afectará a todos los usuarios que lo llamen, facilitando el mantenimiento.

### Estructura de un procedimiento almacenado

Un procedimiento almacenado en MySQL sigue esta estructura:

```sql
DELIMITER $$

CREATE PROCEDURE nombre_procedimiento (parametros)
BEGIN
    -- Cuerpo del procedimiento
    -- Aquí se colocan las instrucciones SQL
END $$

DELIMITER ;

```

**Explicación**:

- `DELIMITER $$`: Cambia el delimitador de las instrucciones para que MySQL sepa cuándo termina el procedimiento (por defecto, el delimitador es `;`).
- `CREATE PROCEDURE nombre_procedimiento`: Define el procedimiento y su nombre.
- `(parametros)`: Lista de parámetros opcionales para el procedimiento.
- `BEGIN ... END`: Delimita el cuerpo del procedimiento donde se encuentran las instrucciones SQL.
- `DELIMITER ;`: Restaura el delimitador original al finalizar el procedimiento.

## Condicionales

### 1. Condicional `IF`

La declaración `IF` en un procedimiento almacenado se usa para verificar una condición y ejecutar código dependiendo del resultado.

#### Sintaxis del `IF`

```sql
IF condición THEN
    -- Código si la condición es verdadera
ELSEIF otra_condición THEN
    -- Código si la segunda condición es verdadera
ELSE
    -- Código si ninguna condición es verdadera
END IF;
```

#### Ejemplo del uso de `IF`

Este ejemplo muestra un procedimiento que verifica si el total de ventas de un empleado es mayor o menor que un valor determinado y devuelve un mensaje.

```sql
DELIMITER //

CREATE PROCEDURE verificarVentas(
    IN total_ventas DECIMAL(10, 2)
)
BEGIN
    IF total_ventas >= 10000 THEN
        SELECT 'El empleado ha alcanzado un nivel excelente de ventas.' AS mensaje;
    ELSEIF total_ventas >= 5000 THEN
        SELECT 'El empleado ha alcanzado un buen nivel de ventas.' AS mensaje;
    ELSE
        SELECT 'El empleado necesita mejorar las ventas.' AS mensaje;
    END IF;
END //

DELIMITER ;
```

### 2. Condicional `CASE`

El `CASE` en MySQL es similar a una estructura `switch` en otros lenguajes de programación. Evalúa una expresión y ejecuta el bloque de código correspondiente a la primera condición que sea verdadera.

#### Sintaxis de `CASE`

```sql
CASE
    WHEN condición1 THEN
        -- Código si condición1 es verdadera
    WHEN condición2 THEN
        -- Código si condición2 es verdadera
    ELSE
        -- Código si ninguna condición es verdadera
END CASE;

```

#### Ejemplo del uso de `CASE`

Este ejemplo utiliza `CASE` para evaluar el nivel de ventas y devolver un mensaje adecuado.

```sql
DELIMITER //

CREATE PROCEDURE evaluarNivelVentas(
    IN nivel_ventas DECIMAL(10, 2)
)
BEGIN
    CASE
        WHEN nivel_ventas >= 10000 THEN
            SELECT 'Nivel de ventas excelente.' AS mensaje;
        WHEN nivel_ventas >= 5000 THEN
            SELECT 'Buen nivel de ventas.' AS mensaje;
        WHEN nivel_ventas >= 1000 THEN
            SELECT 'Nivel de ventas moderado.' AS mensaje;
        ELSE
            SELECT 'Nivel de ventas bajo.' AS mensaje;
    END CASE;
END //

DELIMITER ;

```

En este caso:

- Si `nivel_ventas` es 10,000 o más, indica un nivel excelente.
- Si es 5,000 o más, indica un buen nivel.
- Si es 1,000 o más, indica un nivel moderado.
- En caso contrario, indica que el nivel es bajo.

### 3. Ejemplo Combinando Condicionales en un Procedimiento Complejo

Este procedimiento `calificarEmpleado` evalúa las ventas de un empleado y asigna una bonificación dependiendo de diferentes rangos de ventas usando `IF` y `CASE`.

```sql
DELIMITER //

CREATE PROCEDURE calificarEmpleado(
    IN ventas DECIMAL(10, 2),
    OUT bonificacion DECIMAL(10, 2)
)
BEGIN
    IF ventas >= 8000 THEN
        CASE
            WHEN ventas >= 15000 THEN
                SET bonificacion = ventas * 0.10; -- Bonificación del 10%
            WHEN ventas >= 10000 THEN
                SET bonificacion = ventas * 0.07; -- Bonificación del 7%
            ELSE
                SET bonificacion = ventas * 0.05; -- Bonificación del 5%
        END CASE;
    ELSE
        SET bonificacion = 0; -- Sin bonificación si las ventas son menores a 8000
    END IF;
END //

DELIMITER ;

```

## Ciclos

En MySQL, los ciclos en procedimientos almacenados permiten ejecutar un bloque de código repetidamente hasta que se cumpla una condición específica. Los ciclos más comunes en MySQL son:

1. **LOOP**: Un ciclo básico que continúa hasta que se usa `LEAVE` para salir de él.
2. **WHILE**: Ejecuta un bloque de código mientras se cumpla una condición.
3. **REPEAT**: Ejecuta un bloque de código al menos una vez, y luego sigue ejecutando mientras se cumpla una condición al final del ciclo.

Aquí tienes una explicación detallada de cada tipo de ciclo con ejemplos.

------

### 1. Ciclo `LOOP`

El ciclo `LOOP` en MySQL ejecuta un bloque de código repetidamente y solo se detiene cuando se usa la instrucción `LEAVE`.

```
label: LOOP
    -- Código a ejecutar
    IF condición THEN
        LEAVE label; -- Salir del ciclo si la condición es verdadera
    END IF;
END LOOP label;

```

#### Ejemplo de Uso de `LOOP`

Este ejemplo crea un procedimiento que suma los números del 1 al 10.

```sql
DELIMITER //

CREATE PROCEDURE sumaDiez()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE suma INT DEFAULT 0;

    ciclo: LOOP
        SET suma = suma + contador;
        SET contador = contador + 1;
        
        IF contador > 10 THEN
            LEAVE ciclo; -- Salir del ciclo cuando contador sea mayor que 10
        END IF;
    END LOOP ciclo;

    SELECT suma AS resultado;
END //

DELIMITER ;
```

### 2. Ciclo `WHILE`

El ciclo `WHILE` en MySQL ejecuta un bloque de código mientras una condición sea verdadera. Si la condición es falsa desde el inicio, el bloque no se ejecutará.

#### Sintaxis de `WHILE`

```sql
WHILE condición DO
    -- Código a ejecutar
END WHILE;
```

#### Ejemplo de Uso de `WHILE`

Este ejemplo cuenta desde 1 hasta 5 y muestra el valor de `contador` en cada iteración.

```sql
DELIMITER //

CREATE PROCEDURE contarHastaCinco()
BEGIN
    DECLARE contador INT DEFAULT 1;

    WHILE contador <= 5 DO
        SELECT CONCAT('Contador: ', contador) AS mensaje;
        SET contador = contador + 1;
    END WHILE;
END //

DELIMITER ;

```

### 3. Ciclo `REPEAT`

El ciclo `REPEAT` ejecuta un bloque de código al menos una vez, ya que la condición se evalúa al final del ciclo. Continúa repitiendo hasta que la condición sea verdadera.

#### Sintaxis de `REPEAT`

```sql
label: REPEAT
    -- Código a ejecutar
UNTIL condición
END REPEAT label;

```

#### Ejemplo de Uso de `REPEAT`

Este ejemplo cuenta desde 1 hasta 3 y muestra el valor de `contador` en cada iteración.

```sql
DELIMITER //

CREATE PROCEDURE contarHastaTres()
BEGIN
    DECLARE contador INT DEFAULT 1;

    contar: REPEAT
        SELECT CONCAT('Contador: ', contador) AS mensaje;
        SET contador = contador + 1;
    UNTIL contador > 3
    END REPEAT contar;
END //

DELIMITER ;
```

### Ejemplo Completo: Ciclo para Calcular Factorial

A continuación, se muestra un ejemplo de un procedimiento que calcula el factorial de un número usando el ciclo `WHILE`.

```sql
DELIMITER //

CREATE PROCEDURE calcularFactorial(
    IN numero INT,
    OUT resultado BIGINT
)
BEGIN
    DECLARE contador INT DEFAULT 1;
    SET resultado = 1;

    WHILE contador <= numero DO
        SET resultado = resultado * contador;
        SET contador = contador + 1;
    END WHILE;
END //

DELIMITER ;

```

### Resumen

- **LOOP**: Se usa cuando queremos tener control total sobre cuándo salir del ciclo, usando `LEAVE`.
- **WHILE**: Ejecuta un bloque mientras una condición se mantenga verdadera.
- **REPEAT**: Ejecuta el bloque al menos una vez y evalúa la condición al final de cada iteración.

### Ejemplos de procedimientos almacenados

#### Ejemplo 1: Procedimiento simple sin parámetros

Este procedimiento imprime un mensaje cuando se llama.

```sql
DELIMITER $$

CREATE PROCEDURE hola_mundo()
BEGIN
    SELECT '¡Hola, mundo!';
END $$

DELIMITER ;

```

llamada

```sql
CALL hola_mundo();
```

#### Ejemplo 2: Procedimiento con parámetros de entrada

En este ejemplo, se crea un procedimiento que inserta un nuevo producto en la tabla `productos`.

```sql
DELIMITER $$

CREATE PROCEDURE insertar_producto(
    IN producto_nombre VARCHAR(40),
    IN cantidad INT,
    IN precio DECIMAL(10, 2)
)
BEGIN
    INSERT INTO productos (nombre, cantidad, precio)
    VALUES (producto_nombre, cantidad, precio);
END $$

DELIMITER ;

```

```sql
CALL insertar_producto('Laptop', 10, 1200.50);
```

**Explicación**:

- `IN` indica que el parámetro es de entrada, es decir, se pasa al procedimiento para ser usado en él.
- Los parámetros `producto_nombre`, `cantidad`, y `precio` se usan en el `INSERT` para agregar un nuevo registro a la tabla `productos`.

#### Ejemplo 3: Procedimiento con lógica de control y verificación

En este ejemplo, se crea un procedimiento que intenta insertar un registro en la tabla y devuelve un mensaje dependiendo de si la operación fue exitosa.

```sql
DELIMITER $$

CREATE PROCEDURE insertar_producto_con_verificacion(
    IN producto_nombre VARCHAR(40),
    IN cantidad INT,
    IN precio DECIMAL(10, 2)
)
BEGIN
    DECLARE mensaje VARCHAR(100);

    INSERT INTO productos (nombre, cantidad, precio)
    VALUES (producto_nombre, cantidad, precio);

    IF ROW_COUNT() > 0 THEN
        SET mensaje = 'Registro insertado correctamente';
    ELSE
        SET mensaje = 'Error al insertar el registro';
    END IF;

    SELECT mensaje AS Mensaje;
END $$

DELIMITER ;
```

```sql
CALL insertar_producto_con_verificacion('Teclado', 20, 50.00);
```

**Explicación**:

- `DECLARE mensaje VARCHAR(100);` declara una variable `mensaje` para almacenar el resultado de la operación.
- `ROW_COUNT()` verifica si el `INSERT` afectó alguna fila, lo que indica que la inserción fue exitosa.
- `IF ... THEN ... ELSE ... END IF;` es una estructura condicional que establece el mensaje según el resultado de la operación.

### Tipos de parámetros en procedimientos almacenados

- **IN**: Parámetro de entrada. Solo se usa dentro del procedimiento y no cambia su valor original.
- **OUT**: Parámetro de salida. Se usa para devolver un valor al final del procedimiento.
- **INOUT**: Parámetro que puede recibir un valor al inicio y devolver un valor modificado al final.

#### Ejemplo de uso de parámetros OUT

Este ejemplo muestra un procedimiento que devuelve el precio de un producto usando un parámetro `OUT`:

```sql
DELIMITER $$

CREATE PROCEDURE obtener_precio(
    IN id_producto INT,
    OUT precio_producto DECIMAL(10, 2)
)
BEGIN
    SELECT precio INTO precio_producto
    FROM productos
    WHERE id = id_producto;
END $$

DELIMITER ;
```

```sql
CALL obtener_precio(1, @precio);
SELECT @precio;
```

**Explicación**:

- `OUT precio_producto` es un parámetro de salida que se asigna con el precio del producto consultado.
- `INTO precio_producto` almacena el resultado de la consulta en el parámetro `OUT`.

## Listar procedimientos existentes

```sql
SELECT ROUTINE_NAME
FROM information_schema.ROUTINES 
WHERE ROUTINE_TYPE = 'PROCEDURE' 
AND ROUTINE_SCHEMA = 'Nombre de la base de datos';
```



```sql
SELECT ROUTINE_NAME
FROM information_schema.ROUTINES 
WHERE ROUTINE_TYPE = 'PROCEDURE' 
AND ROUTINE_SCHEMA = 'tibu';
```



## Otros ejemplos



```sql
create table productos(
    id int not null auto_increment,
    producto varchar(40) not null,
    cantidad int not null,
    precio decimal(19,2) not null,
    marca varchar(20) not null,
    estado tinyint,
    primary key(id)
);
```



```sql
DELIMITER $$

CREATE PROCEDURE eliminar_producto(
    IN producto_id INT)
BEGIN
    DECLARE mensaje VARCHAR(100);
    DELETE FROM productos WHERE id = producto_id;
    IF ROW_COUNT() > 0 THEN
        SET mensaje = CONCAT('El producto con ID ', producto_id, ' ha sido eliminado exitosamente.');
    ELSE
        SET mensaje = 'No se encontró ningún producto con el ID proporcionado.';
    END IF;
    SELECT mensaje AS 'Mensaje';
END $$

DELIMITER ;

```

```sql
DELIMITER $$

CREATE PROCEDURE actualizar_producto(
    IN producto_id INT,
    IN nuevo_producto VARCHAR(40),
    IN nueva_cantidad INT,
    IN nuevo_precio DECIMAL(19,2),
    IN nueva_marca VARCHAR(20),
    IN nuevo_estado TINYINT)
BEGIN
    DECLARE mensaje VARCHAR(100);
    UPDATE productos SET producto = nuevo_producto, cantidad = nueva_cantidad, precio = nuevo_precio,
    marca = nueva_marca, estado = nuevo_estado
    WHERE id = producto_id;

    IF ROW_COUNT() > 0 THEN
        SET mensaje = CONCAT('El producto con ID ', producto_id, ' ha sido actualizado exitosamente.');
    ELSE
        SET mensaje = 'No se encontró ningún producto con el ID proporcionado para actualizar.';
    END IF;
    SELECT mensaje AS 'Mensaje';
END $$
DELIMITER ;
```

```sql
DELIMITER $$

CREATE PROCEDURE mostrar_valores_totales_por_marca()
BEGIN
    SELECT marca, SUM(cantidad * precio) AS total_valor
    FROM productos
    GROUP BY marca;
END $$

DELIMITER ;

```

```sql
DELIMITER $$

CREATE PROCEDURE obtener_cantidad_productos_por_marca(
    IN marca_busqueda VARCHAR(20))
BEGIN
    DECLARE cantidad_productos INT;

    SELECT COUNT(*) INTO cantidad_productos
    FROM productos
    WHERE marca = marca_busqueda;

    SELECT cantidad_productos AS 'Cantidad de Productos';
END $$

DELIMITER ;

```

```sql
DELIMITER $$

CREATE PROCEDURE obtener_total_registros_por_marca()
BEGIN
    SELECT marca, COUNT(*) AS total_registros
    FROM productos
    GROUP BY marca;
END $$

DELIMITER ;
```

```sql
DELIMITER $$

CREATE PROCEDURE obtener_total_registros_por_marca_out(
    OUT marca_out VARCHAR(20),
    OUT total_registros_out INT)
BEGIN
    SELECT marca, COUNT(*) INTO marca_out, total_registros_out
    FROM productos
    GROUP BY marca;
END $$

DELIMITER ;

CALL obtener_total_registros_por_marca_out(@marca, @total_registros);
SELECT @marca AS marca, @total_registros AS total_registros;

```

```sql
DELIMITER $$

CREATE PROCEDURE obtener_total_registros_por_marca_temp()
BEGIN
    -- Crear una tabla temporal para almacenar los resultados
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_resultados (
        marca VARCHAR(20),
        total_registros INT
    );
    
    -- Insertar los resultados en la tabla temporal
    INSERT INTO temp_resultados (marca, total_registros)
    SELECT marca, COUNT(*) AS total_registros
    FROM productos
    GROUP BY marca;
    
    -- Seleccionar los resultados de la tabla temporal
    SELECT * FROM temp_resultados;
    
    -- Eliminar la tabla temporal después de usarla
    DROP TEMPORARY TABLE IF EXISTS temp_resultados;
END $$

DELIMITER ;

CALL obtener_total_registros_por_marca_temp();

```



> Escribe un procedimiento almacenado llamado `insertar_producto` que permita insertar un nuevo producto en la tabla `productos`. El procedimiento debe recibir los siguientes parámetros:**
>
> - **`producto` (nombre del producto, tipo `VARCHAR(40)`)**
> - **`cantidad` (cantidad de productos, tipo `INT`)**
> - **`precio` (precio del producto, tipo `DECIMAL(19,2)`)**
> - **`marca` (marca del producto, tipo `VARCHAR(20)`)**
> - **`estado` (estado del producto, tipo `TINYINT`)**
>
> **El procedimiento debe insertar un nuevo registro en la tabla `productos` con los valores proporcionados, generando automáticamente el `id` del producto.**



> **Escribe un procedimiento almacenado llamado `buscar_producto` que permita consultar la información de un producto específico en la tabla `productos`. Este procedimiento debe recibir como parámetro el `id` del producto (tipo `INT`).**
>
> - **El procedimiento debe devolver el `id` del producto, el nombre del `producto`, y el subtotal calculado como el producto de `cantidad` y `precio` del producto seleccionado.**
>
> **La búsqueda debe realizarse en función del `id` proporcionado.**



> **Escribe un procedimiento almacenado llamado `insertar_producto_verify` que permita insertar un nuevo producto en la tabla `productos`. El procedimiento debe recibir los siguientes parámetros:**
>
> - **`producto` (nombre del producto, tipo `VARCHAR(40)`)**
> - **`cantidad` (cantidad de productos, tipo `INT`)**
> - **`precio` (precio del producto, tipo `DECIMAL(19,2)`)**
> - **`marca` (marca del producto, tipo `VARCHAR(20)`)**
> - **`estado` (estado del producto, tipo `TINYINT`)**
>
> **El procedimiento debe intentar insertar un nuevo registro en la tabla `productos` con los valores proporcionados. Luego, debe verificar si la operación fue exitosa usando `ROW_COUNT()`.**
>
> - **Si la inserción fue exitosa, debe devolver el mensaje: 'El registro se ha creado correctamente.'**
> - **Si la inserción falla, debe devolver el mensaje: 'Error al crear el registro.**

# Cursores en Mysql

Un **cursor** en MySQL es una estructura que permite recorrer fila por fila los resultados de una consulta `SELECT`, dentro de un bloque de código, como un procedimiento almacenado. Los cursores son útiles cuando necesitamos procesar cada fila individualmente, ya que MySQL normalmente trabaja con conjuntos de resultados (es decir, con operaciones a nivel de conjunto y no fila por fila).

### ¿Cuándo usar un cursor?

Usamos un cursor cuando necesitamos:

- Procesar cada fila de un conjunto de resultados de manera individual.
- Realizar operaciones complejas que requieren un análisis de cada fila, como cálculos acumulativos, condiciones específicas o lógica adicional que no puede resolverse fácilmente con una sola consulta SQL.

**Ejemplo de casos en los que los cursores pueden ser útiles**:

- Verificar y procesar registros de uno en uno en un reporte.
- Realizar operaciones sobre un conjunto de filas que necesita iterarse individualmente, por ejemplo, en un procedimiento de migración de datos.

### Sintaxis de un cursor en MySQL

Los pasos básicos para declarar y usar un cursor en un procedimiento almacenado de MySQL son:

1. **Declarar el cursor**: Se define el cursor con la consulta `SELECT` que producirá el conjunto de resultados a iterar.
2. **Abrir el cursor**: Se abre el cursor para que esté disponible para leer sus datos.
3. **Leer los datos**: Se utiliza `FETCH` para obtener la siguiente fila del cursor y asignarla a variables.
4. **Cerrar el cursor**: Cuando se termina de usar el cursor, se debe cerrar para liberar los recursos.

### Ejemplo Básico de Uso de un Cursor

Aquí tienes un ejemplo de un procedimiento almacenado que utiliza un cursor para iterar sobre una tabla de `clientes` e imprimir su `id` y `nombre`:

```sql
DELIMITER //

CREATE PROCEDURE listarClientes()
BEGIN
    DECLARE fin INT DEFAULT 0;  -- Variable para indicar el final del cursor
    DECLARE cliente_id INT;
    DECLARE cliente_nombre VARCHAR(100);
    
    -- Declarar el cursor
    DECLARE cursor_clientes CURSOR FOR
        SELECT id, nombre FROM clientes;
    
    -- Declarar un handler para indicar el final del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

    -- Abrir el cursor
    OPEN cursor_clientes;

    -- Bucle para recorrer el cursor
    leer_clientes: LOOP
        FETCH cursor_clientes INTO cliente_id, cliente_nombre;
        
        -- Salir del bucle si se llegó al final
        IF fin THEN
            LEAVE leer_clientes;
        END IF;
        
        -- Aquí puedes hacer algo con cada cliente, por ejemplo:
        SELECT CONCAT('ID: ', cliente_id, ', Nombre: ', cliente_nombre) AS info_cliente;
    END LOOP leer_clientes;

    -- Cerrar el cursor
    CLOSE cursor_clientes;
END //

DELIMITER ;

```

### Explicación del Ejemplo

1. **Declarar el cursor** (`DECLARE cursor_clientes CURSOR FOR ...`): Especifica la consulta que producirá el conjunto de resultados a recorrer.
2. **Handler de fin de cursor**: El `DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1` permite manejar automáticamente el final del cursor. Cuando ya no hay más filas, `NOT FOUND` activa el handler y asigna `1` a la variable `fin`.
3. **Abrir el cursor** (`OPEN cursor_clientes;`): Activa el cursor para poder leer sus datos.
4. **Bucle de lectura**: El bucle `FETCH` obtiene fila por fila del cursor y la asigna a las variables `cliente_id` y `cliente_nombre`. Si `fin` se establece en `1`, el bucle se detiene.
5. **Cerrar el cursor** (`CLOSE cursor_clientes;`): Libera los recursos utilizados por el cursor después de terminar el procesamiento.

### Consideraciones Importantes

- **Rendimiento**: Los cursores pueden ser menos eficientes que las consultas de conjunto, especialmente en operaciones grandes. Se deben usar solo cuando realmente sea necesario.
- **Complejidad**: Es preferible evitar los cursores cuando se puede usar una operación de conjunto, como `JOIN`, `WHERE`, o subconsultas.



# TALLER MENSAJERIA

```
CREATE DATABASE IF NOT EXISTS mensajeria;
USE mensajeria;

CREATE TABLE usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE conversaciones (
    conversacion_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_conversacion VARCHAR(100) NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE participantes (
    participante_id INT AUTO_INCREMENT PRIMARY KEY,
    conversacion_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_union TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversacion_id) REFERENCES conversaciones(conversacion_id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);

CREATE TABLE mensajes (
    mensaje_id INT AUTO_INCREMENT PRIMARY KEY,
    conversacion_id INT NOT NULL,
    remitente_id INT NOT NULL,
    contenido TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversacion_id) REFERENCES conversaciones(conversacion_id) ON DELETE CASCADE,
    FOREIGN KEY (remitente_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);

```

## Inserciones

```sql
INSERT INTO usuarios (nombre, email, contrasena)
VALUES ('Juan Pérez', 'juan.perez@example.com', 'password123'),
('María López', 'maria.lopez@example.com', 'maria1234'),
('Carlos Martínez', 'carlos.martinez@example.com', 'carlo_pass'),
('Ana Fernández', 'ana.fernandez@example.com', 'ana2023'),
('Luis Gómez', 'luis.gomez@example.com', 'luis_pass'),
('Lucía Rivera', 'lucia.rivera@example.com', 'lucia2023'),
('Pedro Ortiz', 'pedro.ortiz@example.com', 'pedro_pass'),
('Sofía Blanco', 'sofia.blanco@example.com', 'sofiablanco123'),
('Miguel Rojas', 'miguel.rojas@example.com', 'miguerojas2023'),
('Carla Ruiz', 'carla.ruiz@example.com', 'carlitaaruiz');
```

## Consultas

1. Cree un procedimiento almacenado que permita insertar un nuevo usuario retornando un mensaje que indique si la inserción fue satisfactoria.
2. Cree un procedimiento almacenado que permita eliminar un  usuario retornando un mensaje que indique si la inserción fue satisfactoria.
3. Cree un procedimiento almacenado que permita editar un usuario retornando un mensaje que indique si la inserción fue satisfactoria.
4. Cree un procedimiento almacenado que permita buscar un   usuario por su nombre.
5. Realice una consulta que permita iniciar una conversación.
6. Realice un procedimiento almacenado que permita agregar un nuevo participante a la conversación y valide si hay capacidad disponible. La cantidad maxima por cada conversación son 5 usuarios. 
7. Realice un procedimiento que permita visualizar los mensaje de una conversación.
8. Realice un procedimiento almacenado para enviar un mensaje a una conversación.

Modifica la estructura de la tabla para que permita el envio de los mensaje a todos los usuarios o a un usuario en particular. y realice las siguientes consultas.

9. Realice un procedimiento almacenado que permita visualizar los mensajes de un usuario especifico.

10. Realice un procedimiento almacenado que permita eliminar a un usuario que no esta respetando las normas de buena conversación. Agregue una tabla que permita agregar palabra no deseadas. El procedimiento debe inspeccionar la conversación a verificar.

    ```sql
    DELIMITER //
    CREATE PROCEDURE eliminarUsuarioPorMalComportamiento (
        IN p_conversacion_id INT
    )
    BEGIN
        DECLARE fin INT DEFAULT 0;
        DECLARE mensaje_id INT;
        DECLARE usuario_id INT;
        DECLARE contenido TEXT;
        DECLARE palabra VARCHAR(50);
    
        -- Cursor para iterar por cada mensaje de la conversación
        DECLARE cursor_mensajes CURSOR FOR
            SELECT mensaje_id, remitente_id, contenido
            FROM mensajes
            WHERE conversacion_id = p_conversacion_id;
    
        -- Cursor para iterar por cada palabra no deseada
        DECLARE cursor_palabras CURSOR FOR
            SELECT palabra FROM palabras_no_deseadas;
    
        -- Handler para finalizar el cursor
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
    
        -- Abrir cursor de mensajes
        OPEN cursor_mensajes;
    
        -- Iterar sobre cada mensaje en la conversación
        leer_mensajes: LOOP
            FETCH cursor_mensajes INTO mensaje_id, usuario_id, contenido;
            IF fin THEN
                LEAVE leer_mensajes;
            END IF;
    
            -- Abrir cursor de palabras no deseadas
            OPEN cursor_palabras;
            SET fin = 0;
    
            -- Iterar sobre cada palabra no deseada
            leer_palabras: LOOP
                FETCH cursor_palabras INTO palabra;
                IF fin THEN
                    LEAVE leer_palabras;
                END IF;
    
                -- Verificar si el contenido del mensaje contiene una palabra no deseada
                IF LOCATE(palabra, contenido) > 0 THEN
                    -- Eliminar al usuario infractor de la tabla de participantes
                    DELETE FROM participantes
                    WHERE conversacion_id = p_conversacion_id AND usuario_id = usuario_id;
                    
                    -- Salir del bucle de palabras si ya se ha encontrado una palabra prohibida
                    LEAVE leer_palabras;
                END IF;
            END LOOP leer_palabras;
    
            -- Cerrar cursor de palabras no deseadas
            CLOSE cursor_palabras;
        END LOOP leer_mensajes;
    
        -- Cerrar cursor de mensajes
        CLOSE cursor_mensajes;
    
    END //
    DELIMITER ;
    
    ```

    ### Explicación del Procedimiento

    1. **Cursor `cursor_mensajes`**: Recorre cada mensaje de la conversación especificada.
    2. **Cursor `cursor_palabras`**: Para cada mensaje, revisa cada palabra no deseada.
    3. **Inspección del mensaje**: Usando la función `LOCATE()`, busca si alguna palabra no deseada está presente en el contenido del mensaje.
    4. **Eliminación del usuario**: Si se encuentra una palabra inapropiada, el usuario es eliminado de la conversación (eliminado de la tabla `participantes`).
    5. **Finalización de la búsqueda**: Si se encuentra una palabra no deseada en un mensaje, se detiene la búsqueda en ese mensaje.

# Funciones Mysql

Las funciones definidas por el usuario (UDF) en MySQL permiten crear cálculos personalizados que pueden reutilizarse en consultas SQL. Estas funciones son útiles para encapsular lógica compleja en operaciones de bases de datos, devolviendo un solo valor que se puede utilizar en diferentes partes de una consulta.

### Sintaxis para Crear una Función

Para crear una función en MySQL, se usa la siguiente estructura básica:

```sql
DELIMITER $$
CREATE FUNCTION nombre_funcion(parametro1 tipo_dato, parametro2 tipo_dato, ...)
RETURNS tipo_dato
DETERMINISTIC
BEGIN
    -- Cuerpo de la función
    DECLARE variable_local tipo_dato;
    
    -- Instrucciones y lógica de la función
    RETURN valor_resultado;
END $$
DELIMITER ;

```

**Opciones Importantes:**

- `RETURNS tipo_dato`: Define el tipo de dato que devolverá la función, como `INT`, `VARCHAR`, `DATE`, etc.
- `DETERMINISTIC`: Indica que la función devolverá siempre el mismo resultado para los mismos parámetros. Si el resultado puede variar, se debe usar `NOT DETERMINISTIC`.
- `BEGIN ... END`: Define el cuerpo de la función, donde se pueden declarar variables y utilizar controles de flujo como `IF`.

### Funciones Determinísticas vs. No Determinísticas en MySQL

En MySQL, las funciones pueden clasificarse en determinísticas y no determinísticas. Esta clasificación se basa en si los resultados de la función varían o no para un mismo conjunto de parámetros de entrada.

- **Funciones Determinísticas**: Siempre devuelven el mismo resultado para los mismos valores de entrada. Son predecibles y consistentes, lo que las hace ideales para operaciones que requieren una salida fija y precisa.
- **Funciones No Determinísticas**: Producen resultados diferentes incluso con los mismos valores de entrada. Estas funciones se utilizan cuando los resultados dependen de factores variables, como la hora actual o los valores generados aleatoriamente.

#### **Ventajas y cómo elegir según la necesidad:**

- **Determinísticas**: Seleccionar cuando la consistencia es clave. Son esenciales para cálculos precisos y operaciones donde la repetibilidad es crucial.
- **No Determinísticas**: Utilizar en escenarios que requieren dinamismo o en operaciones que dependen de factores cambiantes o externos.

### Ejemplo de Función Simple

Supóngase que se quiere crear una función que convierta temperaturas de Celsius a Fahrenheit:

```sql
DELIMITER $$
CREATE FUNCTION celsius_a_fahrenheit(celsius DECIMAL(5,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    RETURN (celsius * 9 / 5) + 32;
END $$
DELIMITER ;
```

Para utilizar esta función, bastará con incluirla en una consulta:

```sql
SELECT celsius_a_fahrenheit(25);  -- Devuelve 77.00
```

### Ejemplo de Función con Lógica Condicional

En este caso, puede crearse una función que calcule el descuento de un producto en función de su precio:

```sql
CREATE FUNCTION calcular_descuento(precio DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE descuento DECIMAL(10,2);

    IF precio >= 100 THEN
        SET descuento = precio * 0.10;  -- 10% de descuento para precios mayores o iguales a 100
    ELSE
        SET descuento = precio * 0.05;  -- 5% de descuento para precios menores a 100
    END IF;

    RETURN descuento;
END;

```

```sql
SELECT calcular_descuento(150);  -- Devuelve 15.00
SELECT calcular_descuento(80);   -- Devuelve 4.00
```

### Ejemplo de Función con Operaciones de Fecha

Una función útil podría calcular la edad de una persona dada su fecha de nacimiento:

```sql
DELIMITER $$
CREATE FUNCTION calcular_edad(fecha_nacimiento DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());
END $$
DELIMITER ;
```

```sql
SELECT calcular_edad('1990-01-01');  -- Devuelve la edad en años
```

### Ver y Eliminar Funciones

Para ver las funciones definidas en la base de datos actual:

```sql
SHOW FUNCTION STATUS WHERE Db = 'nombre_base_datos';
```

Si se necesita eliminar una función:

```sql
DROP FUNCTION IF EXISTS nombre_funcion;
```

### Buenas Prácticas

- Evitar cambios en las tablas dentro de una función, ya que las funciones definidas están pensadas para devolver valores calculados, no para modificar datos.
- Declarar la función como `DETERMINISTIC` o `NOT DETERMINISTIC` ayuda a MySQL a optimizar el uso de la función.
- Realizar pruebas exhaustivas para asegurarse de que la función devuelve resultados precisos en diferentes escenarios.

### Otros ejemplos

#### Función Calcular con Descuento

Se requiere calcular el valor total a pagar en una tienda, para ello se genera la función CalcularTotalConDescuento a continuación.

Este código crea una función `CalcularTotalConDescuento` para calcular el precio después de aplicar un descuento.

```
CREATE FUNCTION CalcularTotalConDescuento(precio DECIMAL(10,2), descuento DECIMAL(5,2))
RETURNS DECIMAL(10,2)
BEGIN
    RETURN precio - (precio * descuento / 100);
END;
```

**Escenario**: Supongamos que tenemos una base de datos `Tienda` con una tabla `ventas` que registra los precios de los productos y el porcentaje de descuento aplicado.

**Creación de la Base de Datos y la Tabla:**

**Implementación de la base de datos llamada “Tienda” y tabla “ventas”.**

```sql
CREATE DATABASE Tienda;
USE Tienda;

CREATE TABLE ventas (
    id INT AUTO_INCREMENT,
    producto VARCHAR(100),
    precio DECIMAL(10,2),
    descuento DECIMAL(5,2),
    PRIMARY KEY (id)
);
```

**Insertando Datos de Ejemplo**:

 Implementación de inserción de datos

```sql
INSERT INTO ventas (producto, precio, descuento)
VALUES ('Producto A', 100.00, 10), ('Producto B', 200.00, 5);
```

**Uso de la Función en una Consulta**:

Esta consulta usa la función `CalcularTotalConDescuento` para calcular el precio final de cada producto después del descuento.

```sql
SELECT producto, CalcularTotalConDescuento(precio, descuento) AS precioConDescuento FROM ventas;
```

💡 Explicación y Resultados Esperados

- **Explicación**: La función `CalcularTotalConDescuento` toma el precio y el porcentaje de descuento como parámetros, calcula el monto del descuento y lo resta del precio original.
- **Resultados Esperados**: Una lista de productos con sus precios finales después de aplicar los descuentos correspondientes. Esto simplifica enormemente la consulta, ya que evita tener que escribir la fórmula del descuento cada vez que se necesita. 

#### Función de Cálculo de Promedios

**Se requiere calcular el promedio de ventas de un vendedor, para ello mostraremos como crear la tabla y usar la función de cálculo de promedios.**

Esta función calcula el promedio de ventas de un vendedor específico.

```sql
CREATE FUNCTION PromedioVentas(vendedorID INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(monto_venta) INTO promedio FROM ventas WHERE vendedor_id = vendedorID;
    RETURN promedio;
END;
```

**Creación de la Tabla** `**ventas**`:

Crea la tabla `ventas` para poder hacer la consulta en el paso 3.

```
CREATE TABLE ventas (
    id INT AUTO_INCREMENT,
    vendedor_id INT,
    monto_venta DECIMAL(10,2),
    PRIMARY KEY (id)
);
```

**Uso de la Función en una Consulta**:

-  Esta consulta devuelve el promedio de ventas del vendedor con ID 123.

```
SELECT PromedioVentas(123) AS promedioVentasVendedor;
```

- La función `PromedioVentas` simplifica el cálculo del promedio de ventas, lo que sería más complejo si se hiciera directamente en cada consulta. El resultado esperado es una cifra decimal que representa el promedio de ventas del vendedor especificado.


**Función para contar ciudades en un país**

 Cuenta el número de ciudades en un país dado su ID.

```sql
DELIMITER $$
CREATE FUNCTION contar_ciudades(pais_id INT)
RETURNS INT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad FROM ciudad WHERE id_pais = pais_id;
    RETURN cantidad;
END$$
DELIMITER ;
```

El posible resultado al ejecutar la instrucción`SELECT contar_ciudades(1);` podría ser por ejemplo, 300.

### Taller de Funciones Definidas por el Usuario en MySQL

#### Objetivo

El objetivo de este taller es aprender a crear y utilizar funciones definidas por el usuario (UDF) en MySQL para resolver problemas comunes de bases de datos. Los participantes trabajarán con una base de datos de una tienda de libros, implementarán funciones para cálculos de precio, descuentos y otras tareas específicas.

------

#### Base de Datos: Tienda de Libros

#### Paso 1: Crear la Base de Datos y Tablas

Ejecutar el siguiente script para crear una base de datos llamada `tienda_libros` con las tablas `libros`, `autores`, `clientes` y `ventas`.

```sql
CREATE DATABASE IF NOT EXISTS tienda_libros;
USE tienda_libros;

-- Tabla de libros
CREATE TABLE libros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    autor_id INT,
    precio DECIMAL(8, 2) NOT NULL,
    stock INT NOT NULL,
    fecha_publicacion DATE,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- Tabla de autores
CREATE TABLE autores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

-- Tabla de ventas
CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    libro_id INT,
    cliente_id INT,
    cantidad INT NOT NULL,
    fecha DATE,
    FOREIGN KEY (libro_id) REFERENCES libros(id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

```

#### Paso 2: Insertar Datos en las Tablas

Insertar datos de ejemplo en las tablas para simular transacciones de una tienda de libros.

```sql
INSERT INTO autores (nombre, nacionalidad) VALUES 
('Gabriel García Márquez', 'Colombiana'),
('Isabel Allende', 'Chilena'),
('J.K. Rowling', 'Británica');

INSERT INTO libros (titulo, autor_id, precio, stock, fecha_publicacion) VALUES 
('Cien años de soledad', 1, 200.00, 15, '1967-05-30'),
('La casa de los espíritus', 2, 150.00, 10, '1982-01-01'),
('Harry Potter y la piedra filosofal', 3, 120.00, 8, '1997-06-26');

INSERT INTO clientes (nombre, email) VALUES 
('Juan Pérez', 'juan.perez@example.com'),
('Ana Gómez', 'ana.gomez@example.com');

INSERT INTO ventas (libro_id, cliente_id, cantidad, fecha) VALUES 
(1, 1, 2, '2024-11-10'),
(2, 2, 1, '2024-11-11'),
(3, 1, 1, '2024-11-12');
```

##### Ejercicios de Funciones Definidas por el Usuario

###### Ejercicio 1: Crear una Función para Calcular el Descuento

Cree una función llamada `calcular_descuento` que aplique un descuento al precio de un libro según la cantidad comprada. Si la cantidad es mayor o igual a 3, el descuento es del 10%; de lo contrario, es del 5%.

###### Ejercicio 2: Crear una Función para Calcular el Precio Total de una Venta

Crear una función llamada `calcular_precio_total` que reciba el `libro_id` y la `cantidad` comprada. La función debe devolver el precio total después de aplicar el descuento calculado por la función anterior (`calcular_descuento`).

###### Ejercicio 3: Crear una Función para Obtener la Edad de un Libro

Cree una función llamada `calcular_edad_libro` que reciba el `libro_id` y devuelva la antigüedad del libro en años a partir de la fecha de publicación.

###### Ejercicio 4: Crear una Función para Calcular el Stock Restante Después de una Venta

Cree una función llamada `calcular_stock_restante` que reciba el `libro_id` y la `cantidad` vendida, y devuelva el stock restante.

###### Ejercicio Final: Reporte Completo de Ventas

Usando las funciones creadas, construya una consulta que muestre un reporte de ventas con el nombre del cliente, el título del libro, el precio original, el precio total después del descuento, la antigüedad del libro, y el stock restante.

# Triggers

Los *triggers* (o disparadores) en MySQL son objetos de la base de datos que se ejecutan automáticamente en respuesta a ciertos eventos en una tabla, como inserciones, actualizaciones o eliminaciones de registros. Los triggers son útiles para asegurar la integridad de los datos, realizar auditorías o llevar a cabo tareas automáticas sin intervención manual.

A continuación, se explica cómo funcionan los triggers en MySQL, con ejemplos detallados para entender su uso.

### Partes de Triggers

<img src="https://i.ibb.co/HhVLsjQ/image.png" style="zoom:80%;" />

1. **Time (Tiempo)**: Indica si el *trigger* se ejecutará **antes** (*BEFORE*) o **después** (*AFTER*) del evento en cuestión.
2. **Event (Evento)**: Muestra los tres eventos principales que pueden activar un *trigger* en una tabla de MySQL:
   - **INSERT**: Cuando se inserta un nuevo registro.
   - **UPDATE**: Cuando se actualiza un registro existente.
   - **DELETE**: Cuando se elimina un registro.

#### Tipos de Triggers en MySQL

La combinación de estos elementos permite crear seis tipos de *triggers*:

- **BEFORE INSERT**: Se ejecuta antes de que se inserte un nuevo registro.
- **AFTER INSERT**: Se ejecuta después de que se ha insertado un nuevo registro.
- **BEFORE UPDATE**: Se ejecuta antes de actualizar un registro existente.
- **AFTER UPDATE**: Se ejecuta después de actualizar un registro existente.
- **BEFORE DELETE**: Se ejecuta antes de eliminar un registro.
- **AFTER DELETE**: Se ejecuta después de eliminar un registro.

### Sintaxis Básica de un Trigger

La sintaxis básica para crear un trigger en MySQL es la siguiente:

```sql
CREATE TRIGGER nombre_trigger
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON nombre_tabla
FOR EACH ROW
BEGIN
    -- Cuerpo del trigger
    -- Instrucciones SQL que se ejecutarán cuando se active el trigger
END;
```

**BEFORE o AFTER**: Indica si el trigger se ejecutará antes o después de la operación.

**INSERT, UPDATE, DELETE**: Define el evento que activará el trigger.

**FOR EACH ROW**: Significa que el trigger se ejecutará una vez por cada fila afectada por el evento.

**BEGIN ... END**: Define el bloque de código que se ejecutará dentro del trigger.

### Ejemplos Prácticos de Triggers

A continuación se muestran ejemplos para entender mejor el uso de triggers en MySQL.

#### Ejemplo 1: Trigger `AFTER INSERT` para Auditoría

Este trigger registra cada inserción en una tabla de auditoría para rastrear los cambios en los registros de clientes.

```sql
CREATE TABLE auditoria_clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    accion VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TRIGGER after_insert_cliente
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_clientes (cliente_id, accion) 
    VALUES (NEW.id, 'INSERT');
END;

```

En este caso:

- Cada vez que se inserte un nuevo cliente en la tabla `clientes`, se agregará automáticamente un registro en la tabla `auditoria_clientes` para indicar que se realizó un `INSERT` en esa tabla.

#### Ejemplo 2: Trigger `BEFORE UPDATE` para Validación

Este trigger impide que el precio de un producto en la tabla `productos` se actualice a un valor negativo.

```sql
CREATE TRIGGER before_update_precio
BEFORE UPDATE ON productos
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio no puede ser negativo';
    END IF;
END;
```

En este caso:

- Antes de actualizar el precio de un producto, el trigger verifica que el nuevo valor (`NEW.precio`) no sea negativo. Si es negativo, el trigger genera un error, y la operación de actualización no se realiza.

#### Ejemplo 3: Trigger `AFTER DELETE` para Actualizar el Stock de otro Producto

Supongamos que hay una tabla `ventas` que guarda las ventas de productos y se quiere que, cuando se elimine una venta, se restaure el stock del producto vendido.

```sql
CREATE TRIGGER after_delete_venta
AFTER DELETE ON ventas
FOR EACH ROW
BEGIN
    UPDATE productos 
    SET stock = stock + OLD.cantidad
    WHERE id = OLD.producto_id;
END;
```

En este caso:

- Cuando se elimina una venta en la tabla `ventas`, el trigger ejecuta una actualización en la tabla `productos`, incrementando el stock del producto según la cantidad registrada en la venta eliminada.

#### Ejemplo 4: Trigger `AFTER UPDATE` para Registrar Cambios en Datos Sensibles

Imaginemos que se necesita llevar un historial de cambios en el salario de los empleados. Este trigger guarda el cambio de salario en una tabla de auditoría.

```sql
CREATE TABLE auditoria_salarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    salario_anterior DECIMAL(10, 2),
    nuevo_salario DECIMAL(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER after_update_salario
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF OLD.salario <> NEW.salario THEN
        INSERT INTO auditoria_salarios (empleado_id, salario_anterior, nuevo_salario) 
        VALUES (OLD.id, OLD.salario, NEW.salario);
    END IF;
END;

```

En este caso:

- El trigger verifica si el salario ha cambiado (`OLD.salario <> NEW.salario`). Si es así, inserta un registro en la tabla `auditoria_salarios` con el `empleado_id`, el salario anterior (`OLD.salario`) y el nuevo salario (`NEW.salario`).

### Ver Triggers en la Base de Datos

Para ver todos los triggers de una base de datos específica, puedes ejecutar:

```sql
SHOW TRIGGERS FROM nombre_base_datos;
```

También puedes consultar detalles específicos en la tabla `information_schema.TRIGGERS`:

```sql
SELECT * FROM information_schema.TRIGGERS WHERE TRIGGER_SCHEMA = 'nombre_base_datos';
```

### Eliminar un Trigger

Para eliminar un trigger, utiliza la siguiente sintaxis:

```sql
DROP TRIGGER IF EXISTS nombre_trigger;
```

### Buenas Prácticas al Usar Triggers

1. **Usar triggers solo cuando sea necesario**: Los triggers son útiles, pero pueden complicar la depuración de la lógica de negocio si no se documentan bien. Deben usarse principalmente para tareas como auditoría, validación de datos y sincronización de datos entre tablas.
2. **Evitar lógica compleja en triggers**: Los triggers con demasiada lógica compleja pueden afectar el rendimiento y hacer que las operaciones sean más lentas. Es preferible que los triggers ejecuten operaciones sencillas.
3. **Manejar errores adecuadamente**: Si un trigger debe evitar ciertos valores (por ejemplo, precios negativos), utiliza la instrucción `SIGNAL` para generar errores que interrumpan la ejecución cuando ocurran datos no válidos.
4. **Documentar los triggers**: Debido a que los triggers se ejecutan automáticamente, es importante documentar su comportamiento para que otros desarrolladores entiendan cuándo y por qué se ejecutan.
5. **Monitoreo y pruebas**: Realizar pruebas exhaustivas de triggers para asegurarse de que están funcionando correctamente en todos los escenarios posibles y que no generan efectos secundarios no deseados en otras operaciones de la base de datos.

## Taller de Triggers en MySQL

### Objetivo

El objetivo de este taller es aprender a crear y utilizar *triggers* en MySQL para realizar tareas automáticas en la base de datos, como auditoría de cambios, validaciones de datos, y manejo de lógica de negocio.

Base de Datos: Gestión de Empleados y Salarios

En este taller, se trabajará con una base de datos llamada `empresa`, que tiene tablas para gestionar empleados y sus salarios, así como una tabla de auditoría para rastrear cambios.

### Paso 1: Crear la Base de Datos y Tablas

Ejecuta el siguiente script para crear la base de datos `empresa` y las tablas `empleados`, `salarios` y `auditoria_salarios`.

```sql
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Tabla de empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    posicion VARCHAR(50),
    fecha_contratacion DATE
);

-- Tabla de salarios
CREATE TABLE salarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    salario DECIMAL(10, 2) NOT NULL,
    fecha_ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

-- Tabla de auditoría de cambios en salarios
CREATE TABLE auditoria_salarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    salario_anterior DECIMAL(10, 2),
    nuevo_salario DECIMAL(10, 2),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

```

### Paso 2: Insertar Datos de Ejemplo

Agrega algunos datos de ejemplo a las tablas `empleados` y `salarios`:

```sql
INSERT INTO empleados (nombre, posicion, fecha_contratacion) VALUES 
('Carlos Gómez', 'Gerente', '2018-04-10'),
('Laura Pérez', 'Analista', '2020-07-15');

INSERT INTO salarios (empleado_id, salario) VALUES 
(1, 5000.00),
(2, 3000.00);
```

### Ejercicios de Triggers

#### Ejercicio 1: Crear un Trigger `AFTER INSERT` para Auditoría de Salarios

Crear un trigger llamado `after_insert_salario` que registre un cambio en la tabla `auditoria_salarios` cada vez que se inserte un nuevo salario para un empleado.

#### Ejercicio 2: Crear un Trigger `BEFORE UPDATE` para Validar Aumento de Salario

Crear un trigger llamado `before_update_salario` que valide que el nuevo salario de un empleado no sea menor que el salario actual.

#### Ejercicio 3: Crear un Trigger `AFTER UPDATE` para Registrar Cambios en el Salario

Crear un trigger llamado `after_update_salario` que registre en la tabla `auditoria_salarios` cada vez que se actualice el salario de un empleado.

#### Ejercicio 4: Crear un Trigger `AFTER DELETE` para Manejar la Eliminación de Salarios

Crear un trigger llamado `after_delete_salario` que registre en la tabla `auditoria_salarios` cuando se elimine un salario, indicando que el nuevo salario es `0.00`.

Ejercicio Final: Crear un Reporte de Auditoría Completo

Crea una consulta para mostrar un informe de auditoría de cambios en los salarios, incluyendo el nombre del empleado, el salario anterior, el nuevo salario, y la fecha de cada cambio.

