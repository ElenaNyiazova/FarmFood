-- -------------------------------------------------------
-- --------------- Database farmfood ---------------------
-- -------------------------------------------------------

-- DROP DATABASE IF EXISTS farmfood;
-- CREATE DATABASE farmfood WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default CONNECTION LIMIT = -1;
--/c farmfood;

-- DROP TABLE IF EXISTS categories;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS cities;
-- DROP TABLE IF EXISTS sellers;
-- DROP TABLE IF EXISTS seller_categories;
-- DROP TABLE IF EXISTS seller_products;
-- DROP TABLE IF EXISTS users;

-- -------------------------------------------------------
-- Table `farmfood`.`categories`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT
);

-- -------------------------------------------------------
-- Table `farmfood`.`products`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT,
  weight REAL,
  price REAL,
  image TEXT
);

-- -------------------------------------------------------
-- Table `farmfood`.`seller_categories`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS product_categories (
  product_id BIGINT NOT NULL,
  category_id BIGINT NOT NULL
);

-- -------------------------------------------------------
-- Table `farmfood`.`cities`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS cities (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT
);

-- -------------------------------------------------------
-- Table `farmfood`.`sellers`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS sellers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT
);

-- -------------------------------------------------------
-- Table `farmfood`.`seller_categories`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS seller_categories (
  seller_id BIGINT NOT NULL,
  category_id BIGINT NOT NULL
);

-- -------------------------------------------------------
-- Table `farmfood`.`seller_products`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS seller_products (
  seller_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL
);

-- -------------------------------------------------------
-- Table `farmfood`.`users`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  firstname TEXT,
  lastname TEXT,
  email TEXT UNIQUE NOT NULL
);

-- --------------------------------------------------------------------------------------------
-- ----------------------------------------- Data ---------------------------------------------
-- --------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------
-- Categories
-- --------------------------------------------------------------------------------------------
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Fruits');
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Vegetables');
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Dairy');
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Bakery');
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Eggs');

-- --------------------------------------------------------------------------------------------
-- Products
-- --------------------------------------------------------------------------------------------
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apple',    '1 kg', '8' , 'apple.jpg'    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apricot',  '1 kg', '12', 'apricot.jpg'  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pear',     '1 kg', '13', 'pear.jpg'     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Grapes',   '1 kg', '14', 'grapes.jpg'   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Plum',     '1 kg', '15', 'plum.jpg'     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cucumber', '1 kg', '16', 'cucumber.jpg' );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Tomato',   '1 kg', '17', 'tomato.jpg'   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Potato',   '1 kg', '18', 'potato.jpg'   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carrot',   '1 kg', '19', 'carrot.jpg'   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Onion',    '1 kg', '20', 'onion.jpg'    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Broccoli', '1 kg', '21', 'broccoli.jpg' );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Garlic',   '1 kg', '22', 'garlic.jpg'   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cabbage',  '1 kg', '23', 'cabbage.jpg'  );

-- --------------------------------------------------------------------------------------------
-- Cities
-- --------------------------------------------------------------------------------------------
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Minsk');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Kyiv');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Saint-Petersburg');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Budapest');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Yerevan');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Almaty');
