-- -------------------------------------------------------
-- --------------- Database farmfood ---------------------
-- -------------------------------------------------------

-- DROP DATABASE IF EXISTS farmfood;
-- CREATE DATABASE farmfood WITH OWNER = postgres ENCODING = 'UTF8' TABLESPACE = pg_default CONNECTION LIMIT = -1;
--/c farmfood;

-- DROP TABLE IF EXISTS categories CASCADE;
-- DROP TABLE IF EXISTS products CASCADE;
-- DROP TABLE IF EXISTS product_categories CASCADE;
-- DROP TABLE IF EXISTS cities CASCADE;
-- DROP TABLE IF EXISTS contacts CASCADE;
-- DROP TABLE IF EXISTS sellers CASCADE;
-- DROP TABLE IF EXISTS seller_categories CASCADE;
-- DROP TABLE IF EXISTS seller_products CASCADE;
-- DROP TABLE IF EXISTS seller_contacts CASCADE;
-- DROP TABLE IF EXISTS users CASCADE;
-- DROP TABLE IF EXISTS roles CASCADE;
-- DROP TABLE IF EXISTS users_roles CASCADE;
-- DROP TABLE IF EXISTS reviews CASCADE;

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
  image TEXT,
  image_blob BYTEA
);

-- -------------------------------------------------------
-- Table `farmfood`.`product_categories`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS product_categories (
  product_id BIGINT NOT NULL,
  category_id BIGINT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  CONSTRAINT fk_categories FOREIGN KEY(category_id) REFERENCES categories(id),
  CONSTRAINT fk_products FOREIGN KEY(product_id) REFERENCES products(id)
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
-- Table `farmfood`.`contacts`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS contacts (
  id SERIAL PRIMARY KEY,
  name TEXT,
  phone TEXT,
  email TEXT,
  site TEXT,
  instagram TEXT,
  viber TEXT,
  whatsapp TEXT,
  telegram TEXT
);

-- -------------------------------------------------------
-- Table `farmfood`.`sellers`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS sellers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT,
  grade INTEGER,
  user_id BIGINT
);

-- -------------------------------------------------------
-- Table `farmfood`.`seller_categories`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS seller_categories (
  seller_id BIGINT NOT NULL,
  category_id BIGINT NOT NULL,
  PRIMARY KEY (seller_id, category_id),
  CONSTRAINT fk_sellers FOREIGN KEY(seller_id) REFERENCES sellers(id),
  CONSTRAINT fk_categories FOREIGN KEY(category_id) REFERENCES categories(id)
);

-- -------------------------------------------------------
-- Table `farmfood`.`seller_products`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS seller_products (
  seller_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  PRIMARY KEY (seller_id, product_id),
  CONSTRAINT fk_sellers FOREIGN KEY(seller_id) REFERENCES sellers(id),
  CONSTRAINT fk_products FOREIGN KEY(product_id) REFERENCES products(id)
);

-- -------------------------------------------------------
-- Table `farmfood`.`seller_contacts`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS seller_contacts (
  seller_id integer NOT NULL,
  contact_id integer NOT NULL,
  PRIMARY KEY (seller_id, contact_id),
  CONSTRAINT fk_sellers FOREIGN KEY(seller_id) REFERENCES sellers(id),
  CONSTRAINT fk_contacts FOREIGN KEY(contact_id) REFERENCES contacts(id)
);

-- -------------------------------------------------------
-- Table `farmfood`.`users`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  login TEXT,
  password TEXT,
  firstname TEXT,
  lastname TEXT,
  email TEXT UNIQUE NOT NULL,
  image TEXT,
  image_blob BYTEA
);

-- -------------------------------------------------------
-- Table `farmfood`.`roles`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS roles (
  id SERIAL PRIMARY KEY,
  name TEXT
);

-- -------------------------------------------------------
-- Table `farmfood`.`users_roles`
-- -------------------------------------------------------
CREATE TABLE users_roles (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  CONSTRAINT fk_users FOREIGN KEY(user_id) REFERENCES users(id),
  CONSTRAINT fk_roles FOREIGN KEY(role_id) REFERENCES roles(id)
);

