USE store;

-- INSERTAR INFORMACION
INSERT INTO customer(name, email)
VALUES ('Francisco', 'alonsofrancisco@gmail.com');


-- INSERTAR VARIOS REGISTROS
INSERT INTO customer(name, email)
VALUES -- ('Francisco', 'francisco@gmail.com');
('juan', 'juan@gmail.com'),
('ana', 'ana@gmail.com'),
('héctor', 'héctor@gmail.com');


-- CONSULTAR INFORMACION
SELECT * FROM customer -- MUESTRA TODA LA INFORMACION DE LA TABLA
LIMIT 2, 2; -- PARA MOSTRAR POT RAGO DE ELEMENTOS
SELECT name from customer; -- MOSTRAR SOLO NAME
SELECT 'Algo', 3, name FROM customer;
SELECT UPPER(name) FROM customer; -- CONVIERTE EN MAYUSCULAS MI CONTENIDO
SELECT LOWER(name) FROM customer; -- CONVIERTE A MINUSCULAS
SELECT name ,LENGTH(NAME) AS 'longitud' FROM customer; -- AS PARA EL NOMBRE DE LA COLUMNA O TABLA CON ALIAS


-- ORDERNAR INFROMACION
SELECT * FROM customer ORDER BY id; -- ORDENA ACEDENTEMENTE
SELECT * FROM customer ORDER BY id DESC; -- ORDENA DESENDETEMENTE
SELECT * FROM customer ORDER BY LOWER(name) DESC, email; -- ORDENAR POR NOMBRE Y CORREO ELECTRONICO


-- 
SELECT * FROM customer WHERE LOWER(name) = 'francisco' OR name = 'ana';
SELECT * FROM customer WHERE LOWER(name) = 'francisco' AND email = 'francisco@gmail.com';
SELECT * FROM customer WHERE LENGTH(name) >= 3;

-- 
SET SQL_SAFE_UPDATES = 0;

UPDATE customer SET name = 'pancho' WHERE id = 1;
UPDATE customer SET name = UPPER(name) WHERE name = 'ana';
UPDATE customer SET name = 'frank', email = 'francisco58@gmail.com' WHERE id = 1;
UPDATE customer SET NAME = UPPER(name) WHERE id IN(2,3,4);

--
DELETE FROM customer; -- Eliminar informacion de la tabla el id no se resetea
DELETE FROM customer WHERE id = 1;
DELETE FROM customer WHERE id IN(2,3);
TRUNCATE TABLE customer;


SELECT name, COUNT(*) AS 'CANTIDAD' 
FROM customer
GROUP BY name;


