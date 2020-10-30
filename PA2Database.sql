--  adapted from data.sql which was the example sql file given in the modules.


CREATE DATABASE 'Benedict_Wong';
USE 'Benedict_Wong';

DROP TABLE IF EXISTS 'product';
CREATE TABLE 'product' (
  'productID' int(6) NOT NULL,
  'productName' text NOT NULL,
  'price' int(7) NOT NULL,
  'rating' int(5) NOT NULL,
  'features' text,
  'deals' int(6),
  'genre' varchar(20) NOT NULL,
  'releaseDate' date NOT NULL,
  PRIMARY KEY('productID'),
  KEY 'rating' ('rating'),
  CONSTRAINT 'product_key_1' FOREIGN KEY ('productID') REFERENCES 'cart' ('productID'),
  CONSTRAINT 'product_key_2' FOREIGN KEY ('productID') REFERENCES 'review' ('productID'),
  CONSTRAINT 'product_key_3' FOREIGN KEY ('rating') REFERENCES 'reveiew' ('rating')
);

-- Use to insert values into the table
LOCK TABLES 'product' WRITE;

insert into 'product'
('productID','productName','price', 'rating', 'features', 'deals', 'genre', 'releaseDate')
values
('000001', 'sample product name','89.99','3','this game is a placeholder for the table','29.99','action','2020-12-31'),
('000002', 'sample product name','89.99','3','this game is a placeholder for the table','29.99','action','2020-12-31');


UNLOCK TABLES;


DROP TABLE IF EXISTS 'customer';
CREATE TABLE 'customer' (
  'customerID' int(10) NOT NULL,
  'gender' varchar(6) NOT NULL,
  'email' text NOT NULL,
  'password' text NOT NULL,
  'birthDate' date NOT NULL,
  PRIMARY KEY('customerID'),
  CONSTRAINT 'customer_key_1' FOREIGN KEY ('customerID') REFERENCES 'cart' ('customerID'),
  CONSTRAINT 'customer_key_2' FOREIGN KEY ('customerID') REFERENCES 'orderHistory' ('customerID'),
  CONSTRAINT 'customer_key_3' FOREIGN KEY ('customerID') REFERENCES 'review' ('customerID')
);
-- When signup, customer table will be filled

DROP TABLE IF EXISTS 'cart';
CREATE TABLE 'cart' (
  'cartID' int(10) NOT NULL,
  'productID' int(10) NOT NULL,
  'customerID' int(10) NOT NULL,
  'quantity' int(3) NOT NULL,
  PRIMARY KEY('cartID'),
  KEY 'productID' ('productID'),
  KEY 'customerID' ('customerID'),
  CONSTRAINT 'cart_key_1' FOREIGN KEY ('productID') REFERENCES 'product' ('productID'),
  CONSTRAINT 'cart_key_2' FOREIGN KEY ('customerID') REFERENCES 'customer' ('customerID')
);

DROP TABLE IF EXISTS 'review';
CREATE TABLE 'review' (
  'reviewID' int(10) NOT NULL,
  'productID' int(10) NOT NULL,
  'customerID' int(10) NOT NULL,
  'rating' int(5) NOT NULL,
  'comment' text NOT NULL,
  PRIMARY KEY('reviewID'),
  KEY 'productID' ('productID'),
  KEY 'customerID' ('customerID'),
  KEY 'rating' ('rating')
  CONSTRAINT 'review_key_1' FOREIGN KEY ('productID') REFERENCES 'product' ('productID'),
  CONSTRAINT 'review_key_2' FOREIGN KEY ('customerID') REFERENCES 'customer' ('customerID'),
  CONSTRAINT 'review_key_3' FOREIGN KEY ('rating') REFERENCES 'product' ('rating')
);

DROP TABLE IF EXISTS 'orderHistory';
CREATE TABLE 'orderHistory' (
  'orderID' int(10) NOT NULL,
  'customerID' int(10) NOT NULL,
  'orderDate' date NOT NULL,
  PRIMARY KEY('orderID'),
  KEY 'customerID' ('customerID'),
  CONSTRAINT 'review_key_2' FOREIGN KEY ('customerID') REFERENCES 'customer' ('customerID')
);
