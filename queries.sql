/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >='2016-01-01' and date_of_birth<='2019-12-31';
SELECT  name FROM animals WHERE  neutered = 'true' and escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu' ;
SELECT name, escape_attempts FROM animals WHERE  weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name <> 'Gabumon' ; 
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

begin;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

SELECT * FROM animals;

begin;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS null;
COMMIT;

SELECT * FROM animals;

begin;
DELETE FROM animals
where date_of_birth >'2022-01-01';

savepoint  my_save;
UPDATE animals
SET weight_kg = weight_kg * (-1);

rollback to my_save;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;

commit;

SELECT * FROM animals;

