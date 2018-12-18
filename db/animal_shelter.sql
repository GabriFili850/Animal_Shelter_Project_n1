DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;


CREATE TABLE owners (
id SERIAL8 PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
age INT8
);

CREATE TABLE animals (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
type VARCHAR(255),
admission_date VARCHAR(255),
adoptable VARCHAR(255),
owner_id INT8 REFERENCES owners(id)
);
