DROP TABLE products;
DROP TABLE categories;
DROP TABLE manufacturers;


CREATE TABLE manufacturers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE categories (
  id SERIAL8 PRIMARY KEY,
  value VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  manufacturer_id INT8 REFERENCES manufacturers(id),
  category_id INT8 REFERENCES categories(id),
  quantity INT4,
  cost INT4,
  price INT4
);
