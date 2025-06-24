CREATE DATABASE IF NOT EXISTS cLouay;
USE cLouay;
CREATE TABLE IF NOT EXISTS persons (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);
INSERT INTO persons (name) VALUES ('Bassel'), ('Saeed'), ('Anbar'), ('Hisham'), ('Louay');