-- Tema: JOINS
USE store;

SET SQL_SAFE_UPDATES = 0; 

-- INNER JOIN
SELECT * FROM customer INNER JOIN city ON city.id = customer.city_id;
SELECT customer.name, c.name as 'city' FROM customer INNER JOIN city AS c ON c.id = customer.city_id; 



-- LEFT JOIN
SELECT customer.name, IFNULL(city.name, 'Sin ciudad') as 'city' FROM customer LEFT JOIN city ON city.id = customer.city_id;



-- RIGHT JOIN
SELECT customer.name, IFNULL(city.name, 'Sin ciudad') as 'city' FROM customer RIGHT JOIN city ON city.id = customer.city_id;
SELECT customer.name, IFNULL(city.name, 'Sin ciudad') as 'city' FROM city RIGHT JOIN customer ON city.id = customer.city_id;


-- CROSS JOIN
SELECT * FROM customer CROSS JOIN city;



-- UNION
SELECT name FROM customer UNION SELECT 'uno mas';
SELECT id, name FROM customer UNION SELECT 'uno mas', 'algo mas';
SELECT id, name, 'cliente' FROM customer UNION SELECT id, name, 'ciudad' FROM city;




-- SELF JOIN
ALTER TABLE customer ADD COLUMN referred_id INT;
ALTER TABLE customer ADD CONSTRAINT fk_referred FOREIGN KEY(referred_id) REFERENCES customer(id); 

UPDATE customer SET referred_id = 1 WHERE id <> 1;
-- UPDATE customer SET referred_id = 1000 WHERE id <> 1;

SELECT c1.name, IFNULL(c2.name, 'Sin referido') as 'quien te recomienda' FROM customer as c1 INNER JOIN customer as c2 ON c2.id = c1.referred_id;
SELECT c1.name, IFNULL(c2.name, 'Sin referido') as 'quien te recomienda' FROM customer as c1 LEFT JOIN customer as c2 ON c2.id = c1.referred_id;



-- FULL JOIN
SELECT * FROM customer LEFT join city ON city.id = customer.city_id UNION SELECT * FROM customer RIGHT JOIN city ON city.id = customer.city_id;







