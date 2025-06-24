# Comandos de Clase

## SELECT Y INSERT

### SELECT -> FILTRAR Y BUSCAR INFO

SINTAXIS.

SELECT COL1,COL2

FROM TABLA

WHERE CONDICION;

```
mysql> DESC countries;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id           | int         | NO   | PRI | NULL    | auto_increment |
| country_name | varchar(60) | NO   | UNI | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
```

INSERT INTO countries(country_name) VALUES ('Colombia'),('Estados Unidos');

SELECT  country_name FROM countries;

```
mysql> SELECT  country_name FROM countries;
+----------------+
| country_name   |
+----------------+
| Colombia       |
| Estados Unidos |
+----------------+
2 rows in set (0.00 sec)
```

```
mysql> DESC regions;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id          | int         | NO   | PRI | NULL    | auto_increment |
| region_name | varchar(60) | NO   | UNI | NULL    |                |
| country_id  | int         | NO   | MUL | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)
```

```
mysql> SELECT  ID,country_name FROM countries;
+----+----------------+
| ID | country_name   |
+----+----------------+
|  1 | Colombia       |
|  2 | Estados Unidos |
+----+----------------+
2 rows in set (0.00 sec)
```

INSERT INTO regions (region_name,country_id)  VALUES ('Santander',1),

('Norte de Santander',1);

```
mysql> DESC cities;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int         | NO   | PRI | NULL    | auto_increment |
| city_name | varchar(50) | NO   | UNI | NULL    |                |
| region_id | int         | NO   | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)
```

INSERT INTO cities(city_name,region_id) VALUES ('Bucaramanga',1),('Giron',1),('Cucuta',2), ('Villa del rosario',2);

```
mysql> SELECT id,region_name,country_id FROM regions;
+----+--------------------+------------+
| id | region_name        | country_id |
+----+--------------------+------------+
|  1 | Santander          |          1 |
|  2 | Norte de Santander |          1 |
+----+--------------------+------------+
2 rows in set (0.00 sec)
```

