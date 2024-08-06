-- The Tables imported from QuickDB contained bugs, and was not adequately written to my taste
-- This is the version I used 




CREATE TABLE orders (
    row_id int PRIMARY KEY,
    order_id varchar(10)   NOT NULL,
    created_at Timestamp   NOT NULL,
    item_id varchar(10)   NOT NULL,
    quantity int   NOT NULL,
    delivery boolean   NOT NULL,
    cust_id int   NOT NULL,
    add_id int   NOT NULL
    
     );

CREATE TABLE customers (
    cust_id int PRIMARY KEY,
    cust_firstname varchar(50)   NOT NULL,
    cust_lastname varchar(50)   NOT NULL
);

CREATE TABLE address (
    add_id int PRIMARY KEY,
    delivery_address1 varchar(200)   NOT NULL,
    delivery_address2 varchar(200)   NULL,
    delivery_city varchar(50)   NOT NULL,
    delivery_zipcode varchar(20)   NOT NULL
    
);

CREATE TABLE items (
    item_id varchar(10) PRIMARY KEY,
    sku varchar(20)   NOT NULL,
    item_name varchar(100)   NOT NULL,
    item_cat varchar(100)   NOT NULL,
    item_size varchar(10)   NOT NULL,
    item_price decimal(10,2)   NOT NULL
     
);

CREATE TABLE ingredients (
    ing_id varchar(10) PRIMARY KEY,
    ing_name varchar(200)   NOT NULL,
    ing_weight int   NOT NULL,
    ing_meas varchar(20)   NOT NULL,
    ing_price decimal(5,2)   NOT NULL
);

CREATE TABLE recipes (
    row_id int   PRIMARY KEY,
    recipe_id varchar(20)   NOT NULL,
    ing_id varchar(10)   NOT NULL,
    quantity int   NOT NULL
     );

CREATE TABLE inventory (
    inv_id int PRIMARY KEY,
    item_id varchar(10)   NOT NULL,
    quantity int   NOT NULL
);

/*
ALTER TABLE "customers" ADD CONSTRAINT "fk_customers_cust_id" FOREIGN KEY("cust_id")
REFERENCES "orders" ("cust_id");

ALTER TABLE "address" ADD CONSTRAINT "fk_address_add_id" FOREIGN KEY("add_id")
REFERENCES "orders" ("add_id");

ALTER TABLE "item" ADD CONSTRAINT "fk_item_item_id" FOREIGN KEY("item_id")
REFERENCES "orders" ("item_id");

ALTER TABLE "ingredient" ADD CONSTRAINT "fk_ingredient_ing_id" FOREIGN KEY("ing_id")
REFERENCES "recipe" ("ing_id");

ALTER TABLE "recipe" ADD CONSTRAINT "fk_recipe_recipe_id" FOREIGN KEY("recipe_id")
REFERENCES "item" ("sku");

ALTER TABLE "inventory" ADD CONSTRAINT "fk_inventory_item_id" FOREIGN KEY("item_id")
REFERENCES "recipe" ("ing_id");
*/
