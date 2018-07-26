DROP DATABASE IF EXISTS bamazon_DB;
CREATE DATABASE bamazon_DB;

use bamazon_DB;

CREATE TABLE products(
    position INT NOT NULL auto_increment,
    PRODUCT_NAME VARCHAR(100) not NULL,
    DEPARTMENT_NAME VARCHAR(100) NOT NULL,
    PRICE DECIMAL(10,4) NOT NULL,
    STOCK_QUANTITY INT NOT NULL,
    primary KEY (position)
);

SELECT * from products

insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("chicken", "food", 1.50, 50);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("noodles", "food", 0.79, 100);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("dog food", "non-food", 7.00, 25);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("pepsi", "food", 3.99, 1050);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("apple juice", "food", 1.00, 10);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("salad dressing", "food", 1.25, 75);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("pickles", "food", 2.99, 30);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("batteries", "non-food", 5.99, 80);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("tylenol", "hbc", 4.99, 40);
insert into products (PRODUCT_NAME, DEPARTMENT_NAME, PRICE, STOCK_QUANTITY)
VALUES ("make-up", "hbc", 8.00, 35);