```sql
SELECT regions.id,regions.region_name,countries.id,countries.country_name
FROM countries, regions
WHERE countries.id = regions.country_id;

SELECT regions.id,regions.region_name,countries.country_name
FROM countries, regions
WHERE countries.id = regions.country_id;

SELECT r.id,r.region_name,c.country_name
FROM countries AS c, regions AS r
WHERE c.id = r.country_id;

SELECT 
c.id,c.country_name,
r.id,r.region_name,
ci.id,ci.city_name
FROM countries AS c, regions AS r, cities AS ci
WHERE c.id = r.country_id AND r.id = ci.region_id;

INSERT INTO cities(city_name,region_id) VALUES ('fLORIDA bLANCA',2);

UPDATE cities
SET city_name = 'Floridablanca',region_id = 1
WHERE id = 5;

SELECT id, city_name FROM cities;

ALTER TABLE sgcm.patients ADD CONSTRAINT patients_cities_FK FOREIGN KEY (city_id) REFERENCES sgcm.cities(id);

INSERT INTO countries (id, country_name) VALUES
(3, 'Argentina'),
(4, 'Brasil'),
(5, 'Chile'),
(6, 'Perú'),
(7, 'Venezuela'),
(8, 'Ecuador'),
(9, 'Uruguay'),
(10, 'Paraguay');

INSERT INTO regions (id, region_name, country_id) VALUES
(3,'Cundinamarca', 1),
(4,'Antioquia', 1),
(5,'Valle del Cauca', 1),
(6,'Atlántico', 1);

INSERT INTO cities (id, city_name, region_id) VALUES
(100, 'Bogotá', 3),
(101, 'Soacha', 3),
(102, 'Fusagasugá', 3),
(103, 'Zipaquirá', 3),
(104, 'Chía', 3),
(105, 'Medellín', 4),
(106, 'Envigado', 4),
(107, 'Bello', 4),
(108, 'Itagüí', 4),
(109, 'Rionegro', 4),
(110, 'Cali', 5),
(111, 'Palmira', 5),
(112, 'Buenaventura', 5),
(113, 'Tuluá', 5),
(114, 'Yumbo', 5),
(118, 'Piedecuesta', 1),
(119, 'Barrancabermeja', 1),
(120, 'Barranquilla', 6),
(121, 'Soledad', 6),
(122, 'Malambo', 6),
(123, 'Puerto Colombia', 6),
(124, 'Galapa', 6);

INSERT INTO genders (id, description) VALUES
(3, 'Otro');

INSERT INTO document_types (id, description) VALUES
(1, 'Cédula de Ciudadanía'),
(2, 'Tarjeta de Identidad'),
(3, 'Cédula de Extranjería'),
(4, 'Pasaporte');

INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1001', 'Miguel Ángel', 'García Pérez', 2, 2, 100),
('PD1002', 'Carlos Andrés', 'López Ramírez', 1, 2, 100),
('PD1003', 'Miguel Ángel', 'Gómez Torres', 2, 1, 100),
('PD1004', 'José Luis', 'Ramos Castillo', 1, 3, 100),
('PD1005', 'Luis Miguel', 'García Pérez', 2, 1, 100),
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1011', 'Laura Sofía', 'Rodríguez López', 1, 1, 101),
('PD1012', 'María José', 'Martínez Gómez', 1, 2, 101),
('PD1013', 'Laura Sofía', 'Torres Castro', 1, 2, 101),
('PD1014', 'Laura Sofía', 'García Pérez', 3, 1, 101),
('PD1015', 'Paula Andrea', 'Romero Ríos', 2, 1, 101);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1021', 'Paula Andrea', 'Rodríguez López', 3, 1, 102),
('PD1022', 'Carlos Andrés', 'Romero Ríos', 2, 4, 102),
('PD1023', 'Laura Sofía', 'Martínez Gómez', 2, 3, 102),
('PD1024', 'Paula Andrea', 'Rodríguez López', 2, 2, 102),
('PD1025', 'Juan Carlos', 'Pérez Díaz', 1, 2, 102);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1031', 'Juan Carlos', 'Pérez Díaz', 1, 1, 103),
('PD1032', 'Miguel Ángel', 'Martínez Gómez', 2, 3, 103),
('PD1033', 'Laura Sofía', 'Pérez Díaz', 1, 2, 103),
('PD1034', 'Luis Miguel', 'García Pérez', 3, 1, 103),
('PD1035', 'José Luis', 'Moreno Vargas', 1, 2, 103);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1041', 'Luis Miguel', 'Ramos Castillo', 1, 1, 104),
('PD1042', 'Carlos Andrés', 'Rodríguez López', 2, 1, 104),
('PD1043', 'Laura Sofía', 'Ramos Castillo', 1, 2, 104),
('PD1044', 'José Luis', 'Ramos Castillo', 2, 2, 104),
('PD1045', 'Juan Carlos', 'Ramos Castillo', 1, 2, 104);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1051', 'Paula Andrea', 'Pérez Díaz', 2, 1, 105),
('PD1052', 'Laura Sofía', 'Torres Castro', 2, 3, 105),
('PD1053', 'María José', 'García Pérez', 1, 1, 105),
('PD1054', 'María José', 'Ramos Castillo', 2, 1, 105),
('PD1055', 'Laura Sofía', 'Ramos Castillo', 2, 1, 105);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1061', 'Juan Carlos', 'Rodríguez López', 3, 2, 106),
('PD1062', 'José Luis', 'García Pérez', 1, 4, 106),
('PD1063', 'Juan Carlos', 'Moreno Vargas', 3, 3, 106),
('PD1064', 'Laura Sofía', 'Gómez Torres', 3, 1, 106),
('PD1065', 'Juan Carlos', 'Pérez Díaz', 1, 2, 106),
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1071', 'Carlos Andrés', 'Martínez Gómez', 3, 4, 107),
('PD1072', 'Sara Lucía', 'López Ramírez', 2, 2, 107),
('PD1073', 'Luis Miguel', 'Rodríguez López', 3, 4, 107),
('PD1074', 'Ana María', 'Romero Ríos', 2, 4, 107),
('PD1075', 'Laura Sofía', 'Torres Castro', 2, 1, 107);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1081', 'María José', 'Pérez Díaz', 1, 3, 108),
('PD1082', 'Luis Miguel', 'Gómez Torres', 2, 1, 108),
('PD1083', 'Miguel Ángel', 'Torres Castro', 3, 4, 108),
('PD1084', 'Laura Sofía', 'García Pérez', 3, 3, 108),
('PD1085', 'Carlos Andrés', 'Pérez Díaz', 3, 4, 108);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1091', 'Paula Andrea', 'Ramos Castillo', 3, 2, 109),
('PD1092', 'Paula Andrea', 'Ramos Castillo', 3, 3, 109),
('PD1093', 'José Luis', 'Rodríguez López', 1, 1, 109),
('PD1094', 'Carlos Andrés', 'Rodríguez López', 1, 1, 109),
('PD1095', 'Paula Andrea', 'Rodríguez López', 2, 4, 109);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1101', 'Juan Carlos', 'Gómez Torres', 3, 2, 110),
('PD1102', 'Ana María', 'Moreno Vargas', 3, 2, 110),
('PD1103', 'Laura Sofía', 'Rodríguez López', 1, 2, 110),
('PD1104', 'José Luis', 'Pérez Díaz', 1, 1, 110),
('PD1105', 'Juan Carlos', 'Ramos Castillo', 2, 3, 110);
INSERT INTO patients (id, first_name, last_name, gender_id, documenttype_id, city_id) VALUES
('PD1111', 'Sara Lucía', 'Pérez Díaz', 1, 4, 111),
('PD1112', 'Miguel Ángel', 'Romero Ríos', 3, 1, 111),
('PD1113', 'Laura Sofía', 'Gómez Torres', 2, 2, 111),
('PD1114', 'Sara Lucía', 'López Ramírez', 2, 3, 111),
('PD1115', 'María José', 'Martínez Gómez', 1, 1, 111);

OP. LOG -> AND, OR, NOT
OP. COMP -> =, >, <, >=, <=, <>

SELECT id, first_name, last_name, gender_id, documenttype_id, city_id
FROM patients
WHERE first_name LIKE '%Sara%';
LIKE

BETWEEN AND
```

