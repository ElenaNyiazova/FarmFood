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
  description TEXT,
  parent_id BIGINT
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

-- 1. Eggs
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Eggs');
-- 2. Milk and dairy products
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Milk and dairy products');
-- 3. Cheese
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Cheese');
-- 4. Butter
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Butter');
-- 5. Meat and meat products
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Meat and meat products');
-- 6. Vegetables
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Vegetables');
-- 7. Fruits and berries                                                                                                                     
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Fruits and berries');
-- 8. Honey                                                                                                                    
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Honey');
-- 9. Mushrooms                                                                                                                
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Mushrooms');
-- 10. Bakery
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Bakery');

-- --------------------------------------------------------------------------------------------
-- Products
-- --------------------------------------------------------------------------------------------
-- 1. Eggs
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Chicken eggs',              1, 14, 'chicken_eggs.jpg'              );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Quail eggs',                1, 14, 'quail_eggs.jpg'                );
-- 2. Milk and dairy products
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cow milk',                  1, 14, 'cow_milk.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Goat milk',                 1, 14, 'goat_milk.jpg'                 );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Fermented baked milk',      1, 14, 'fermented_baked_milk.jpg'      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Curd',                      1, 14, 'curd.jpg'                      );
-- 3. Cheese
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Circassian cheese',         1, 14, 'circassian_cheese.jpg'         );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Brynza cheese',             1, 14, 'brynza_cheese.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Suluguni cheese',           1, 14, 'suluguni_cheese.jpg'           );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Mozzarella cheese',         1, 14, 'mozzarella_cheese.jpg'         );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Hard-pressed cheese',       1, 14, 'hard-pressed_cheese.jpg'       );
-- 4. Butter
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Butter',                    1, 14, 'butter.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Melted butter',             1, 14, 'melted_butter.jpg'             );
-- 5. Meat and meat products
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Chicken meat',              1, 14, 'chicken_meat.jpg'              );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Quail meat',                1, 14, 'quail_meat.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Turkey meat',               1, 14, 'turkey_meat.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Duck meet',                 1, 14, 'duck_meet.jpg'                 );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Rabbit meat',               1, 14, 'rabbit_meat.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pork',                      1, 14, 'pork.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beef',                      1, 14, 'beef.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Home-made sausage',         1, 14, 'home_made_sausage.jpg'         );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bacon',                     1, 14, 'bacon.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lard',                      1, 14, 'lard.jpg'                      );
-- 6. Vegetables
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Grapes',                    1, 14, 'grapes.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cucumber',                  1, 16, 'cucumber.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Tomato',                    1, 17, 'tomato.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Potato',                    1, 18, 'potato.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carrot',                    1, 19, 'carrot.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Onion',                     1, 20, 'onion.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Broccoli',                  1, 21, 'broccoli.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Garlic',                    1, 22, 'garlic.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cabbage',                   1, 23, 'cabbage.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beetroot',                  1, 23, 'beetroot.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lettuce',                   1, 23, 'lettuce.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pepper',                    1, 23, 'pepper.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Radish',                    1, 23, 'radish.jpg'                    );
-- 7. Fruits and berries                                                                                                                     
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apple',                     1, 8 , 'apple.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apricot',                   1, 12, 'apricot.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pear',                      1, 13, 'pear.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Plum',                      1, 15, 'plum.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Grape',                     1, 15, 'grape.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Raspberry',                 1, 15, 'raspberry.jpg'                 );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Strawberry',                1, 15, 'strawberry.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Blackberry',                1, 15, 'blackberry.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cherry',                    1, 15, 'cherry.jpg'                    );
-- 8. Honey                                                                                                                    
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey in combs',            1, 15, 'honey_in_combs.jpg'            );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flower honey',              1, 15, 'flower_honey.jpg'              );
-- 9. Mushrooms                                                                                                                
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Champignon',                1, 15, 'champignon.jpg'                );
-- 10. Bakery
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Baguette',                  1, 15, 'baguette.jpg'                 );

-- --------------------------------------------------------------------------------------------
-- Cities
-- --------------------------------------------------------------------------------------------
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Minsk');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Kyiv');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Saint-Petersburg');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Budapest');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Yerevan');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Almaty');
