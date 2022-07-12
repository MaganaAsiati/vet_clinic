/* Database schema to keep the structure of entire database. */

CREATE DATABASE clinic;

/* Add patients table to clinic database. */

CREATE TABLE IF NOT EXISTS patients(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(255),
 date_of_birth DATE

);