# JOINS

```SQL
SELECT regions.id,regions.region_name,countries.id,countries.country_name
FROM countries, regions
WHERE countries.id = regions.country_id;

SELECT c.id,c.country_name,r.id,r.region_name
FROM countries AS c
INNER JOIN regions AS r  ON c.id = r.country_id;

SELECT c.id,c.country_name,r.id,r.region_name,ci.city_name
FROM countries as c, cities as ci
INNER JOIN regions as r ON c.id = r.country_id AND ci.id = c.region_id;

SELECT p.id, p.first_name, p.last_name, p.gender_id, p.documenttype_id,c.city_name
FROM patients AS p
INNER JOIN cities AS c ON c.id = p.city_id
WHERE first_name LIKE '%Sara%';

SELECT p.id, p.first_name, p.last_name, p.gender_id, p.documenttype_id,c.city_name,r.region_name
FROM patients AS p 
INNER JOIN cities AS c ON c.id = p.city_id
INNER JOIN regions AS r ON r.id = c.region_id
WHERE first_name LIKE '%Sara%';

SELECT p.id, p.first_name, p.last_name, p.gender_id, d.description,c.city_name,r.region_name
FROM patients AS p 
INNER JOIN cities AS c ON c.id = p.city_id
INNER JOIN regions AS r ON r.id = c.region_id
INNER JOIN document_types AS d ON d.id = p.documenttype_id
WHERE first_name LIKE '%Sara%';

SELECT p.id, p.first_name, p.last_name,g.description,d.description,c.city_name,r.region_name
FROM patients AS p 
INNER JOIN cities AS c ON c.id = p.city_id
INNER JOIN regions AS r ON r.id = c.region_id
INNER JOIN document_types AS d ON d.id = p.documenttype_id
INNER JOIN genders AS g ON g.id = p.gender_id
WHERE first_name LIKE '%Sara%';

documenttype_id
```

