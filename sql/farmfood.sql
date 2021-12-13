-- DROP DATABASE IF EXISTS farmfood;
-- CREATE DATABASE farmfood WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default CONNECTION LIMIT = -1;
--/c farmfood;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT UNIQUE NOT NULL
);
