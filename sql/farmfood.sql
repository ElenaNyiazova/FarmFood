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
-- DROP TABLE IF EXISTS seller_cities CASCADE;
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
-- Table `farmfood`.`seller_cities`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS seller_cities (
  seller_id BIGINT NOT NULL,
  city_id BIGINT NOT NULL,
  PRIMARY KEY (seller_id, city_id),
  CONSTRAINT fk_sellers FOREIGN KEY(seller_id) REFERENCES sellers(id),
  CONSTRAINT fk_cities FOREIGN KEY(city_id) REFERENCES cities(id)
);

-- -------------------------------------------------------
-- Table `farmfood`.`users`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  login TEXT,
  password TEXT,
  userName TEXT,
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

-- 1. Berries
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Berries');
-- 2. Dairy_Eggs
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Dairy_Eggs');
-- 3. Fish
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Fish');
-- 4. Fruits
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Fruits');
-- 5. Honey
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Honey');
-- 6. Meat
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Meat');
-- 7. Vegetables                                                                                                                     
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Vegetables');
-- 8. Bakery
INSERT INTO categories (id, name) VALUES(DEFAULT, 'Bakery');

-- --------------------------------------------------------------------------------------------
-- Products
-- --------------------------------------------------------------------------------------------
-- 1. Berries
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Blackberry_1'     , 1, 1, 'Berries\Blackberry_1.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Blackberry_2'     , 1, 1, 'Berries\Blackberry_2.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Blackberry_3'     , 1, 1, 'Berries\Blackberry_3.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Blackberry_4'     , 1, 1, 'Berries\Blackberry_4.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cherry_1'         , 1, 1, 'Berries\Cherry_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cherry_2'         , 1, 1, 'Berries\Cherry_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cherry_3'         , 1, 1, 'Berries\Cherry_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cherry_4'         , 1, 1, 'Berries\Cherry_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Grape_1'          , 1, 1, 'Berries\Grape_1.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Grape_2'          , 1, 1, 'Berries\Grape_2.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Grape_3'          , 1, 1, 'Berries\Grape_3.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Grape_4'          , 1, 1, 'Berries\Grape_4.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Raspberry_1'      , 1, 1, 'Berries\Raspberry_1.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Raspberry_2'      , 1, 1, 'Berries\Raspberry_2.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Raspberry_3'      , 1, 1, 'Berries\Raspberry_3.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Raspberry_4'      , 1, 1, 'Berries\Raspberry_4.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Strawberry_1'     , 1, 1, 'Berries\Strawberry_1.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Strawberry_2'     , 1, 1, 'Berries\Strawberry_2.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Strawberry_3'     , 1, 1, 'Berries\Strawberry_3.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Strawberry_4'     , 1, 1, 'Berries\Strawberry_4.jpg'               );

-- 2. Dairy_Eggs
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Butter_1'         , 1, 2, 'Dairy_Eggs\Butter_1.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Butter_2'         , 1, 2, 'Dairy_Eggs\Butter_2.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Butter_3'         , 1, 2, 'Dairy_Eggs\Butter_3.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Butter_4'         , 1, 2, 'Dairy_Eggs\Butter_4.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cheese_1'         , 1, 2, 'Dairy_Eggs\Cheese_1.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cheese_2'         , 1, 2, 'Dairy_Eggs\Cheese_2.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cheese_3'         , 1, 2, 'Dairy_Eggs\Cheese_3.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cheese_4'         , 1, 2, 'Dairy_Eggs\Cheese_4.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cottage_cheese_1' , 1, 2, 'Dairy_Eggs\Cottage_cheese_1.jpg'        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cottage_cheese_2' , 1, 2, 'Dairy_Eggs\Cottage_cheese_2.jpg'        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cottage_cheese_3' , 1, 2, 'Dairy_Eggs\Cottage_cheese_3.jpg'        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cottage_cheese_4' , 1, 2, 'Dairy_Eggs\Cottage_cheese_4.jpg'        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Eggs_1'           , 1, 2, 'Dairy_Eggs\Eggs_1.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Eggs_2'           , 1, 2, 'Dairy_Eggs\Eggs_2.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Eggs_3'           , 1, 2, 'Dairy_Eggs\Eggs_3.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Eggs_4'           , 1, 2, 'Dairy_Eggs\Eggs_4.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Milk_1'           , 1, 2, 'Dairy_Eggs\Milk_1.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Milk_2'           , 1, 2, 'Dairy_Eggs\Milk_2.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Milk_3'           , 1, 2, 'Dairy_Eggs\Milk_3.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Milk_4'           , 1, 2, 'Dairy_Eggs\Milk_4.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sour_cream_1'     , 1, 2, 'Dairy_Eggs\Sour_cream_1.jpg'            );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sour_cream_2'     , 1, 2, 'Dairy_Eggs\Sour_cream_2.jpg'            );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sour_cream_3'     , 1, 2, 'Dairy_Eggs\Sour_cream_3.jpg'            );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sour_cream_4'     , 1, 2, 'Dairy_Eggs\Sour_cream_4.jpg'            );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Yogurt_1'         , 1, 2, 'Dairy_Eggs\Yogurt_1.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Yogurt_2'         , 1, 2, 'Dairy_Eggs\Yogurt_2.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Yogurt_3'         , 1, 2, 'Dairy_Eggs\Yogurt_3.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Yogurt_4'         , 1, 2, 'Dairy_Eggs\Yogurt_4.jpg'                );

