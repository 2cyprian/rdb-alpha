-- Create the database
CREATE DATABASE salon;

-- Connect to the salon database (\c salon)

-- Create the customers table
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(15) UNIQUE NOT NULL,
  name VARCHAR(40) NOT NULL
);

-- Create the services table
CREATE TABLE services (
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL
);

-- Create the appointments table
CREATE TABLE appointments (
  appointment_id SERIAL PRIMARY KEY,
  time VARCHAR(10) NOT NULL,
  customer_id INT NOT NULL REFERENCES customers(customer_id),
  service_id INT NOT NULL REFERENCES services(service_id)
);

-- Insert at least three rows into the services table (starting with id 1)
INSERT INTO services (name) VALUES ('cut'), ('color'), ('perm'), ('style'), ('trim');
