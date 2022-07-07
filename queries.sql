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

SELECT COUNT (*) as number_of_animals FROM animals;
SELECT COUNT (*) as number_no_escape FROM animals WHERE escape_attempts = 0;
SELECT AVG (weight_kg) as average_weight FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-01-01' GROUP BY species;



SELECT A.name, O.full_name FROM animals A
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Melody Pond';


SELECT A.name, S.name 
FROM animals A
JOIN species S
ON S.id = A.species_id
WHERE S.name = 'Pokemon';



SELECT O.full_name as owner, A.name as animal
FROM animals A
RIGHT JOIN owners O
ON O.id = A.owner_id;

SELECT COUNT(*), S.name 
FROM animals A
JOIN species S
ON S.id = A.species_id
GROUP BY S.name 


SELECT A.name, O.full_name
FROM animals A
JOIN species S
ON S.id = A.species_id
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Jennifer Orwell';


SELECT A.name, O.full_name
FROM animals A
JOIN species S
ON S.id = A.species_id
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;


SELECT O.full_name, COUNT(*)
FROM animals A
JOIN owners O
ON O.id = A.owner_id
GROUP BY (O.full_name)
ORDER BY COUNT(*) 
DESC LIMIT 1;



SELECT A.name FROM animals A
JOIN visits V
ON A.id = V.animal_id
JOIN vets VE
ON VE.id = V.vet_id
WHERE VE.name = 'William Tatcher'
ORDER BY V.date_of_visit
DESC LIMIT 1;

SELECT count(A.name), VE.name FROM animals A
JOIN visits V
ON A.id = V.animal_id
JOIN vets VE
ON VE.id = V.vet_id
where VE.name ='Stephanie Mendez'
group by  VE.name;

SELECT VE.name as name_of_vets, S.name as name_of_animals FROM  vets VE
left  Join specializations SP
ON VE.id = SP.vet_id
left JOIN species S
ON  S.id = SP.species_id


SELECT A.name,VE.name,V.date_of_visit  FROM animals A
JOIN visits V
ON A.id = V.animal_id
JOIN vets VE
ON VE.id = V.vet_id
WHERE VE.name = 'Stephanie Mendez' and V.date_of_visit >= 'Apr 01, 2020' and V.date_of_visit >= 'Aug 30, 2020' 
 
