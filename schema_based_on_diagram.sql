/* Database schema to keep the structure of entire database. */

CREATE DATABASE clinic;

/* Add patients table to clinic database. */

CREATE TABLE IF NOT EXISTS patients(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR(255),
 date_of_birth DATE

);

/* Add medical_histories table to clinic database. */
CREATE TABLE IF NOT EXISTS medical_histories(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 admitted_at timestamp,
 patient_id int REFERENCES patients(id),
 status varchar(255)

);
/* Add treatments table to clinic database. */

CREATE TABLE IF NOT EXISTS treatments(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 type varchar(255),
 name VARCHAR(255)

);



