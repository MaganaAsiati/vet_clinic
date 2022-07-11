/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN ,
    weight_kg DECIMAL,
);

ALTER TABLE animals ADD species VARCHAR(100);

/* Add onwer and species table to vet_clinic database. */
CREATE TABLE IF NOT EXISTS owners (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100),
    age INT
);

CREATE TABLE IF NOT EXISTS species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

  /*Create a table named vets */

CREATE TABLE IF NOT EXISTS vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name  VARCHAR(100),
    age INT,
    date_of_graduation  DATE
);
 /* Create specialization table */

CREATE TABLE IF NOT EXISTS specializations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    species_id INT,
    FOREIGN KEY (species_id) REFERENCES species(id),
    vet_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets(id)

);

  /* create visits table */

CREATE TABLE IF NOT EXISTS visits (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_of_visit DATE,
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    vet_id INT,
    FOREIGN KEY (vet_id) REFERENCES vets(id)

);
 /* remove species column in animals table*/
ALTER TABLE animals
DROP COLUMN species;

 /*Add foreign key to animals table from species table*/
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id),
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);


-- Add an email column to your owners table

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Add animals_id index to visits table
CREATE INDEX visits_animals_id_asc ON visits(animals_id ASC);
-- Create vets_id index on visits table
CREATE INDEX visits_vets_id_asc ON visits(vets_id ASC);
-- CREATE email index on owners table
CREATE INDEX owners_email_asc ON owners(email, ASC);