-- 3. Fish
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bream_1'          , 1, 3, 'Fish\Bream_1.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bream_2'          , 1, 3, 'Fish\Bream_2.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bream_3'          , 1, 3, 'Fish\Bream_3.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bream_4'          , 1, 3, 'Fish\Bream_4.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carp_1'           , 1, 3, 'Fish\Carp_1.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carp_2'           , 1, 3, 'Fish\Carp_2.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carp_3'           , 1, 3, 'Fish\Carp_3.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carp_4'           , 1, 3, 'Fish\Carp_4.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Catfish_1'        , 1, 3, 'Fish\Catfish_1.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Catfish_2'        , 1, 3, 'Fish\Catfish_2.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Catfish_3'        , 1, 3, 'Fish\Catfish_3.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Catfish_4'        , 1, 3, 'Fish\Catfish_4.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Crusian_1'        , 1, 3, 'Fish\Crusian_1.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Crusian_2'        , 1, 3, 'Fish\Crusian_2.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Crusian_3'        , 1, 3, 'Fish\Crusian_3.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Crusian_4'        , 1, 3, 'Fish\Crusian_4.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Salmon_1'         , 1, 3, 'Fish\Salmon_1.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Salmon_2'         , 1, 3, 'Fish\Salmon_2.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Salmon_3'         , 1, 3, 'Fish\Salmon_3.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Salmon_4'         , 1, 3, 'Fish\Salmon_4.jpg'                      );

-- 4. Fruits
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apple_1'          , 1, 4, 'Fruits\Apple_1.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apple_2'          , 1, 4, 'Fruits\Apple_2.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apple_3'          , 1, 4, 'Fruits\Apple_3.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Apple_4'          , 1, 4, 'Fruits\Apple_4.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Peach_1'          , 1, 4, 'Fruits\Peach_1.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Peach_2'          , 1, 4, 'Fruits\Peach_2.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Peach_3'          , 1, 4, 'Fruits\Peach_3.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Peach_4'          , 1, 4, 'Fruits\Peach_4.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pear_1'           , 1, 4, 'Fruits\Pear_1.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pear_2'           , 1, 4, 'Fruits\Pear_2.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pear_3'           , 1, 4, 'Fruits\Pear_3.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pear_4'           , 1, 4, 'Fruits\Pear_4.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Plum_1'           , 1, 4, 'Fruits\Plum_1.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Plum_2'           , 1, 4, 'Fruits\Plum_2.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Plum_3'           , 1, 4, 'Fruits\Plum_3.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Plum_4'           , 1, 4, 'Fruits\Plum_4.jpg'                      );

-- 5. Honey
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_combs_1' , 1, 5, 'Honey\Honey_in_combs_1.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_combs_2' , 1, 5, 'Honey\Honey_in_combs_2.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_combs_3' , 1, 5, 'Honey\Honey_in_combs_3.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_combs_4' , 1, 5, 'Honey\Honey_in_combs_4.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_jars_1'  , 1, 5, 'Honey\Honey_in_jars_1.jpg'              );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_jars_2'  , 1, 5, 'Honey\Honey_in_jars_2.jpg'              );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_jars_3'  , 1, 5, 'Honey\Honey_in_jars_3.jpg'              );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Honey_in_jars_4'  , 1, 5, 'Honey\Honey_in_jars_4.jpg'              );

