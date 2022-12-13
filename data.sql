/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', 'Feb 03,2020', 0, true, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', 'Nov 15, 2018', 2, true, 8);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', 'Jan 07, 2021', 1, false, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', 'May 12, 2017', 5, true, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', 'Feb 8, 2020', 0, false, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (6, 'Plantmon', 'Nov 15, 2021', 2, true, 5.7);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (7, 'Squirtle', 'Apr 2, 1993', 3, false, 12.13);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (8, 'Angemon', 'Jun 12, 2005', 1, true, 45);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (9, 'Boarmon', 'Jun 7, 2005', 7, true, 20.4);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (10, 'Blossom', 'Oct 13, 1998', 3, true, 17);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (11, 'Ditto', 'May 14, 2022', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon');

iNSERT INTO species (name)
VALUES ('Digimon');

UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals
  SET owners_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
  WHERE name = 'Agumon';

  UPDATE animals
  SET owners_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
  WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
  SET owners_id = (SELECT id from owners WHERE full_name = 'Bob')
  WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
  SET owners_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
  WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
  SET owners_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
  WHERE name IN ('Angemon', 'Boarmon');

  