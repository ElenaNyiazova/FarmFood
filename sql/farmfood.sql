-- DROP DATABASE IF EXISTS farmfood;
-- CREATE DATABASE farmfood WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default CONNECTION LIMIT = -1;
--/c farmfood;

-- DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT
);

-- DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT
);

-- DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT
);

-- DROP TABLE IF EXISTS sellers;
CREATE TABLE IF NOT EXISTS sellers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT
);

-- DROP TABLE IF EXISTS seller_categories;
CREATE TABLE IF NOT EXISTS seller_categories (
  id SERIAL PRIMARY KEY,
  category_id BIGINT NOT NULL
);

-- DROP TABLE IF EXISTS seller_products;
CREATE TABLE IF NOT EXISTS seller_products (
  id SERIAL PRIMARY KEY,
  product_id BIGINT NOT NULL
);

-- DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  firstname TEXT,
  lastname TEXT,
  email TEXT UNIQUE NOT NULL
);
