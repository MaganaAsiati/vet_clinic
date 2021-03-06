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

INSERT INTO vets (name, age, date_of_graduation) VALUES('William Tatcher',45,'2000-04-23' ),('Maisy Smith',26,'2019-01-17' ),('Stephanie Mendez',64,'1981-05-04'),('Jack Harkness',38,'2008-06-08'); 
INSERT INTO specializations (vet_id, species_id )VALUES( 1,1),(3,1),(3,2),(4,2);

INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES(1, 1, 'May 24, 2020'), (1, 3, 'Jul 22, 2020'), (2, 4, 'Feb 02, 2021'), (3, 2, 'Jan 05, 2020'), (3, 2, 'Mar 08, 2020'), (3, 2, 'May 14, 2020'), (4, 3, 'May 04, 2021'), (5, 4, 'Feb 24 2021'), (6, 2, 'Dec 21, 2019'), (6, 1, 'Aug 10, 2020'), (6, 2, 'Apr 07, 2021'), (7, 3, 'Sept 29, 2019'), (8, 4, 'Oct 03, 2020'), (8, 4, 'Nov 04, 2020'), (9, 2, 'Jan 24, 2019'), (9, 2, 'May 15, 2019'), (9, 2, 'Feb 27, 2020'), (9, 2, 'Aug 03, 2020'), (10, 3, 'May 24, 2020'), (10, 1, 'Jan 11, 2021');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';