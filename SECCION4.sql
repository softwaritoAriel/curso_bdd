-- TEMA: CONSTRAINST

USE store;

CREATE TABLE city(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) 
);

ALTER TABLE city CHANGE COLUMN name name VARCHAR(50) NOT NULL;

-- INSERT INTO city(name)
-- VALUES('CDMX');

ALTER TABLE city ADD UNIQUE(name); 

ALTER TABLE customer ADD COLUMN currency VARCHAR(3) DEFAULT 'MXN';
ALTER TABLE customer ADD COLUMN create_at DATETIME;
-- ALTER TABLE customer ALTER create_at SET DEFAULT CURRENT_TIMESTAMP();

INSERT INTO customer(name, email)
VALUES('Rodrigo2', 'ss2@gmail.com');
SELECT * FROM store.customer;



-- INDEX
CREATE INDEX idx_name ON customer(name);
ALTER TABLE customer DROP INDEX idx_name;


-- CHECK
ALTER TABLE customer ADD CONSTRAINT check_name CHECK(name <> 'abc'); 
ALTER TABLE customer ADD CONSTRAINT check_name CHECK(crated_at <> '1990-01-01'); 
ALTER TABLE customer DROP CONSTRAINT check_name;
SHOW CREATE TABLE customer;




-- FOREING KEY 
ALTER TABLE customer ADD COLUMN city_id INT;
ALTER TABLE customer ADD CONSTRAINT fk_city FOREIGN KEY(city_id) REFERENCES city(id); 



