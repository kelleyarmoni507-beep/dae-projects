-- sql/dog_breeding.sql
-- Create database and tables for the assignment

CREATE DATABASE IF NOT EXISTS dog_breeding CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE dog_breeding;

-- Table: breeders
CREATE TABLE IF NOT EXISTS breeders (
  breeder_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  location VARCHAR(100),
  contact_email VARCHAR(120)
) ENGINE=InnoDB;

-- Table: dogs
CREATE TABLE IF NOT EXISTS dogs (
  dog_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  breed VARCHAR(80) NOT NULL,
  age_years INT,
  breeder_id INT,
  image_path VARCHAR(255),
  FOREIGN KEY (breeder_id) REFERENCES breeders(breeder_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Table: litters
CREATE TABLE IF NOT EXISTS litters (
  litter_id INT AUTO_INCREMENT PRIMARY KEY,
  mother_dog_id INT NOT NULL,
  puppy_count INT NOT NULL,
  birth_date DATE,
  FOREIGN KEY (mother_dog_id) REFERENCES dogs(dog_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table: sales
CREATE TABLE IF NOT EXISTS sales (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  dog_id INT NOT NULL,
  sale_price DECIMAL(8,2),
  sale_date DATE,
  status VARCHAR(30),
  FOREIGN KEY (dog_id) REFERENCES dogs(dog_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Populate breeders (at least 3 rows)
INSERT INTO breeders (name, location, contact_email)
VALUES
  ('Greenwood Kennels','Springfield','greenwood@example.com'),
  ('River Bend Breeders','Rivertown','contact@riverbend.example'),
  ('Sunny Paws','Lakeside','hello@sunny-paws.example');

-- Populate dogs (at least 3 rows)
INSERT INTO dogs (name, breed, age_years, breeder_id, image_path)
VALUES
  ('Buddy','Labrador',3,1,'images/lab.jpg'),
  ('Milo','Beagle',2,2,'images/beagle.jpg'),
  ('Luna','Poodle',1,3,'images/poodle.jpg');

-- Populate litters (example)
INSERT INTO litters (mother_dog_id, puppy_count, birth_date)
VALUES
  (1, 5, '2024-11-01'),
  (2, 4, '2025-02-10');

-- Populate sales (optional example)
INSERT INTO sales (dog_id, sale_price, sale_date, status)
VALUES
  (1, 1200.00, '2025-02-20', 'sold'),
  (3, 900.00, '2025-03-11', 'available');

-- DESCRIBE commands to take screenshots of results
DESCRIBE breeders;
DESCRIBE dogs;
DESCRIBE litters;
DESCRIBE sales;