-- 6. Meat
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Backon_1'         , 1, 6, 'Meat\Backon_1.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Backon_2'         , 1, 6, 'Meat\Backon_2.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Backon_3'         , 1, 6, 'Meat\Backon_3.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Backon_4'         , 1, 6, 'Meat\Backon_4.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beef_1'           , 1, 6, 'Meat\Beef_1.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beef_2'           , 1, 6, 'Meat\Beef_2.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beef_3'           , 1, 6, 'Meat\Beef_3.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beef_4'           , 1, 6, 'Meat\Beef_4.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Chicken_1'        , 1, 6, 'Meat\Chicken_1.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Chicken_2'        , 1, 6, 'Meat\Chicken_2.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Chicken_3'        , 1, 6, 'Meat\Chicken_3.jpg'                     );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Duck_1'           , 1, 6, 'Meat\Duck_1.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Duck_2'           , 1, 6, 'Meat\Duck_2.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Duck_3'           , 1, 6, 'Meat\Duck_3.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Duck_4'           , 1, 6, 'Meat\Duck_4.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lard_1'           , 1, 6, 'Meat\Lard_1.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lard_2'           , 1, 6, 'Meat\Lard_2.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lard_3'           , 1, 6, 'Meat\Lard_3.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lard_4'           , 1, 6, 'Meat\Lard_4.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pork_1'           , 1, 6, 'Meat\Pork_1.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pork_2'           , 1, 6, 'Meat\Pork_2.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pork_3'           , 1, 6, 'Meat\Pork_3.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pork_4'           , 1, 6, 'Meat\Pork_4.jpg'                        );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Quail_1'          , 1, 6, 'Meat\Quail_1.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Quail_2'          , 1, 6, 'Meat\Quail_2.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Quail_3'          , 1, 6, 'Meat\Quail_3.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Quail_4'          , 1, 6, 'Meat\Quail_4.jpg'                       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Rabbit_1'         , 1, 6, 'Meat\Rabbit_1.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Rabbit_3'         , 1, 6, 'Meat\Rabbit_3.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Rabbit_4'         , 1, 6, 'Meat\Rabbit_4.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sousages_1'       , 1, 6, 'Meat\Sousages_1.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sousages_2'       , 1, 6, 'Meat\Sousages_2.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sousages_3'       , 1, 6, 'Meat\Sousages_3.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Sousages_4'       , 1, 6, 'Meat\Sousages_4.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Turkey_1'         , 1, 6, 'Meat\Turkey_1.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Turkey_2'         , 1, 6, 'Meat\Turkey_2.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Turkey_3'         , 1, 6, 'Meat\Turkey_3.jpg'                      );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Turkey_4'         , 1, 6, 'Meat\Turkey_4.jpg'                      );

-- 7. Vegetables
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beetroot_1'       , 1, 7, 'Vegetables\Beetroot_1.jpg'                 );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beetroot_2'       , 1, 7, 'Vegetables\Beetroot_2.jpg'                 );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beetroot_3'       , 1, 7, 'Vegetables\Beetroot_3.jpg'                 );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Beetroot_4'       , 1, 7, 'Vegetables\Beetroot_4.jpg'                 );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cabbage_1'        , 1, 7, 'Vegetables\Cabbage_1.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cabbage_2'        , 1, 7, 'Vegetables\Cabbage_2.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cabbage_3'        , 1, 7, 'Vegetables\Cabbage_3.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cabbage_4'        , 1, 7, 'Vegetables\Cabbage_4.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carrot_1'         , 1, 7, 'Vegetables\Carrot_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carrot_2'         , 1, 7, 'Vegetables\Carrot_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carrot_3'         , 1, 7, 'Vegetables\Carrot_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Carrot_4'         , 1, 7, 'Vegetables\Carrot_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cucumbers_1'      , 1, 7, 'Vegetables\Cucumbers_1.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cucumbers_2'      , 1, 7, 'Vegetables\Cucumbers_2.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cucumbers_3'      , 1, 7, 'Vegetables\Cucumbers_3.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cucumbers_4'      , 1, 7, 'Vegetables\Cucumbers_4.jpg'                );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Garlic_1'         , 1, 7, 'Vegetables\Garlic_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Garlic_2'         , 1, 7, 'Vegetables\Garlic_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Garlic_3'         , 1, 7, 'Vegetables\Garlic_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Garlic_4'         , 1, 7, 'Vegetables\Garlic_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lettuce_1'        , 1, 7, 'Vegetables\Lettuce_1.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lettuce_2'        , 1, 7, 'Vegetables\Lettuce_2.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lettuce_3'        , 1, 7, 'Vegetables\Lettuce_3.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lettuce_4'        , 1, 7, 'Vegetables\Lettuce_4.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Lettuce_5'        , 1, 7, 'Vegetables\Lettuce_5.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Onion_1'          , 1, 7, 'Vegetables\Onion_1.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Onion_2'          , 1, 7, 'Vegetables\Onion_2.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Onion_3'          , 1, 7, 'Vegetables\Onion_3.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Onion_4'          , 1, 7, 'Vegetables\Onion_4.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pepper_1'         , 1, 7, 'Vegetables\Pepper_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pepper_2'         , 1, 7, 'Vegetables\Pepper_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pepper_3'         , 1, 7, 'Vegetables\Pepper_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pepper_4'         , 1, 7, 'Vegetables\Pepper_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Potato_1'         , 1, 7, 'Vegetables\Potato_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Potato_2'         , 1, 7, 'Vegetables\Potato_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Potato_3'         , 1, 7, 'Vegetables\Potato_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Potato_4'         , 1, 7, 'Vegetables\Potato_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Radish_1'         , 1, 7, 'Vegetables\Radish_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Radish_2'         , 1, 7, 'Vegetables\Radish_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Radish_3'         , 1, 7, 'Vegetables\Radish_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Radish_4'         , 1, 7, 'Vegetables\Radish_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Tomatos_1'        , 1, 7, 'Vegetables\Tomatos_1.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Tomatos_2'        , 1, 7, 'Vegetables\Tomatos_2.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Tomatos_3'        , 1, 7, 'Vegetables\Tomatos_3.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Tomatos_4'        , 1, 7, 'Vegetables\Tomatos_4.jpg'                  );

