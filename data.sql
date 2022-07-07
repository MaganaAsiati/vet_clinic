/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', 'Feb 3, 2020', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', 'Nov 15, 2018', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', 'Jan 7, 2021', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', 'May 12, 2017', 11, true, 5);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', 'Feb 8, 2020', 0, false, 1), ('Plantmon', 'Nov 15, 2021', 5.7, true, 2), ('Squirtle', 'Apr 2, 1993', 12.13, true, 3), ('Angemon', 'Jun 12, 2005', 45, true, 1), ('Boarmon', 'Jun 7, 2005', 20.4, true, 7), ('Blossom', 'Oct 13, 1998', 17, true, 3), ('Ditto', 'May 14, 2022', 22, true, 4);

INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
BEGIN;
UPDATE animals SET species_id = 2 where name LIKE '%mon';
UPDATE animals SET species_id = 1 where species_id is null;
COMMIT;

BEGIN;
UPDATE animals SET owner_id = 1 where name='Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Plantmon', 'Devimon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
COMMIT;