-- -------------------------------------------------------
-- Table `farmfood`.`reviews`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS reviews (
  id SERIAL PRIMARY KEY,
  user_id   BIGINT NOT NULL,
  seller_id BIGINT NOT NULL,
  rating    INTEGER,
  comment   TEXT,
  CONSTRAINT fk_users FOREIGN KEY(user_id) REFERENCES users(id),
  CONSTRAINT fk_sellers FOREIGN KEY(seller_id) REFERENCES sellers(id)
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
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Baguette',                  1, 15, 'baguette.jpg'                  );

-- --------------------------------------------------------------------------------------------
-- Cities
-- --------------------------------------------------------------------------------------------
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Minsk');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Kyiv');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Saint-Petersburg');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Budapest');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Yerevan');
INSERT INTO cities (id, name) VALUES(DEFAULT, 'Almaty');

-- -------------------------------------------------------
-- Product_categories
-- -------------------------------------------------------
-- 1. Eggs
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Eggs')
INSERT INTO product_categories (product_id, category_id) VALUES
 ((SELECT id FROM products WHERE name = 'Chicken eggs'),          (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Quail eggs'  ),          (SELECT id FROM categoryId));
-- 2. Milk and dairy products
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Milk and dairy products')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Cow milk'),              (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Goat milk'),             (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Fermented baked milk'),  (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Curd'),                  (SELECT id FROM categoryId));
-- 3. Cheese
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Cheese')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Circassian cheese'),     (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Brynza cheese'),         (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Suluguni cheese'),       (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Mozzarella cheese'),     (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Hard-pressed cheese'),   (SELECT id FROM categoryId));
-- 4. Butter
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Butter')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Butter'),                (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Melted butter'),         (SELECT id FROM categoryId));
-- 5. Meat and meat products
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Meat and meat products')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Chicken meat'),          (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Quail meat'),            (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Turkey meat'),           (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Duck meet'),             (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Rabbit meat'),           (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pork'),                  (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beef'),                  (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Home-made sausage'),     (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Bacon'),                 (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lard'),                  (SELECT id FROM categoryId));
-- 6. Vegetables
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Vegetables')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Grapes'),                 (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cucumber'),              (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Tomato'),                (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Potato'),                (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Carrot'),                (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Onion'),                 (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Broccoli'),              (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Garlic'),                (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cabbage'),               (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beetroot'),              (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lettuce'),               (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pepper'),                (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Radish'),                (SELECT id FROM categoryId));
-- 7. Fruits and berries
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Fruits and berries')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Apple'),                 (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Apricot'),               (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pear'),                  (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Plum'),                  (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Grape'),                 (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Raspberry'),             (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Strawberry'),            (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Blackberry'),            (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cherry'),                (SELECT id FROM categoryId));
-- 8. Honey
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Honey')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Honey in combs'),        (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flower honey'),          (SELECT id FROM categoryId));
-- 9. Mushrooms
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Mushrooms')
INSERT INTO product_categories (product_id, category_id) VALUES 
 ((SELECT id FROM products WHERE name = 'Champignon'),            (SELECT id FROM categoryId));
-- 10. Bakery
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Bakery')
INSERT INTO product_categories (product_id, category_id) VALUES
 ((SELECT id FROM products WHERE name = 'Baguette'),              (SELECT id FROM categoryId));

-- -------------------------------------------------------
-- Contacts
-- -------------------------------------------------------
INSERT INTO contacts (id, name, phone, email, site, instagram, viber, whatsapp, telegram) VALUES
 (DEFAULT, 'Seller 1', '+375 25 456 42 42', 'contact@ecofood.by', 'ecofood.by', 'ecofood_by', '+375 25 456 42 42', '', '');

-- -------------------------------------------------------
-- Users
-- -------------------------------------------------------
INSERT INTO users (id, login, password, email, firstname, lastname) VALUES
  (DEFAULT, 'sami',   'sami',   'gstream@gmail.com', 'Sami',             'Keinänen'),
  (DEFAULT, 'magnum', 'magnum', 'sami@gmail.com',    'Sami',             'Wolking'),
  (DEFAULT, 'kalma',  'kalma',  'kalma@gmail.com',   'Nick',             'Gore'),
  (DEFAULT, 'kita',   'kita',   'kita@gmail.com',    'Sampsa',           'Astala'),
  (DEFAULT, 'user',   'user',   'user@gmail.com',    'User firstname',   'User lastname');

INSERT INTO users (id, login, password, email, firstname, lastname) VALUES
  (DEFAULT, 'otus',   'otus',   'otus@gmail.com',    'Tonmi',            'Kristian Lillman'),
  (DEFAULT, 'oxx',    'oxx',    'oxx@gmail.com',     'Samer',            'el Nahhal'),
  (DEFAULT, 'amen',   'amen',   'amen@gmail.com',    'Jussi',            'Sydänmaa'),
  (DEFAULT, 'mana',   'mana',   'mana@gmail.com',    'Antto',            'Nikolai Tuomainen'),
  (DEFAULT, 'seller', 'seller', 'seller@gmail.com',  'Seller firstname', 'Seller lastname');

INSERT INTO users (id, login, password, email, firstname, lastname) VALUES
  (DEFAULT, 'tomi',   'tomi',   'tomi@gmail.com',    'Tomi',             'Petteri Putaansuu'),
  (DEFAULT, 'hella',  'hella',  'hella@gmail.com',   'Henna-Riikka',     'Tuulia Broda'),
  (DEFAULT, 'awa',    'awa',    'awa@gmail.com',     'Leena',            'Maria Peisa'),
  (DEFAULT, 'admin',  'admin',  'admin@gmail.com',   'Admin firstname',  'Admin lastname');

-- --------------------------------------------------------------------------------------------
-- Roles
-- --------------------------------------------------------------------------------------------
INSERT INTO roles (id, name) VALUES(DEFAULT, 'NO_AUTOR_USER');
INSERT INTO roles (id, name) VALUES(DEFAULT, 'USER');
INSERT INTO roles (id, name) VALUES(DEFAULT, 'SELLER');
INSERT INTO roles (id, name) VALUES(DEFAULT, 'ADMIN');

-- --------------------------------------------------------------------------------------------
-- Users Roles
-- --------------------------------------------------------------------------------------------
WITH roleId AS (SELECT id FROM roles WHERE name = 'USER')
INSERT INTO users_roles (user_id, role_id) VALUES
  ((SELECT id FROM users WHERE login = 'sami'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'magnum'), (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'kalma'),  (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'kita'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'user'),   (SELECT id FROM roleId));

WITH roleId AS (SELECT id FROM roles WHERE name = 'SELLER')
INSERT INTO users_roles (user_id, role_id) VALUES
  ((SELECT id FROM users WHERE login = 'otus'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'oxx'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'amen'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'mana'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'seller'), (SELECT id FROM roleId));

WITH roleId AS (SELECT id FROM roles WHERE name = 'ADMIN')
INSERT INTO users_roles (user_id, role_id) VALUES
  ((SELECT id FROM users WHERE login = 'tomi'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'hella'),  (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'awa'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'admin'),  (SELECT id FROM roleId));

-- --------------------------------------------------------------------------------------------
-- Sellers
-- --------------------------------------------------------------------------------------------
INSERT INTO sellers (id, name, description, grade, user_id) VALUES
 (DEFAULT, 'ECO FOOD', 'The best natural food', 5, (SELECT id FROM users WHERE login = 'User1'));
 
-- -------------------------------------------------------
-- Seller contacts
-- -------------------------------------------------------
INSERT INTO seller_contacts (seller_id, contact_id) VALUES
 ((SELECT id FROM contacts WHERE name = 'Seller 1'), (SELECT id FROM sellers WHERE name = 'ECO FOOD'));

-- -------------------------------------------------------
-- Seller categories
-- -------------------------------------------------------
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO seller_categories (seller_id, category_id) VALUES
-- 1. Eggs
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Eggs')),
-- 2. Milk and dairy products
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Milk and dairy products')),
-- 3. Cheese
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Cheese')),
-- 4. Butter
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Butter')),
-- 5. Meat and meat products
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Meat and meat products')),
-- 6. Vegetables
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Vegetables')),
-- 7. Fruits and berries
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Fruits and berries')),
-- 8. Honey
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Honey')),
-- 9. Mushrooms
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Mushrooms')),
-- 10. Bakery
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Bakery'));
 
-- -------------------------------------------------------
-- Seller products
-- -------------------------------------------------------
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO seller_products (seller_id, product_id) VALUES
-- 1. Eggs
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Chicken eggs')),
-- 2. Milk and dairy products
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Cow milk')),
-- 3. Cheese
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Circassian cheese')),
-- 4. Butter
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Butter')),
-- 5. Meat and meat products
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Chicken meat')),
-- 6. Vegetables
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Grapes')),
-- 7. Fruits and berries
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Apple')),
-- 8. Honey
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Honey in combs')),
-- 9. Mushrooms
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Champignon')),
-- 10. Bakery
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Baguette'));

-- -------------------------------------------------------
-- Reviews
-- -------------------------------------------------------
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO reviews (id, seller_id, user_id, rating, comment) VALUES
 (DEFAULT, (SELECT id FROM sellerId), (SELECT id FROM users WHERE login = 'admin'), 5, 'Excellent');
 