-- 8. Bakery
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Baget_1'                    ,1, 8, 'Bakery\Baget_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Baget_2'                    ,1, 8, 'Bakery\Baget_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Baget_3'                    ,1, 8, 'Bakery\Baget_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Baget_4'                    ,1, 8, 'Bakery\Baget_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bread_1'                    ,1, 8, 'Bakery\Bread_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bread_2'                    ,1, 8, 'Bakery\Bread_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bread_3'                    ,1, 8, 'Bakery\Bread_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Bread_4'                    ,1, 8, 'Bakery\Bread_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cereal_1'                   ,1, 8, 'Bakery\Cereal_1.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cereal_2'                   ,1, 8, 'Bakery\Cereal_2.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cereal_3'                   ,1, 8, 'Bakery\Cereal_3.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Cereal_4'                   ,1, 8, 'Bakery\Cereal_4.jpg'                  );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Dried crust_1'              ,1, 8, 'Bakery\Dried crust_1.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Dried crust_2'              ,1, 8, 'Bakery\Dried crust_2.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Dried crust_3'              ,1, 8, 'Bakery\Dried crust_3.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Dried crust_4'              ,1, 8, 'Bakery\Dried crust_4.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flatbread_1'                ,1, 8, 'Bakery\Flatbread_1.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flatbread_2'                ,1, 8, 'Bakery\Flatbread_2.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flatbread_3'                ,1, 8, 'Bakery\Flatbread_3.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flatbread_4'                ,1, 8, 'Bakery\Flatbread_4.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flour_1'                    ,1, 8, 'Bakery\Flour_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flour_2'                    ,1, 8, 'Bakery\Flour_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flour_3'                    ,1, 8, 'Bakery\Flour_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Flour_4'                    ,1, 8, 'Bakery\Flour_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fish_1'              ,1, 8, 'Bakery\Frozen fish_1.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fish_2'              ,1, 8, 'Bakery\Frozen fish_2.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fish_3'              ,1, 8, 'Bakery\Frozen fish_3.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fish_4'              ,1, 8, 'Bakery\Frozen fish_4.jpg'             );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fruits_1'            ,1, 8, 'Bakery\Frozen fruits_1.jpg'           );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fruits_2'            ,1, 8, 'Bakery\Frozen fruits_2.jpg'           );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fruits_3'            ,1, 8, 'Bakery\Frozen fruits_3.jpg'           );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen fruits_4'            ,1, 8, 'Bakery\Frozen fruits_4.jpg'           );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen meat and poultry_1'  ,1, 8, 'Bakery\Frozen meat and poultry_1.jpg' );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen meat and poultry_2'  ,1, 8, 'Bakery\Frozen meat and poultry_2.jpg' );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen meat and poultry_3'  ,1, 8, 'Bakery\Frozen meat and poultry_3.jpg' );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen meat and poultry_4'  ,1, 8, 'Bakery\Frozen meat and poultry_4.jpg' );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen vegitables_1'        ,1, 8, 'Bakery\Frozen vegitables_1.jpg'       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen vegitables_2'        ,1, 8, 'Bakery\Frozen vegitables_2.jpg'       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen vegitables_3'        ,1, 8, 'Bakery\Frozen vegitables_3.jpg'       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Frozen vegitables_4'        ,1, 8, 'Bakery\Frozen vegitables_4.jpg'       );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Ice cream_1'                ,1, 8, 'Bakery\Ice cream_1.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Ice cream_2'                ,1, 8, 'Bakery\Ice cream_2.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Ice cream_3'                ,1, 8, 'Bakery\Ice cream_3.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Ice cream_4'                ,1, 8, 'Bakery\Ice cream_4.jpg'               );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pasta_1'                    ,1, 8, 'Bakery\Pasta_1.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pasta_2'                    ,1, 8, 'Bakery\Pasta_2.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pasta_3'                    ,1, 8, 'Bakery\Pasta_3.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pasta_4'                    ,1, 8, 'Bakery\Pasta_4.jpg'                   );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pita_1'                     ,1, 8, 'Bakery\Pita_1.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pita_2'                     ,1, 8, 'Bakery\Pita_2.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pita_3'                     ,1, 8, 'Bakery\Pita_3.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Pita_4'                     ,1, 8, 'Bakery\Pita_4.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Roll_1'                     ,1, 8, 'Bakery\Roll_1.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Roll_2'                     ,1, 8, 'Bakery\Roll_2.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Roll_3'                     ,1, 8, 'Bakery\Roll_3.jpg'                    );
INSERT INTO products (id, name, weight, price, image) VALUES(DEFAULT, 'Roll_4'                     ,1, 8, 'Bakery\Roll_4.jpg'                    );

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
-- 1. Berries
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Berries')
INSERT INTO product_categories (product_id, category_id) VALUES
  ((SELECT id FROM products WHERE name = 'Blackberry_1'), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Blackberry_2'), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Blackberry_3'), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Blackberry_4'), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cherry_1'    ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cherry_2'    ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cherry_3'    ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cherry_4'    ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Grape_1'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Grape_2'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Grape_3'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Grape_4'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Raspberry_1' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Raspberry_2' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Raspberry_3' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Raspberry_4' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Strawberry_1'), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Strawberry_2'), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Strawberry_3'), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Strawberry_4'), (SELECT id FROM categoryId));

