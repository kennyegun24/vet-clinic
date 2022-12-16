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



CREATE TABLE vets (
id INT NOT NULL GENERATED ALWAYS as IDENTITY PRIMARY KEY,
name VARCHAR(150),
age INT,
date_of_graduation DATE );

 CREATE TABLE specializations (
 vet_id INT,
 species_id INT,
 PRIMARY KEY (vet_id, species_id),
 CONSTRAINT fk_vets
     FOREIGN KEY (vet_id)
         REFERENCES vets(id),
 CONSTRAINT fk_species
     FOREIGN KEY (species_id)
         REFERENCES species(id)
 );

CREATE TABLE visits(
    vet_id INT,
    animal_id INT,
    date_of_visit DATE,
    PRIMARY KEY (vet_id, animal_id),
    CONSTRAINT fk_vets
        FOREIGN KEY (vet_id)
            REFERENCES vets(id),
    CONSTRAINT fk_animals
        FOREIGN KEY (animal_id)
            REFERENCES animals(id)
);