/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3

BEGIN;
  UPDATE animals
      SET species = 'unspecified';
ROLLBACK;

BEGIN;
  UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
  UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
  DELETE FROM animals;
ROLLBACK;

BEGIN;
  DELETE FROM animals 
    WHERE date_of_birth > '2022-01-01';

  SAVEPOINT date_of_birth_clear;

  UPDATE animals 
    SET weight_kg = weight_kg * -1;

  ROLLBACK TO SAVEPOINT date_of_birth_clear;

  UPDATE animals
    SET weight_kg = -weight_kg
    where weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT MAX(escape_attempts) FROM animals
GROUP BY neutered;

SELECT MIN(weight_kg), MAX(weight_kg) FROM animals
GROUP BY species;

SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';


SELECT name, full_name
  FROM animals
  INNER JOIN owners
  ON animals.owners_id = owners.id
  WHERE owners.full_name = 'Melody Pond';

SELECT animals.name, species.name
  FROM animals
  INNER JOIN species
  ON animals.species_id = species.id
  WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
  FROM owners
  LEFT JOIN animals
  ON owners.id = animals.owners_id;

SELECT COUNT(animals.name), species.name
  FROM animals
  INNER JOIN species
  ON animals.species_id = species.id
  GROUP BY species.name;

SELECT owners.full_name, animals.name, species.name
  FROM owners
  INNER JOIN animals
  ON owners.id = animals.owners_id
  INNER JOIN species
  ON species.id = animals.species_id
  WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT owners.full_name, animals.name, animals.escape_attempts
  FROM owners
  INNER JOIN animals
  ON owners.id = animals.owners_id
  WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name , COUNT(*)
  FROM owners
  INNER JOIN animals
  ON owners.id = animals.owners_id
  GROUP BY owners.full_name
  ORDER BY count DESC LIMIT 1;