/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOL,
  weight_kg DECIMAL 
);

ADD species VARCHAR(100);

CREATE TABLE owners(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(150),
  age INT
);

CREATE TABLE species(
  id INT NOT NULL GENERATED ALWAYS as IDENTITY PRIMARY KEY,
  name VARCHAR(100)
);

ALTER TABLE animals
  DROP COLUMN id;

ALTER TABLE animals
  ADD COLUMN id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY;

ALTER TABLE animals
  DROP COLUMN species;

ALTER TABLE animals
  ADD COLUMN species_id INT,
  ADD COLUMN owners_id INT;

ALTER TABLE animals
  ADD CONSTRAINT fk_owner
  FOREIGN KEY (owner_id)
  REFERENCES owners(id);

ALTER TABLE animals
  ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species(id);