-- 2. Dairy_Eggs
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Dairy_Eggs')
INSERT INTO product_categories (product_id, category_id) VALUES
  ((SELECT id FROM products WHERE name = 'Butter_1'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Butter_2'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Butter_3'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Butter_4'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cheese_1'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cheese_2'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cheese_3'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cheese_4'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cottage_cheese_1' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cottage_cheese_2' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cottage_cheese_3' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Cottage_cheese_4' ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Eggs_1'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Eggs_2'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Eggs_3'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Eggs_4'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Milk_1'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Milk_2'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Milk_3'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Milk_4'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Sour_cream_1'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Sour_cream_2'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Sour_cream_3'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Sour_cream_4'     ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Yogurt_1'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Yogurt_2'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Yogurt_3'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Yogurt_4'         ), (SELECT id FROM categoryId));

-- 3. Fish
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Fish')
INSERT INTO product_categories (product_id, category_id) VALUES
  ((SELECT id FROM products WHERE name = 'Bream_1'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Bream_2'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Bream_3'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Bream_4'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Carp_1'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Carp_2'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Carp_3'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Carp_4'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Catfish_1'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Catfish_2'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Catfish_3'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Catfish_4'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Crusian_1'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Crusian_2'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Crusian_3'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Crusian_4'        ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Salmon_1'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Salmon_2'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Salmon_3'         ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Salmon_4'         ), (SELECT id FROM categoryId));

-- 4. Fruits
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Fruits')
INSERT INTO product_categories (product_id, category_id) VALUES
  ((SELECT id FROM products WHERE name = 'Apple_1'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Apple_2'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Apple_3'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Apple_4'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Peach_1'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Peach_2'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Peach_3'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Peach_4'          ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Pear_1'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Pear_2'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Pear_3'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Pear_4'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Plum_1'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Plum_2'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Plum_3'           ), (SELECT id FROM categoryId)),
  ((SELECT id FROM products WHERE name = 'Plum_4'           ), (SELECT id FROM categoryId));

-- 5. Honey
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Honey')
INSERT INTO product_categories (product_id, category_id) VALUES
 ((SELECT id FROM products WHERE name = 'Honey_in_combs_1' ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Honey_in_combs_2' ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Honey_in_combs_3' ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Honey_in_combs_4' ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Honey_in_jars_1'  ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Honey_in_jars_2'  ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Honey_in_jars_3'  ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Honey_in_jars_4'  ), (SELECT id FROM categoryId));

-- 6. Meat
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Meat')
INSERT INTO product_categories (product_id, category_id) VALUES
 ((SELECT id FROM products WHERE name = 'Backon_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Backon_2'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Backon_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Backon_4'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beef_1'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beef_2'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beef_3'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beef_4'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Chicken_1'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Chicken_2'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Chicken_3'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Duck_1'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Duck_2'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Duck_3'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Duck_4'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lard_1'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lard_2'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lard_3'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lard_4'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pork_1'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pork_2'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pork_3'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pork_4'           ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Quail_1'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Quail_2'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Quail_3'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Quail_4'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Rabbit_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Rabbit_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Rabbit_4'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Sousages_1'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Sousages_2'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Sousages_3'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Sousages_4'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Turkey_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Turkey_2'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Turkey_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Turkey_4'         ), (SELECT id FROM categoryId));

-- 7. Vegetables
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Vegetables')
INSERT INTO product_categories (product_id, category_id) VALUES
 ((SELECT id FROM products WHERE name = 'Beetroot_1'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beetroot_2'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beetroot_3'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Beetroot_4'       ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cabbage_1'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cabbage_2'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cabbage_3'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cabbage_4'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Carrot_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Carrot_2'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Carrot_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Carrot_4'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cucumbers_1'      ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cucumbers_2'      ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cucumbers_3'      ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cucumbers_4'      ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Garlic_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Garlic_2'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Garlic_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Garlic_4'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lettuce_1'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lettuce_2'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lettuce_3'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lettuce_4'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Lettuce_5'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Onion_1'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Onion_2'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Onion_3'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Onion_4'          ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pepper_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pepper_2'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pepper_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pepper_4'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Potato_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Potato_2'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Potato_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Potato_4'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Radish_1'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Radish_2'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Radish_3'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Radish_4'         ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Tomatos_1'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Tomatos_2'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Tomatos_3'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Tomatos_4'        ), (SELECT id FROM categoryId));

-- 8. Bakery
WITH categoryId AS (SELECT id FROM categories WHERE name = 'Bakery')
INSERT INTO product_categories (product_id, category_id) VALUES
 ((SELECT id FROM products WHERE name = 'Baget_1'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Baget_2'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Baget_3'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Baget_4'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Bread_1'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Bread_2'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Bread_3'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Bread_4'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cereal_1'                   ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cereal_2'                   ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cereal_3'                   ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Cereal_4'                   ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Dried crust_1'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Dried crust_2'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Dried crust_3'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Dried crust_4'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flatbread_1'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flatbread_2'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flatbread_3'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flatbread_4'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flour_1'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flour_2'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flour_3'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Flour_4'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fish_1'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fish_2'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fish_3'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fish_4'              ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fruits_1'            ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fruits_2'            ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fruits_3'            ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen fruits_4'            ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen meat and poultry_1'  ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen meat and poultry_2'  ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen meat and poultry_3'  ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen meat and poultry_4'  ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen vegitables_1'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen vegitables_2'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen vegitables_3'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Frozen vegitables_4'        ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Ice cream_1'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Ice cream_2'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Ice cream_3'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Ice cream_4'                ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pasta_1'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pasta_2'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pasta_3'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pasta_4'                    ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pita_1'                     ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pita_2'                     ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pita_3'                     ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Pita_4'                     ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Roll_1'                     ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Roll_2'                     ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Roll_3'                     ), (SELECT id FROM categoryId)),
 ((SELECT id FROM products WHERE name = 'Roll_4'                     ), (SELECT id FROM categoryId));

-- -------------------------------------------------------
-- Contacts
-- -------------------------------------------------------
INSERT INTO contacts (id, name, phone, email, site, instagram, viber, whatsapp, telegram) VALUES
 (DEFAULT, 'Seller 1', '+375 25 456 42 42', 'contact@ecofood.by',           'ecofood.by',             'ecofood_by',         '+375 25 456 42 42', '', ''),
 (DEFAULT, 'Seller 2', '+123 45 678 90 90', 'name_surname@gmail.com',       'name_surname.com',       'name_surname',       '+123 45 678 90 90', '', ''),
 (DEFAULT, 'Seller 3', '+098 76 543 21 21', 'viktar_astapkovich@gmail.com', 'viktar_astapkovich.com', 'viktar_astapkovich', '+098 76 543 21 21', '', '');
 
-- -------------------------------------------------------
-- Users
-- -------------------------------------------------------
INSERT INTO users (id, login, password, email, firstname, lastname) VALUES
  (DEFAULT, 'sami',    'sami',     'gstream@gmail.com',  'Sami',              'Keinänen'),
  (DEFAULT, 'magnum',  'magnum',   'sami@gmail.com',     'Sami',              'Wolking'),
  (DEFAULT, 'kalma',   'kalma',    'kalma@gmail.com',    'Nick',              'Gore'),
  (DEFAULT, 'kita',    'kita',     'kita@gmail.com',     'Sampsa',            'Astala'),
  (DEFAULT, 'user',    'user',     'user@gmail.com',     'User firstname',    'User lastname');

INSERT INTO users (id, login, password, email, firstname, lastname) VALUES
  (DEFAULT, 'otus',    'otus',     'otus@gmail.com',     'Tonmi',             'Kristian Lillman'),
  (DEFAULT, 'oxx',     'oxx',      'oxx@gmail.com',      'Samer',             'el Nahhal'),
  (DEFAULT, 'amen',    'amen',     'amen@gmail.com',     'Jussi',             'Sydänmaa'),
  (DEFAULT, 'mana',    'mana',     'mana@gmail.com',     'Antto',             'Nikolai Tuomainen'),
  (DEFAULT, 'seller',  'seller',   'seller@gmail.com',   'Seller firstname',  'Seller lastname'),
  (DEFAULT, 'seller1', 'seller1',  'seller1@gmail.com',  'Seller1 firstname', 'Seller1 lastname'),
  (DEFAULT, 'seller2', 'seller2',  'seller2@gmail.com',  'Seller2 firstname', 'Seller2 lastname');

INSERT INTO users (id, login, password, email, firstname, lastname) VALUES
  (DEFAULT, 'tomi',    'tomi',     'tomi@gmail.com',     'Tomi',              'Petteri Putaansuu'),
  (DEFAULT, 'hella',   'hella',    'hella@gmail.com',    'Henna-Riikka',      'Tuulia Broda'),
  (DEFAULT, 'awa',     'awa',      'awa@gmail.com',      'Leena',             'Maria Peisa'),
  (DEFAULT, 'admin',   'admin',    'admin@gmail.com',    'Admin firstname',   'Admin lastname');

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
  ((SELECT id FROM users WHERE login = 'sami'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'magnum'),  (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'kalma'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'kita'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'user'),    (SELECT id FROM roleId));

WITH roleId AS (SELECT id FROM roles WHERE name = 'SELLER')
INSERT INTO users_roles (user_id, role_id) VALUES
  ((SELECT id FROM users WHERE login = 'otus'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'oxx'),     (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'amen'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'mana'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'seller'),  (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'seller1'), (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'seller2'), (SELECT id FROM roleId));

WITH roleId AS (SELECT id FROM roles WHERE name = 'ADMIN')
INSERT INTO users_roles (user_id, role_id) VALUES
  ((SELECT id FROM users WHERE login = 'tomi'),    (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'hella'),   (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'awa'),     (SELECT id FROM roleId)),
  ((SELECT id FROM users WHERE login = 'admin'),   (SELECT id FROM roleId));

-- --------------------------------------------------------------------------------------------
-- Sellers
-- --------------------------------------------------------------------------------------------
INSERT INTO sellers (id, name, description, grade, user_id) VALUES
 (DEFAULT, 'ECO FOOD',           'The best eco food',       5, (SELECT id FROM users WHERE login = 'seller')),
 (DEFAULT, 'Name Surname',       'The best natural food',   3, (SELECT id FROM users WHERE login = 'seller1')),
 (DEFAULT, 'Viktar Astapkovich', 'The best grapes',         4, (SELECT id FROM users WHERE login = 'seller2'));
 
-- -------------------------------------------------------
-- Seller contacts
-- -------------------------------------------------------
INSERT INTO seller_contacts (seller_id, contact_id) VALUES
 ((SELECT id FROM contacts WHERE name = 'Seller 1'), (SELECT id FROM sellers WHERE name = 'ECO FOOD'));
INSERT INTO seller_contacts (seller_id, contact_id) VALUES
 ((SELECT id FROM contacts WHERE name = 'Seller 2'), (SELECT id FROM sellers WHERE name = 'Name Surname'));
 INSERT INTO seller_contacts (seller_id, contact_id) VALUES
 ((SELECT id FROM contacts WHERE name = 'Seller 3'), (SELECT id FROM sellers WHERE name = 'Viktar Astapkovich'));

-- -------------------------------------------------------
-- Seller categories
-- -------------------------------------------------------

WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO seller_categories (seller_id, category_id) VALUES
-- 1. Berries
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Berries')),
-- 2. Dairy_Eggs
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Dairy_Eggs')),
-- 3. Fish
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Fish'));

WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Name Surname')
INSERT INTO seller_categories (seller_id, category_id) VALUES
-- 4. Fruits
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Fruits')),
-- 5. Honey
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Honey')),
-- 6. Meat
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Meat'));
 
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Viktar Astapkovich')
INSERT INTO seller_categories (seller_id, category_id) VALUES
-- 7. Vegetables
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Vegetables')),
-- 8. Bakery
 ((SELECT id FROM sellerId), (SELECT id FROM categories WHERE name = 'Bakery'));

 
-- -------------------------------------------------------
-- Seller products
-- -------------------------------------------------------
 
-- 1. Berries
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO seller_products (seller_id, product_id) VALUES
-- 1. Eggs
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Blackberry_1')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Blackberry_2')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Blackberry_3')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Blackberry_4'));

-- 2. Dairy_Eggs
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO seller_products (seller_id, product_id) VALUES
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Butter_1')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Butter_2')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Butter_3')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Butter_4'));

-- 3. Fish
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO seller_products (seller_id, product_id) VALUES
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Bream_1')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Bream_2')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Bream_3')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Bream_4'));

-- 4. Fruits
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Name Surname')
INSERT INTO seller_products (seller_id, product_id) VALUES
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Apple_1')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Apple_2')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Apple_3')),
  ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Apple_4'));

-- 5. Honey
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Name Surname')
INSERT INTO seller_products (seller_id, product_id) VALUES
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Honey_in_combs_1')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Honey_in_combs_2')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Honey_in_combs_3')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Honey_in_combs_4'));

-- 6. Meat
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Name Surname')
INSERT INTO seller_products (seller_id, product_id) VALUES
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Backon_1')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Backon_2')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Backon_3')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Backon_4'));

-- 7. Vegetables
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Viktar Astapkovich')
INSERT INTO seller_products (seller_id, product_id) VALUES
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Beetroot_1')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Beetroot_2')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Beetroot_3')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Beetroot_4'));

-- 8. Bakery
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Viktar Astapkovich')
INSERT INTO seller_products (seller_id, product_id) VALUES
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Baget_1')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Baget_2')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Baget_3')),
 ((SELECT id FROM sellerId), (SELECT id FROM products WHERE name = 'Baget_4'));
 
-- -------------------------------------------------------
-- Seller cities
-- -------------------------------------------------------
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO seller_cities (seller_id, city_id) VALUES
 ((SELECT id FROM sellerId), (SELECT id FROM cities WHERE name = 'Minsk')),
 ((SELECT id FROM sellerId), (SELECT id FROM cities WHERE name = 'Kyiv')),
 ((SELECT id FROM sellerId), (SELECT id FROM cities WHERE name = 'Saint-Petersburg')),
 ((SELECT id FROM sellerId), (SELECT id FROM cities WHERE name = 'Budapest')),
 ((SELECT id FROM sellerId), (SELECT id FROM cities WHERE name = 'Yerevan')),
 ((SELECT id FROM sellerId), (SELECT id FROM cities WHERE name = 'Almaty'));
 
-- -------------------------------------------------------
-- Reviews
-- -------------------------------------------------------
WITH sellerId AS (SELECT id FROM sellers WHERE name = 'ECO FOOD')
INSERT INTO reviews (id, seller_id, user_id, rating, comment) VALUES
 (DEFAULT, (SELECT id FROM sellerId), (SELECT id FROM users WHERE login = 'seller'), 5, 'Excellent');

WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Name Surname')
INSERT INTO reviews (id, seller_id, user_id, rating, comment) VALUES
 (DEFAULT, (SELECT id FROM sellerId), (SELECT id FROM users WHERE login = 'seller1'), 3, 'Satisfactory');

WITH sellerId AS (SELECT id FROM sellers WHERE name = 'Viktar Astapkovich')
INSERT INTO reviews (id, seller_id, user_id, rating, comment) VALUES
 (DEFAULT, (SELECT id FROM sellerId), (SELECT id FROM users WHERE login = 'seller2'), 4, 'Good');
