/**
 Author: Mrin 
 Model : NorthWind
**/

DROP DATABASE IF EXISTS northwind;

CREATE DATABASE northwind;
USE northwind;

/* Table: customers */
CREATE TABLE customers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: employees */
CREATE TABLE employees (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: inventory_transaction_types */
CREATE TABLE inventory_transaction_types (
  id TINYINT NOT NULL,
  type_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: shippers */
CREATE TABLE shippers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: orders */
CREATE TABLE orders (
  id              INT NOT NULL,
  employee_id     INT ,
  customer_id     INT ,
  order_date      DATETIME ,
  shipped_date    DATETIME ,
  shipper_id      INT ,
  ship_name       VARCHAR(50) ,
  ship_address    VARCHAR(250) ,
  ship_city       VARCHAR(50) ,
  ship_state_province  VARCHAR(50) ,
  ship_zip_postal_code VARCHAR(50) ,
  ship_country_region  VARCHAR(50) ,
  shipping_fee    DECIMAL(19,4) NULL DEFAULT '0.0000',
  taxes           DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_type    VARCHAR(50) ,
  paid_date       DATETIME ,
  notes           VARCHAR(250) ,
  tax_rate        DOUBLE NULL DEFAULT '0',
  tax_status_id   TINYINT ,
  status_id       TINYINT NULL DEFAULT '0',
  PRIMARY KEY (id)
);

/* Table: orders_status */
CREATE TABLE orders_status (
  id          TINYINT     NOT NULL,
  status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: orders_tax_status */
CREATE TABLE orders_tax_status (
  id              TINYINT     NOT NULL,
  tax_status_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: order_details */
CREATE TABLE order_details (
  id                  INT NOT NULL,  
  order_id            INT NOT NULL,
  product_id          INT ,
  quantity            DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
  unit_price          DECIMAL(19,4) NULL DEFAULT '0.0000',
  discount            DOUBLE NOT NULL DEFAULT '0',
  status_id           INT ,
  date_allocated      DATETIME ,
  purchase_order_id   INT ,
  inventory_id        INT ,
  PRIMARY KEY (id)
);

/* Table: order_details_status */
CREATE TABLE order_details_status (
  id            INT         NOT NULL,
  status_name   VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

/* Table: products */
CREATE TABLE products (
  id              INT NOT NULL,
  supplier_ids    VARCHAR(250) ,
  product_code    VARCHAR(25) ,
  product_name    VARCHAR(50) ,
  description     VARCHAR(250) ,
  standard_cost   DECIMAL(19,4) NULL DEFAULT '0.0000',
  list_price      DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  reorder_level   INT ,
  target_level    INT ,
  quantity_per_unit VARCHAR(50) ,
  discontinued    TINYINT NOT NULL DEFAULT '0',
  minimum_reorder_quantity INT ,
  category        VARCHAR(50) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: suppliers */
CREATE TABLE suppliers (
  id              INT NOT NULL,
  company         VARCHAR(50) ,
  last_name       VARCHAR(50) ,
  first_name      VARCHAR(50) ,
  email_address   VARCHAR(50) ,
  job_title       VARCHAR(50) ,
  business_phone  VARCHAR(25) ,
  home_phone      VARCHAR(25) ,
  mobile_phone    VARCHAR(25) ,
  fax_number      VARCHAR(25) ,
  address         VARCHAR(250) ,
  city            VARCHAR(50) ,
  state_province  VARCHAR(50) ,
  zip_postal_code VARCHAR(15) ,
  country_region  VARCHAR(50) ,
  web_page        VARCHAR(250) ,
  notes           VARCHAR(250) ,
  attachments     LONGBLOB ,
  PRIMARY KEY (id)
);

/* Table: purchase_orders */
CREATE TABLE purchase_orders (
  id              INT NOT NULL,
  supplier_id     INT ,
  created_by      INT ,
  submitted_date  DATETIME ,
  creation_date   DATETIME ,
  status_id       INT NULL DEFAULT '0',
  expected_date   DATETIME ,
  shipping_fee    DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  taxes           DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
  payment_date    DATETIME ,
  payment_amount  DECIMAL(19,4) NULL DEFAULT '0.0000',
  payment_method  VARCHAR(50) ,
  notes           VARCHAR(250) ,
  approved_by     INT ,
  approved_date   DATETIME ,
  submitted_by    INT ,
  PRIMARY KEY (id)
);

/* Table: purchase_order_details */
CREATE TABLE purchase_order_details (
  id                  INT NOT NULL,    
  purchase_order_id   INT NOT NULL,
  product_id          INT ,
  quantity            DECIMAL(18,4) NOT NULL,
  unit_cost           DECIMAL(19,4) NOT NULL,
  date_received       DATETIME ,
  posted_to_inventory TINYINT NOT NULL DEFAULT '0',
  inventory_id        INT ,
  PRIMARY KEY (id)
);

/* Table: purchase_order_status */
CREATE TABLE purchase_order_status (
  id      INT NOT NULL,
  status  VARCHAR(50) ,
  PRIMARY KEY (id)
);

/* Table: inventory_transactions */
CREATE TABLE inventory_transactions (
  id                  INT NOT NULL,
  transaction_type    TINYINT(4) NOT NULL,
  transaction_created_date    DATETIME ,
  transaction_modified_date   DATETIME ,
  product_id          INT NOT NULL,
  quantity            INT NOT NULL,
  purchase_order_id   INT ,
  customer_order_id   INT ,
  comments            VARCHAR(255) ,
  PRIMARY KEY (id)
);

/* Table: invoices */
CREATE TABLE invoices (
  id            INT NOT NULL,
  order_id      INT ,
  invoice_date  DATETIME ,
  due_date      DATETIME ,
  tax           DECIMAL(19,4) NULL DEFAULT '0.0000',
  shipping      DECIMAL(19,4) NULL DEFAULT '0.0000',
  amount_due    DECIMAL(19,4) NULL DEFAULT '0.0000',
  PRIMARY KEY (id)
);

/* Table: strings */
CREATE TABLE strings (
  string_id   INT NOT NULL,
  string_data VARCHAR(255) ,
  PRIMARY KEY (string_id)
);


/* Foreign Key: orders */
ALTER TABLE orders ADD CONSTRAINT fk_orders__customers FOREIGN KEY (customer_id) REFERENCES customers(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__employees FOREIGN KEY (employee_id) REFERENCES employees(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__shippers  FOREIGN KEY (shipper_id)  REFERENCES shippers(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__orders_tax_status FOREIGN KEY (tax_status_id) REFERENCES orders_tax_status(id);
ALTER TABLE orders ADD CONSTRAINT fk_orders__orders_status     FOREIGN KEY (status_id)     REFERENCES orders_status(id);
/* Foreign Key:  order_details */
ALTER TABLE order_details ADD CONSTRAINT fk_order_details__orders      FOREIGN KEY (order_id) REFERENCES orders(id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_details__products    FOREIGN KEY (product_id) REFERENCES products(id);
ALTER TABLE order_details ADD CONSTRAINT fk_order_details__order_details_status FOREIGN KEY (status_id) REFERENCES order_details_status (id);

/* Foreign Key: inventory_transactions */
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__orders          FOREIGN KEY (customer_order_id) REFERENCES orders(id);
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__products        FOREIGN KEY (product_id) REFERENCES products(id);
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__purchase_orders FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id);
ALTER TABLE inventory_transactions ADD CONSTRAINT fk_inventory_transactions__inventory_transaction_types FOREIGN KEY (transaction_type) REFERENCES inventory_transaction_types(id);

/* Foreign Key: purchase_orders */
ALTER TABLE purchase_orders ADD CONSTRAINT fk_purchase_orders__employees FOREIGN KEY (created_by)  REFERENCES  employees(id);
ALTER TABLE purchase_orders ADD CONSTRAINT fk_purchase_orders__suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers(id);
ALTER TABLE purchase_orders ADD CONSTRAINT fk_purchase_orders__purchase_order_status FOREIGN KEY (status_id) REFERENCES purchase_order_status(id);
/* Foreign Key: purchase_order_details */
ALTER TABLE purchase_order_details ADD CONSTRAINT fk_purchase_order_details__inventory_transactions FOREIGN KEY (inventory_id) REFERENCES inventory_transactions(id);
ALTER TABLE purchase_order_details ADD CONSTRAINT fk_purchase_order_details__products FOREIGN KEY (product_id) REFERENCES products (id);
ALTER TABLE purchase_order_details ADD CONSTRAINT fk_purchase_order_details__purchase_orders FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id);

/* Foreign Key: invoices */
ALTER TABLE invoices ADD CONSTRAINT fk_invoices__orders FOREIGN KEY (order_id) REFERENCES orders(id);


/**
 Insert data into database
**/


/* customers */
INSERT INTO `customers` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES
     (1,  'Company A' , 'Bedecs'           , 'Anna'      , NULL, 'Owner'                    , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 1st Street' , 'Seattle'       , 'WA', '99999', 'USA', NULL, NULL, '')
    ,(2,  'Company B' , 'Gratacos Solsona' , 'Antonio'   , NULL, 'Owner'                    , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 2nd Street' , 'Boston'        , 'MA', '99999', 'USA', NULL, NULL, '')
    ,(3,  'Company C' , 'Axen'             , 'Thomas'    , NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 3rd Street' , 'Los Angelas'   , 'CA', '99999', 'USA', NULL, NULL, '')
    ,(4,  'Company D' , 'Lee'              , 'Christina' , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 4th Street' , 'New York'      , 'NY', '99999', 'USA', NULL, NULL, '')
    ,(5,  'Company E' , 'O’Donnell'        , 'Martin'    , NULL, 'Owner'                    , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 5th Street' , 'Minneapolis'   , 'MN', '99999', 'USA', NULL, NULL, '')
    ,(6,  'Company F' , 'Pérez-Olaeta'     , 'Francisco' , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 6th Street' , 'Milwaukee'     , 'WI', '99999', 'USA', NULL, NULL, '')
    ,(7,  'Company G' , 'Xie'              , 'Ming-Yang' , NULL, 'Owner'                    , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 7th Street' , 'Boise'         , 'ID', '99999', 'USA', NULL, NULL, '')
    ,(8,  'Company H' , 'Andersen'         , 'Elizabeth' , NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 8th Street' , 'Portland'      , 'OR', '99999', 'USA', NULL, NULL, '')
    ,(9,  'Company I' , 'Mortensen'        , 'Sven'      , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 9th Street' , 'Salt Lake City', 'UT', '99999', 'USA', NULL, NULL, '')
    ,(10, 'Company J' , 'Wacker'           , 'Roland'    , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 10th Street', 'Chicago'       , 'IL', '99999', 'USA', NULL, NULL, '')
    ,(11, 'Company K' , 'Krschne'          , 'Peter'     , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 11th Street', 'Miami'         , 'FL', '99999', 'USA', NULL, NULL, '')
    ,(12, 'Company L' , 'Edwards'          , 'John'      , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '123 12th Street', 'Las Vegas'     , 'NV', '99999', 'USA', NULL, NULL, '')
    ,(13, 'Company M' , 'Ludick'           , 'Andre'     , NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 13th Street', 'Memphis'       , 'TN', '99999', 'USA', NULL, NULL, '')
    ,(14, 'Company N' , 'Grilo'            , 'Carlos'    , NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 14th Street', 'Denver'        , 'CO', '99999', 'USA', NULL, NULL, '')
    ,(15, 'Company O' , 'Kupkova'          , 'Helena'    , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '456 15th Street', 'Honolulu'      , 'HI', '99999', 'USA', NULL, NULL, '')
    ,(16, 'Company P' , 'Goldschmidt'      , 'Daniel'    , NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 16th Street', 'San Francisco' , 'CA', '99999', 'USA', NULL, NULL, '')
    ,(17, 'Company Q' , 'Bagel'            , 'Jean Philippe', NULL, 'Owner'                 , '(123)555-0100', NULL, NULL, '(123)555-0101', '456 17th Street', 'Seattle'       , 'WA', '99999', 'USA', NULL, NULL, '')
    ,(18, 'Company R' , 'Autier Miconi'    , 'Catherine' , NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 18th Street', 'Boston'        , 'MA', '99999', 'USA', NULL, NULL, '')
    ,(19, 'Company S' , 'Eggerer'          , 'Alexander' , NULL, 'Accounting Assistant'     , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 19th Street', 'Los Angelas'   , 'CA', '99999', 'USA', NULL, NULL, '')
    ,(20, 'Company T' , 'Li'               , 'George'    , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 20th Street', 'New York'      , 'NY', '99999', 'USA', NULL, NULL, '')
    ,(21, 'Company U' , 'Tham'             , 'Bernard'   , NULL, 'Accounting Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 21th Street', 'Minneapolis'   , 'MN', '99999', 'USA', NULL, NULL, '')
    ,(22, 'Company V' , 'Ramos'            , 'Luciana'   , NULL, 'Purchasing Assistant'     , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 22th Street', 'Milwaukee'     , 'WI', '99999', 'USA', NULL, NULL, '')
    ,(23, 'Company W' , 'Entin'            , 'Michael'   , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 23th Street', 'Portland'      , 'OR', '99999', 'USA', NULL, NULL, '')
    ,(24, 'Company X' , 'Hasselberg'       , 'Jonas'     , NULL, 'Owner'                    , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 24th Street', 'Salt Lake City', 'UT', '99999', 'USA', NULL, NULL, '')
    ,(25, 'Company Y' , 'Rodman'           , 'John'      , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 25th Street', 'Chicago'       , 'IL', '99999', 'USA', NULL, NULL, '')
    ,(26, 'Company Z' , 'Liu'              , 'Run'       , NULL, 'Accounting Assistant'     , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 26th Street', 'Miami'         , 'FL', '99999', 'USA', NULL, NULL, '')
    ,(27, 'Company AA', 'Toh'              , 'Karen'     , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 27th Street', 'Las Vegas'     , 'NV', '99999', 'USA', NULL, NULL, '')
    ,(28, 'Company BB', 'Raghav'           , 'Amritansh' , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 28th Street', 'Memphis'       , 'TN', '99999', 'USA', NULL, NULL, '')
    ,(29, 'Company CC', 'Lee'              , 'Soo Jung'  , NULL, 'Purchasing Manager'       , '(123)555-0100', NULL, NULL, '(123)555-0101', '789 29th Street', 'Denver'        , 'CO', '99999', 'USA', NULL, NULL, '');

/* 'employees' */
INSERT INTO `employees` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES 
     (1, 'Northwind Traders', 'Freehafer', 'Nancy'  , 'nancy@northwindtraders.com'  , 'Sales Representative' , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 1st Avenue', 'Seattle' , 'WA', '99999', 'USA', '#http://northwindtraders.com#', NULL, '')
    ,(2, 'Northwind Traders', 'Cencini'  , 'Andrew' , 'andrew@northwindtraders.com' , 'Vice President, Sales', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 2nd Avenue', 'Bellevue', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.', '')
    ,(3, 'Northwind Traders', 'Kotas'    , 'Jan'    , 'jan@northwindtraders.com'    , 'Sales Representative' , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 3rd Avenue', 'Redmond' , 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Was hired as a sales associate and was promoted to sales representative.', '')
    ,(4, 'Northwind Traders', 'Sergienko', 'Mariya' , 'mariya@northwindtraders.com' , 'Sales Representative' , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 4th Avenue', 'Kirkland', 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', NULL, '')
    ,(5, 'Northwind Traders', 'Thorpe'   , 'Steven' , 'steven@northwindtraders.com' , 'Sales Manager'        , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 5th Avenue', 'Seattle' , 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Joined the company as a sales representative and was promoted to sales manager.  Fluent in French.', '')
    ,(6, 'Northwind Traders', 'Neipper'  , 'Michael', 'michael@northwindtraders.com', 'Sales Representative' , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 6th Avenue', 'Redmond' , 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Fluent in Japanese and can read and write French, Portuguese, and Spanish.', '')
    ,(7, 'Northwind Traders', 'Zare'     , 'Robert' , 'robert@northwindtraders.com' , 'Sales Representative' , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 7th Avenue', 'Seattle' , 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', NULL, '')
    ,(8, 'Northwind Traders', 'Giussani' , 'Laura'  , 'laura@northwindtraders.com'  , 'Sales Coordinator'    , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 8th Avenue', 'Redmond' , 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Reads and writes French.', '')
    ,(9, 'Northwind Traders', 'Hellung-Larsen', 'Anne', 'anne@northwindtraders.com' , 'Sales Representative' , '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 9th Avenue', 'Seattle' , 'WA', '99999', 'USA', 'http://northwindtraders.com#http://northwindtraders.com/#', 'Fluent in French and German.', '');

/* products */
INSERT INTO `products` (`supplier_ids`, `id`, `product_code`, `product_name`, `description`, `standard_cost`, `list_price`, `reorder_level`, `target_level`, `quantity_per_unit`, `discontinued`, `minimum_reorder_quantity`, `category`, `attachments`) VALUES 
     ('4' , 1 , 'NWTB-1'   , 'Northwind Traders Chai'              , NULL, 13.50, 18   , 10 , 40 , '10 boxes x 20 bags' , 0, 10  , 'Beverages' , '')
    ,('10', 3 , 'NWTCO-3'  , 'Northwind Traders Syrup'             , NULL, 7.50 , 10   , 25 , 100, '12 - 550 ml bottles', 0, 25  , 'Condiments', '')
    ,('10', 4 , 'NWTCO-4'  , 'Northwind Traders Cajun Seasoning'   , NULL, 16.5 , 22   , 10 , 40 , '48 - 6 oz jars'     , 0, 10  , 'Condiments', '')
    ,('10', 5 , 'NWTO-5'   , 'Northwind Traders Olive Oil'         , NULL, 16.25, 21.35, 10 , 40 , '36 boxes'           , 0, 10  , 'Oil'       , '')
    ,('26', 6 , 'NWTJP-6'  , 'Northwind Traders Boysenberry Spread', NULL, 18.75, 25   , 25 , 100, '12 - 8 oz jars'     , 0, 25  , 'Jams, Preserves', '')
    ,('2' , 7 , 'NWTDFN-7' , 'Northwind Traders Dried Pears'       , NULL, 22.50, 30   , 10 , 40 , '12 - 1 lb pkgs.'    , 0, 10  , 'Dried Fruit & Nuts', '')
    ,('8' , 8 , 'NWTS-8'   , 'Northwind Traders Curry Sauce'       , NULL, 30   , 40   , 10 , 40 , '12 - 12 oz jars'    , 0, 10  , 'Sauces'    , '')
    ,('26', 14, 'NWTDFN-14', 'Northwind Traders Walnuts'           , NULL, 17.75, 23.25, 10 , 40 , '40 - 100 g pkgs.'   , 0, 10  , 'Dried Fruit & Nuts', '')
    ,('6' , 17, 'NWTCFV-17', 'Northwind Traders Fruit Cocktail'    , NULL, 29.25, 39   , 10 , 40 , '15.25 OZ'           , 0, 10  , 'Canned Fruit & Vegetables', '')
    ,('1' , 19, 'NWTBGM-19', 'Northwind Traders Chocolate Biscuits Mix', NULL, 6, 9.20 , 5  , 20 , '10 boxes x 12 pieces', 0, 5  , 'Baked Goods & Mixes', '')
    ,('26', 20, 'NWTJP-6'  , 'Northwind Traders Marmalade'         , NULL, 60.75, 81   , 10 , 40 , '30 gift boxes'      , 0, 10  , 'Jams, Preserves', '')
    ,('1' , 21, 'NWTBGM-21', 'Northwind Traders Scones'            , NULL, 7.50 , 10   , 5  , 20 , '24 pkgs. x 4 pieces', 0, 5   , 'Baked Goods & Mixes', '')
    ,('4' , 34, 'NWTB-34'  , 'Northwind Traders Beer'              , NULL, 10.50, 14   , 15 , 60 , '24 - 12 oz bottles' , 0, 15  , 'Beverages', '')
    ,('7' , 40, 'NWTCM-40' , 'Northwind Traders Crab Meat'         , NULL, 13.80, 18.40, 30 , 120, '24 - 4 oz tins'     , 0, 30  , 'Canned Meat', '')
    ,('6' , 41, 'NWTSO-41' , 'Northwind Traders Clam Chowder'      , NULL, 7.75 , 9.65 , 10 , 40 , '12 - 12 oz cans'    , 0, 10  , 'Soups', '')
    ,('34', 43, 'NWTB-43'  , 'Northwind Traders Coffee'            , NULL, 34.50, 46   , 25 , 100, '16 - 500 g tins'    , 0, 25  , 'Beverages', '')
    ,('10', 48, 'NWTCA-48' , 'Northwind Traders Chocolate'         , NULL, 9.25 , 12.75, 25 , 100, '10 pkgs'            , 0, 25  , 'Candy', '')
    ,('2' , 51, 'NWTDFN-51', 'Northwind Traders Dried Apples'      , NULL, 39.75, 53   , 10 , 40 , '50 - 300 g pkgs.'   , 0, 10  , 'Dried Fruit & Nuts', '')
    ,('1' , 52, 'NWTG-52'  , 'Northwind Traders Long Grain Rice'   , NULL, 5.25 , 7    , 25 , 100, '16 - 2 kg boxes'    , 0, 25  , 'Grains', '')
    ,('1' , 56, 'NWTP-56'  , 'Northwind Traders Gnocchi'           , NULL, 28.50, 38   , 30 , 120, '24 - 250 g pkgs.'   , 0, 30  , 'Pasta', '')
    ,('1' , 57, 'NWTP-57'  , 'Northwind Traders Ravioli'           , NULL, 14.25, 19.50, 20 , 80 , '24 - 250 g pkgs.'   , 0, 20  , 'Pasta', '')
    ,('8' , 65, 'NWTS-65'  , 'Northwind Traders Hot Pepper Sauce'  , NULL, 15.75, 21.05, 10 , 40 , '32 - 8 oz bottles'  , 0, 10  , 'Sauces', '')
    ,('8' , 66, 'NWTS-66'  , 'Northwind Traders Tomato Sauce'      , NULL, 12.75, 17   , 20 , 80 , '24 - 8 oz jars'     , 0, 20  , 'Sauces', '')
    ,('5' , 72, 'NWTD-72'  , 'Northwind Traders Mozzarella'        , NULL, 26.10, 34.8 , 10 , 40 , '24 - 200 g pkgs.'   , 0, 10  , 'Dairy products', '')
    ,('26', 74, 'NWTDFN-74', 'Northwind Traders Almonds'           , NULL, 7.50 , 10   , 5  , 20 , '5 kg pkg.'          , 0, 5   , 'Dried Fruit & Nuts', '')
    ,('10', 77, 'NWTCO-77' , 'Northwind Traders Mustard'           , NULL, 9.75 , 13   , 15 , 60 , '12 boxes'           , 0, 15  , 'Condiments', '')
    ,('2' , 80, 'NWTDFN-80', 'Northwind Traders Dried Plums'       , NULL, 3    , 3.50 , 50 , 75 , '1 lb bag'           , 0, 25  , 'Dried Fruit & Nuts', '')
    ,('3' , 81, 'NWTB-81'  , 'Northwind Traders Green Tea'         , NULL, 2    , 2.99 , 100, 125, '20 bags per box'    , 0, 25  , 'Beverages', '')
    ,('1' , 82, 'NWTC-82'  , 'Northwind Traders Granola'           , NULL, 2    , 4    , 20 , 100, NULL                 , 0, NULL, 'Cereal', '')
    ,('9' , 83, 'NWTCS-83' , 'Northwind Traders Potato Chips'      , NULL, .50  , 1.80 , 30 , 200, NULL                 , 0, NULL, 'Chips, Snacks', '')
    ,('1' , 85, 'NWTBGM-85', 'Northwind Traders Brownie Mix'       , NULL, 9    , 12.49, 10 , 20 , '3 boxes'            , 0, 5   , 'Baked Goods & Mixes', '')
    ,('1' , 86, 'NWTBGM-86', 'Northwind Traders Cake Mix'          , NULL, 10.50, 15.99, 10 , 20 , '4 boxes'            , 0, 5   , 'Baked Goods & Mixes', '')
    ,('7' , 87, 'NWTB-87'  , 'Northwind Traders Tea'               , NULL, 2    , 40   , 20 , 50 , '100 count per box'  , 0, NULL, 'Beverages', '')
    ,('6' , 88, 'NWTCFV-88', 'Northwind Traders Pears'             , NULL, 1    , 1.3  , 10 , 40 , '15.25 OZ'           , 0, NULL, 'Canned Fruit & Vegetables', '')
    ,('6' , 89, 'NWTCFV-89', 'Northwind Traders Peaches'           , NULL, 1    , 1.5  , 10 , 40 , '15.25 OZ'           , 0, NULL, 'Canned Fruit & Vegetables', '')
    ,('6' , 90, 'NWTCFV-90', 'Northwind Traders Pineapple'         , NULL, 1    , 1.8  , 10 , 40 , '15.25 OZ'           , 0, NULL, 'Canned Fruit & Vegetables', '')
    ,('6' , 91, 'NWTCFV-91', 'Northwind Traders Cherry Pie Filling', NULL, 1    , 2    , 10 , 40 , '15.25 OZ'           , 0, NULL, 'Canned Fruit & Vegetables', '')
    ,('6' , 92, 'NWTCFV-92', 'Northwind Traders Green Beans'       , NULL, 1    , 1.20 , 10 , 40 , '14.5 OZ'            , 0, NULL, 'Canned Fruit & Vegetables', '')
    ,('6' , 93, 'NWTCFV-93', 'Northwind Traders Corn'              , NULL, 1    , 1.20 , 10 , 40 , '14.5 OZ'            , 0, NULL, 'Canned Fruit & Vegetables', '')
    ,('6' , 94, 'NWTCFV-94', 'Northwind Traders Peas'              , NULL, 1    , 1.50 , 10 , 40 , '14.5 OZ'            , 0, NULL, 'Canned Fruit & Vegetables', '')
    ,('7' , 95, 'NWTCM-95' , 'Northwind Traders Tuna Fish'         , NULL, .50  , 2    , 30 , 50 , '5 oz'               , 0, NULL, 'Canned Meat', '')
    ,('7' , 96, 'NWTCM-96' , 'Northwind Traders Smoked Salmon'     , NULL, 2    , 4    , 30 , 50 , '5 oz'               , 0, NULL, 'Canned Meat', '')
    ,('1' , 97, 'NWTC-82'  , 'Northwind Traders Hot Cereal'        , NULL, 3    , 5    , 50 , 200, NULL                 , 0, NULL, 'Cereal', '')
    ,('6' , 98, 'NWTSO-98' , 'Northwind Traders Vegetable Soup'    , NULL, 1    , 1.89 , 100, 200, NULL                 , 0, NULL, 'Soups', '')
    ,('6' , 99, 'NWTSO-99' , 'Northwind Traders Chicken Soup'      , NULL, 1    , 1.95 , 100, 200, NULL                 , 0, NULL, 'Soups', '');

/* suppliers */
INSERT INTO `suppliers` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES 
     (1, 'Supplier A', 'Andersen'  , 'Elizabeth A.'  , NULL, 'Sales Manager'       , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(2, 'Supplier B', 'Weiler'    , 'Cornelia'      , NULL, 'Sales Manager'       , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(3, 'Supplier C', 'Kelley'    , 'Madeleine'     , NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(4, 'Supplier D', 'Sato'      , 'Naoki'         , NULL, 'Marketing Manager'   , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(5, 'Supplier E', 'Hernandez-Echevarria','Amaya', NULL, 'Sales Manager'       , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(6, 'Supplier F', 'Hayakawa'  , 'Satomi'        , NULL, 'Marketing Assistant' , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(7, 'Supplier G', 'Glasson'   , 'Stuart'        , NULL, 'Marketing Manager'   , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(8, 'Supplier H', 'Dunton'    , 'Bryn Paul'     , NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(9, 'Supplier I', 'Sandberg'  , 'Mikael'        , NULL, 'Sales Manager'       , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '')
    ,(10,'Supplier J', 'Sousa'     , 'Luis'          , NULL, 'Sales Manager'       , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');

/* shippers */
INSERT INTO `shippers` (`id`, `company`, `last_name`, `first_name`, `email_address`, `job_title`, `business_phone`, `home_phone`, `mobile_phone`, `fax_number`, `address`, `city`, `state_province`, `zip_postal_code`, `country_region`, `web_page`, `notes`, `attachments`) VALUES 
     (1, 'Shipping Company A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '')
    ,(2, 'Shipping Company B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '')
    ,(3, 'Shipping Company C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '');

/* inventory_transaction_types */
INSERT INTO `inventory_transaction_types` (`id`, `type_name`) VALUES 
    (1, 'Purchased'),
    (2, 'Sold'),
    (3, 'On Hold'),
    (4, 'Waste');

/* order_details_status - None, Allocated, Invoiced,Shipped, On Order, No Stock */
INSERT INTO `order_details_status` (`id`, `status_name`) VALUES 
     (0, 'None')
    ,(1, 'Allocated')
    ,(2, 'Invoiced')
    ,(3, 'Shipped')
    ,(4, 'On Order')
    ,(5, 'No Stock');

/* orders_status' - New, Invoiced, Shipped, Closed */
INSERT INTO `orders_status` (`id`, `status_name`) VALUES 
     (0, 'New')
    ,(1, 'Invoiced')
    ,(2, 'Shipped')
    ,(3, 'Closed');

/* orders_tax_status */
INSERT INTO `orders_tax_status` (`id`, `tax_status_name`) VALUES 
     (0, 'Tax Exempt')
    ,(1, 'Taxable');

/* purchase_order_status */
INSERT INTO `purchase_order_status` (`id`, `status`) VALUES 
     (0, 'New')
    ,(1, 'Submitted')
    ,(2, 'Approved')
    ,(3, 'Closed');

/* orders */
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES 
     (30, 9, 27, '2006-01-15', '2006-01-22', 2, 'Karen Toh'             , '789 27th Street', 'Las Vegas'     , 'NV', '99999', 'USA', 200, 0, 'Check'      , '2006-01-15', NULL, 0, NULL, 3)
    ,(31, 3, 4 , '2006-01-20', '2006-01-22', 1, 'Christina Lee'         , '123 4th Street' , 'New York'      , 'NY', '99999', 'USA', 5  , 0, 'Credit Card', '2006-01-20', NULL, 0, NULL, 3)
    ,(32, 4, 12, '2006-01-22', '2006-01-22', 2, 'John Edwards'          , '123 12th Street', 'Las Vegas'     , 'NV', '99999', 'USA', 5  , 0, 'Credit Card', '2006-01-22', NULL, 0, NULL, 3)
    ,(33, 6, 8 , '2006-01-30', '2006-01-31', 3, 'Elizabeth Andersen'    , '123 8th Street' , 'Portland'      , 'OR', '99999', 'USA', 50 , 0, 'Credit Card', '2006-01-30', NULL, 0, NULL, 3)
    ,(34, 9, 4 , '2006-02-06', '2006-02-07', 3, 'Christina Lee'         , '123 4th Street' , 'New York'      , 'NY', '99999', 'USA', 4  , 0, 'Check'      , '2006-02-06', NULL, 0, NULL, 3)
    ,(35, 3, 29, '2006-02-10', '2006-02-12', 2, 'Soo Jung Lee'          , '789 29th Street', 'Denver'        , 'CO', '99999', 'USA', 7  , 0, 'Check'      , '2006-02-10', NULL, 0, NULL, 3)
    ,(36, 4, 3 , '2006-02-23', '2006-02-25', 2, 'Thomas Axen'           , '123 3rd Street' , 'Los Angelas'   , 'CA', '99999', 'USA', 7  , 0, 'Cash'       , '2006-02-23', NULL, 0, NULL, 3)
    ,(37, 8, 6 , '2006-03-06', '2006-03-09', 2, 'Francisco Pérez-Olaeta', '123 6th Street' , 'Milwaukee'     , 'WI', '99999', 'USA', 12 , 0, 'Credit Card', '2006-03-06', NULL, 0, NULL, 3)
    ,(38, 9, 28, '2006-03-10', '2006-03-11', 3, 'Amritansh Raghav'      , '789 28th Street', 'Memphis'       , 'TN', '99999', 'USA', 10 , 0, 'Check'      , '2006-03-10', NULL, 0, NULL, 3)
    ,(39, 3, 8 , '2006-03-22', '2006-03-24', 3, 'Elizabeth Andersen'    , '123 8th Street' , 'Portland'      , 'OR', '99999', 'USA', 5  , 0, 'Check'      , '2006-03-22', NULL, 0, NULL, 3)
    ,(40, 4, 10, '2006-03-24', '2006-03-24', 2, 'Roland Wacker'         , '123 10th Street', 'Chicago'       , 'IL', '99999', 'USA', 9  , 0, 'Credit Card', '2006-03-24', NULL, 0, NULL, 3)
    ,(41, 1, 7 , '2006-03-24', NULL        , NULL, 'Ming-Yang Xie'      , '123 7th Street' , 'Boise'         , 'ID', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(42, 1, 10, '2006-03-24', '2006-04-07', 1, 'Roland Wacker'         , '123 10th Street', 'Chicago'       , 'IL', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 2)
    ,(43, 1, 11, '2006-03-24', NULL        , 3, 'Peter Krschne'         , '123 11th Street', 'Miami'         , 'FL', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(44, 1, 1 , '2006-03-24', NULL        , NULL, 'Anna Bedecs'        , '123 1st Street' , 'Seattle'       , 'WA', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(45, 1, 28, '2006-04-07', '2006-04-07', 3, 'Amritansh Raghav'      , '789 28th Street', 'Memphis'       , 'TN', '99999', 'USA', 40 , 0, 'Credit Card', '2006-04-07', NULL, 0, NULL, 3)
    ,(46, 7, 9 , '2006-04-05', '2006-04-05', 1, 'Sven Mortensen'        , '123 9th Street' , 'Salt Lake City', 'UT', '99999', 'USA', 100, 0, 'Check'      , '2006-04-05', NULL, 0, NULL, 3)
    ,(47, 6, 6 , '2006-04-08', '2006-04-08', 2, 'Francisco Pérez-Olaeta', '123 6th Street' , 'Milwaukee'     , 'WI', '99999', 'USA', 300, 0, 'Credit Card', '2006-04-08', NULL, 0, NULL, 3)
    ,(48, 4, 8 , '2006-04-05', '2006-04-05', 2, 'Elizabeth Andersen'    , '123 8th Street' , 'Portland'      , 'OR', '99999', 'USA', 50 , 0, 'Check'      , '2006-04-05', NULL, 0, NULL, 3)
    ,(50, 9, 25, '2006-04-05', '2006-04-05', 1, 'John Rodman'           , '789 25th Street', 'Chicago'       , 'IL', '99999', 'USA', 5  , 0, 'Cash', '2006-04-05', NULL, 0, NULL, 3)
    ,(51, 9, 26, '2006-04-05', '2006-04-05', 3, 'Run Liu'               , '789 26th Street', 'Miami'         , 'FL', '99999', 'USA', 60 , 0, 'Credit Card', '2006-04-05', NULL, 0, NULL, 3)
    ,(55, 1, 29, '2006-04-05', '2006-04-05', 2, 'Soo Jung Lee'          , '789 29th Street', 'Denver'        , 'CO', '99999', 'USA', 200, 0, 'Check'      , '2006-04-05', NULL, 0, NULL, 3)
    ,(56, 2, 6 , '2006-04-03', '2006-04-03', 3, 'Francisco Pérez-Olaeta', '123 6th Street' , 'Milwaukee'     , 'WI', '99999', 'USA', 0  , 0, 'Check'      , '2006-04-03', NULL, 0, NULL, 3)
    ,(57, 9, 27, '2006-04-22', '2006-04-22', 2, 'Karen Toh'             , '789 27th Street', 'Las Vegas'     , 'NV', '99999', 'USA', 200, 0, 'Check'      , '2006-04-22', NULL, 0, NULL, 0)
    ,(58, 3, 4 , '2006-04-22', '2006-04-22', 1, 'Christina Lee'         , '123 4th Street' , 'New York'      , 'NY', '99999', 'USA', 5  , 0, 'Credit Card', '2006-04-22', NULL, 0, NULL, 3)
    ,(59, 4, 12, '2006-04-22', '2006-04-22', 2, 'John Edwards'          , '123 12th Street', 'Las Vegas'     , 'NV', '99999', 'USA', 5  , 0, 'Credit Card', '2006-04-22', NULL, 0, NULL, 0)
    ,(60, 6, 8 , '2006-04-30', '2006-04-30', 3, 'Elizabeth Andersen'    , '123 8th Street' , 'Portland'      , 'OR', '99999', 'USA', 50 , 0, 'Credit Card', '2006-04-30', NULL, 0, NULL, 3)
    ,(61, 9, 4 , '2006-04-07', '2006-04-07', 3, 'Christina Lee'         , '123 4th Street' , 'New York'      , 'NY', '99999', 'USA', 4  , 0, 'Check'      , '2006-04-07', NULL, 0, NULL, 0)
    ,(62, 3, 29, '2006-04-12', '2006-04-12', 2, 'Soo Jung Lee'          , '789 29th Street', 'Denver'        , 'CO', '99999', 'USA', 7  , 0, 'Check'      , '2006-04-12', NULL, 0, NULL, 0)
    ,(63, 4, 3 , '2006-04-25', '2006-04-25', 2, 'Thomas Axen'           , '123 3rd Street' , 'Los Angelas'   , 'CA', '99999', 'USA', 7  , 0, 'Cash', '2006-04-25', NULL, 0, NULL, 3)
    ,(64, 8, 6 , '2006-05-09', '2006-05-09', 2, 'Francisco Pérez-Olaeta', '123 6th Street' , 'Milwaukee'     , 'WI', '99999', 'USA', 12 , 0, 'Credit Card', '2006-05-09', NULL, 0, NULL, 0)
    ,(65, 9, 28, '2006-05-11', '2006-05-11', 3, 'Amritansh Raghav'      , '789 28th Street', 'Memphis'       , 'TN', '99999', 'USA', 10 , 0, 'Check'      , '2006-05-11', NULL, 0, NULL, 0)
    ,(66, 3, 8 , '2006-05-24', '2006-05-24', 3, 'Elizabeth Andersen'    , '123 8th Street' , 'Portland'      , 'OR', '99999', 'USA', 5  , 0, 'Check'      , '2006-05-24', NULL, 0, NULL, 0)
    ,(67, 4, 10, '2006-05-24', '2006-05-24', 2, 'Roland Wacker'         , '123 10th Street', 'Chicago'       , 'IL', '99999', 'USA', 9  , 0, 'Credit Card', '2006-05-24', NULL, 0, NULL, 3)
    ,(68, 1, 7 , '2006-05-24', NULL        , NULL, 'Ming-Yang Xie'      , '123 7th Street' , 'Boise'         , 'ID', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(69, 1, 10, '2006-05-24', NULL        , 1, 'Roland Wacker'         , '123 10th Street', 'Chicago'       , 'IL', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(70, 1, 11, '2006-05-24', NULL        , 3, 'Peter Krschne'         , '123 11th Street', 'Miami'         , 'FL', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(71, 1, 1 , '2006-05-24', NULL        , 3, 'Anna Bedecs'           , '123 1st Street' , 'Seattle'       , 'WA', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(72, 1, 28, '2006-06-07', '2006-06-07', 3, 'Amritansh Raghav'      , '789 28th Street', 'Memphis'       , 'TN', '99999', 'USA', 40 , 0, 'Credit Card', '2006-06-07', NULL, 0, NULL, 3)
    ,(73, 7, 9 , '2006-06-05', '2006-06-05', 1, 'Sven Mortensen'        , '123 9th Street' , 'Salt Lake City', 'UT', '99999', 'USA', 100, 0, 'Check'      , '2006-06-05', NULL, 0, NULL, 3)
    ,(74, 6, 6 , '2006-06-08', '2006-06-08', 2, 'Francisco Pérez-Olaeta', '123 6th Street' , 'Milwaukee'     , 'WI', '99999', 'USA', 300, 0, 'Credit Card', '2006-06-08', NULL, 0, NULL, 3)
    ,(75, 4, 8 , '2006-06-05', '2006-06-05', 2, 'Elizabeth Andersen'    , '123 8th Street' , 'Portland'      , 'OR', '99999', 'USA', 50 , 0, 'Check'      , '2006-06-05', NULL, 0, NULL, 3)
    ,(76, 9, 25, '2006-06-05', '2006-06-05', 1, 'John Rodman'           , '789 25th Street', 'Chicago'       , 'IL', '99999', 'USA', 5  , 0, 'Cash', '2006-06-05', NULL, 0, NULL, 3)
    ,(77, 9, 26, '2006-06-05', '2006-06-05', 3, 'Run Liu'               , '789 26th Street', 'Miami'         , 'FL', '99999', 'USA', 60 , 0, 'Credit Card', '2006-06-05', NULL, 0, NULL, 3)
    ,(78, 1, 29, '2006-06-05', '2006-06-05', 2, 'Soo Jung Lee'          , '789 29th Street', 'Denver'        , 'CO', '99999', 'USA', 200, 0, 'Check'      , '2006-06-05', NULL, 0, NULL, 3)
    ,(79, 2, 6 , '2006-06-23', '2006-06-23', 3, 'Francisco Pérez-Olaeta', '123 6th Street' , 'Milwaukee'     , 'WI', '99999', 'USA', 0  , 0, 'Check'      , '2006-06-23', NULL, 0, NULL, 3)
    ,(80, 2, 4 , '2006-04-25', NULL        , NULL, 'Christina Lee'      , '123 4th Street' , 'New York'      , 'NY', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0)
    ,(81, 2, 3 , '2006-04-25', NULL        , NULL, 'Thomas Axen'        , '123 3rd Street' , 'Los Angelas'   , 'CA', '99999', 'USA', 0  , 0, NULL, NULL, NULL, 0, NULL, 0);


/* order_details */
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES 
     (27, 30, 34, 100, 14    , 0, 2, NULL, 96  , 83)
    ,(28, 30, 80, 30 , 3.5   , 0, 2, NULL, NULL, 63)
    ,(29, 31, 7 , 10 , 30    , 0, 2, NULL, NULL, 64)
    ,(30, 31, 51, 10 , 53    , 0, 2, NULL, NULL, 65)
    ,(31, 31, 80, 10 , 3.5   , 0, 2, NULL, NULL, 66)
    ,(32, 32, 1 , 15 , 18    , 0, 2, NULL, NULL, 67)
    ,(33, 32, 43, 20 , 46    , 0, 2, NULL, NULL, 68)
    ,(34, 33, 19, 30 , 9.2   , 0, 2, NULL, 97  , 81)
    ,(35, 34, 19, 20 , 9.2   , 0, 2, NULL, NULL, 69)
    ,(36, 35, 48, 10 , 12.75 , 0, 2, NULL, NULL, 70)
    ,(37, 36, 41, 200, 9.65  , 0, 2, NULL, 98  , 79)
    ,(38, 37, 8 , 17 , 40    , 0, 2, NULL, NULL, 71)
    ,(39, 38, 43, 300, 46    , 0, 2, NULL, 99  , 77)
    ,(40, 39, 48, 100, 12.75 , 0, 2, NULL, 100 , 75)
    ,(41, 40, 81, 200, 2.99  , 0, 2, NULL, 101 , 73)
    ,(42, 41, 43, 300, 46    , 0, 1, NULL, 102 , 104)
    ,(43, 42, 6 , 10 , 25    , 0, 2, NULL, NULL, 84)
    ,(44, 42, 4 , 10 , 22    , 0, 2, NULL, NULL, 85)
    ,(45, 42, 19, 10 , 9.2   , 0, 2, NULL, 103 , 110)
    ,(46, 43, 80, 20 , 3.5   , 0, 1, NULL, NULL, 86)
    ,(47, 43, 81, 50 , 2.99  , 0, 1, NULL, NULL, 87)
    ,(48, 44, 1 , 25 , 18    , 0, 1, NULL, NULL, 88)
    ,(49, 44, 43, 25 , 46    , 0, 1, NULL, NULL, 89)
    ,(50, 44, 81, 25 , 2.99  , 0, 1, NULL, NULL, 90)
    ,(51, 45, 41, 50 , 9.65  , 0, 2, NULL, 104 , 116)
    ,(52, 45, 40, 50 , 18.4  , 0, 2, NULL, NULL, 91)
    ,(53, 46, 57, 100, 19.5  , 0, 2, NULL, 105 , 101)
    ,(54, 46, 72, 50 , 34.8  , 0, 2, NULL, 106 , 114)
    ,(55, 47, 34, 300, 14    , 0, 2, NULL, 107 , 108)
    ,(56, 48, 8 , 25 , 40    , 0, 2, NULL, 108 , 106)
    ,(57, 48, 19, 25 , 9.2   , 0, 2, NULL, 109 , 112)
    ,(59, 50, 21, 20 , 10    , 0, 2, NULL, NULL, 92)
    ,(60, 51, 5 , 25 , 21.35 , 0, 2, NULL, NULL, 93)
    ,(61, 51, 41, 30 , 9.65  , 0, 2, NULL, NULL, 94)
    ,(62, 51, 40, 30 , 18.4  , 0, 2, NULL, NULL, 95)
    ,(66, 56, 48, 10 , 12.75 , 0, 2, NULL, 111 , 99)
    ,(67, 55, 34, 87 , 14    , 0, 2, NULL, NULL, 117)
    ,(68, 79, 7 , 30 , 30    , 0, 2, NULL, NULL, 119)
    ,(69, 79, 51, 30 , 53    , 0, 2, NULL, NULL, 118)
    ,(70, 78, 17, 40 , 39    , 0, 2, NULL, NULL, 120)
    ,(71, 77, 6 , 90 , 25    , 0, 2, NULL, NULL, 121)
    ,(72, 76, 4 , 30 , 22    , 0, 2, NULL, NULL, 122)
    ,(73, 75, 48, 40 , 12.75 , 0, 2, NULL, NULL, 123)
    ,(74, 74, 48, 40 , 12.75 , 0, 2, NULL, NULL, 124)
    ,(75, 73, 41, 10 , 9.65  , 0, 2, NULL, NULL, 125)
    ,(76, 72, 43, 5  , 46    , 0, 2, NULL, NULL, 126)
    ,(77, 71, 40, 40 , 18.4  , 0, 2, NULL, NULL, 127)
    ,(78, 70, 8 , 20 , 40    , 0, 2, NULL, NULL, 128)
    ,(79, 69, 80, 15 , 3.5   , 0, 2, NULL, NULL, 129)
    ,(80, 67, 74, 20 , 10    , 0, 2, NULL, NULL, 130)
    ,(81, 60, 72, 40 , 34.8  , 0, 2, NULL, NULL, 131)
    ,(82, 63, 3 , 50 , 10    , 0, 2, NULL, NULL, 132)
    ,(83, 63, 8 , 3  , 40    , 0, 2, NULL, NULL, 133)
    ,(84, 58, 20, 40 , 81    , 0, 2, NULL, NULL, 134)
    ,(85, 58, 52, 40 , 7     , 0, 2, NULL, NULL, 135)
    ,(86, 80, 56, 10 , 38    , 0, 1, NULL, NULL, 136)
    ,(90, 81, 81, 0  , 2.99  , 0, 5, NULL, NULL, NULL)
    ,(91, 81, 56, 0  , 38    , 0, 0, NULL, NULL, NULL);
/*  End of order_details */

/*  purchase_orders */
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES 
     (90,  1, 2, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-01-22', 2)
    ,(91,  3, 2, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-01-22', 2)
    ,(92,  2, 2, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-01-22', 2)
    ,(93,  5, 2, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-01-22', 2)
    ,(94,  6, 2, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-01-22', 2)
    ,(95,  4, 2, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-01-22', 2)
    ,(96,  1, 5, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #30', 2, '2006-01-22', 5)
    ,(97,  2, 7, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #33', 2, '2006-01-22', 7)
    ,(98,  2, 4, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #36', 2, '2006-01-22', 4)
    ,(99,  1, 3, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #38', 2, '2006-01-22', 3)
    ,(100, 2, 9, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #39', 2, '2006-01-22', 9)
    ,(101, 1, 2, '2006-01-14', '2006-01-22', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #40', 2, '2006-01-22', 2)
    ,(102, 1, 1, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #41', 2, '2006-04-04', 1)
    ,(103, 2, 1, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #42', 2, '2006-04-04', 1)
    ,(104, 2, 1, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #45', 2, '2006-04-04', 1)
    ,(105, 5, 7, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, 'Check'      , 'Purchase generated based on Order #46', 2, '2006-04-04', 7)
    ,(106, 6, 7, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #46', 2, '2006-04-04', 7)
    ,(107, 1, 6, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #47', 2, '2006-04-04', 6)
    ,(108, 2, 4, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #48', 2, '2006-04-04', 4)
    ,(109, 2, 4, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #48', 2, '2006-04-04', 4)
    ,(110, 1, 3, '2006-03-24', '2006-03-24', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #49', 2, '2006-04-04', 3)
    ,(111, 1, 2, '2006-03-31', '2006-03-31', 2, NULL, 0, 0, NULL, 0, NULL, 'Purchase generated based on Order #56', 2, '2006-04-04', 2)
    ,(140, 6, 7, '2006-04-25', '2006-04-25', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-04-25 16', 2)
    ,(141, 8, 7, '2006-04-25', '2006-04-25', 2, NULL, 0, 0, NULL, 0, NULL, NULL, 2, '2006-04-25 17', 2)
    ,(142, 8, 3, '2006-04-25', '2006-04-25', 2, NULL, 0, 0, NULL, 0, 'Check'      , NULL, 2, '2006-04-25 17', 2)
    ,(146, 2, 2, '2006-04-26', '2006-04-26', 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 2)
    ,(147, 7, 2, '2006-04-26', '2006-04-26', 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 2)
    ,(148, 5, 2, '2006-04-26', '2006-04-26', 1, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, 2);
/* end of purchase_orders; */


/* inventory_transactions */
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES 
     (35 , 1, '2006-03-22', '2006-03-22', 80, 75 , NULL, NULL, NULL)
    ,(36 , 1, '2006-03-22', '2006-03-22', 72, 40 , NULL, NULL, NULL)
    ,(37 , 1, '2006-03-22', '2006-03-22', 52, 100, NULL, NULL, NULL)
    ,(38 , 1, '2006-03-22', '2006-03-22', 56, 120, NULL, NULL, NULL)
    ,(39 , 1, '2006-03-22', '2006-03-22', 57, 80 , NULL, NULL, NULL)
    ,(40 , 1, '2006-03-22', '2006-03-22', 6 , 100, NULL, NULL, NULL)
    ,(41 , 1, '2006-03-22', '2006-03-22', 7 , 40 , NULL, NULL, NULL)
    ,(42 , 1, '2006-03-22', '2006-03-22', 8 , 40 , NULL, NULL, NULL)
    ,(43 , 1, '2006-03-22', '2006-03-22', 14, 40 , NULL, NULL, NULL)
    ,(44 , 1, '2006-03-22', '2006-03-22', 17, 40 , NULL, NULL, NULL)
    ,(45 , 1, '2006-03-22', '2006-03-22', 19, 20 , NULL, NULL, NULL)
    ,(46 , 1, '2006-03-22', '2006-03-22', 20, 40 , NULL, NULL, NULL)
    ,(47 , 1, '2006-03-22', '2006-03-22', 21, 20 , NULL, NULL, NULL)
    ,(48 , 1, '2006-03-22', '2006-03-22', 40, 120, NULL, NULL, NULL)
    ,(49 , 1, '2006-03-22', '2006-03-22', 41, 40 , NULL, NULL, NULL)
    ,(50 , 1, '2006-03-22', '2006-03-22', 48, 100, NULL, NULL, NULL)
    ,(51 , 1, '2006-03-22', '2006-03-22', 51, 40 , NULL, NULL, NULL)
    ,(52 , 1, '2006-03-22', '2006-03-22', 74, 20 , NULL, NULL, NULL)
    ,(53 , 1, '2006-03-22', '2006-03-22', 77, 60 , NULL, NULL, NULL)
    ,(54 , 1, '2006-03-22', '2006-03-22', 3 , 100, NULL, NULL, NULL)
    ,(55 , 1, '2006-03-22', '2006-03-22', 4 , 40 , NULL, NULL, NULL)
    ,(56 , 1, '2006-03-22', '2006-03-22', 5 , 40 , NULL, NULL, NULL)
    ,(57 , 1, '2006-03-22', '2006-03-22', 65, 40 , NULL, NULL, NULL)
    ,(58 , 1, '2006-03-22', '2006-03-22', 66, 80 , NULL, NULL, NULL)
    ,(59 , 1, '2006-03-22', '2006-03-22', 1 , 40 , NULL, NULL, NULL)
    ,(60 , 1, '2006-03-22', '2006-03-22', 34, 60 , NULL, NULL, NULL)
    ,(61 , 1, '2006-03-22', '2006-03-22', 43, 100, NULL, NULL, NULL)
    ,(62 , 1, '2006-03-22', '2006-03-22', 81, 125, NULL, NULL, NULL)
    ,(63 , 2, '2006-03-22', '2006-03-24', 80, 30 , NULL, NULL, NULL)
    ,(64 , 2, '2006-03-22', '2006-03-22', 7 , 10 , NULL, NULL, NULL)
    ,(65 , 2, '2006-03-22', '2006-03-22', 51, 10 , NULL, NULL, NULL)
    ,(66 , 2, '2006-03-22', '2006-03-22', 80, 10 , NULL, NULL, NULL)
    ,(67 , 2, '2006-03-22', '2006-03-22', 1 , 15 , NULL, NULL, NULL)
    ,(68 , 2, '2006-03-22', '2006-03-22', 43, 20 , NULL, NULL, NULL)
    ,(69 , 2, '2006-03-22', '2006-03-24', 19, 20 , NULL, NULL, NULL)
    ,(70 , 2, '2006-03-22', '2006-03-24', 48, 10 , NULL, NULL, NULL)
    ,(71 , 2, '2006-03-22', '2006-03-24', 8 , 17 , NULL, NULL, NULL)
    ,(72 , 1, '2006-03-24', '2006-03-24', 81, 200, NULL, NULL, NULL)
    ,(73 , 2, '2006-03-24', '2006-03-24', 81, 200, NULL, NULL, 'Fill Back Ordered product, Order #40')
    ,(74 , 1, '2006-03-24', '2006-03-24', 48, 100, NULL, NULL, NULL)
    ,(75 , 2, '2006-03-24', '2006-03-24', 48, 100, NULL, NULL, 'Fill Back Ordered product, Order #39')
    ,(76 , 1, '2006-03-24', '2006-03-24', 43, 300, NULL, NULL, NULL)
    ,(77 , 2, '2006-03-24', '2006-03-24', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #38')
    ,(78 , 1, '2006-03-24', '2006-03-24', 41, 200, NULL, NULL, NULL)
    ,(79 , 2, '2006-03-24', '2006-03-24', 41, 200, NULL, NULL, 'Fill Back Ordered product, Order #36')
    ,(80 , 1, '2006-03-24', '2006-03-24', 19, 30 , NULL, NULL, NULL)
    ,(81 , 2, '2006-03-24', '2006-03-24', 19, 30 , NULL, NULL, 'Fill Back Ordered product, Order #33')
    ,(82 , 1, '2006-03-24', '2006-03-24', 34, 100, NULL, NULL, NULL)
    ,(83 , 2, '2006-03-24', '2006-03-24', 34, 100, NULL, NULL, 'Fill Back Ordered product, Order #30')
    ,(84 , 2, '2006-03-24', '2006-04-04', 6 , 10 , NULL, NULL, NULL)
    ,(85 , 2, '2006-03-24', '2006-04-04', 4 , 10 , NULL, NULL, NULL)
    ,(86 , 3, '2006-03-24', '2006-03-24', 80, 20 , NULL, NULL, NULL)
    ,(87 , 3, '2006-03-24', '2006-03-24', 81, 50 , NULL, NULL, NULL)
    ,(88 , 3, '2006-03-24', '2006-03-24', 1 , 25 , NULL, NULL, NULL)
    ,(89 , 3, '2006-03-24', '2006-03-24', 43, 25 , NULL, NULL, NULL)
    ,(90 , 3, '2006-03-24', '2006-03-24', 81, 25 , NULL, NULL, NULL)
    ,(91 , 2, '2006-03-24', '2006-04-04', 40, 50 , NULL, NULL, NULL)
    ,(92 , 2, '2006-03-24', '2006-04-04', 21, 20 , NULL, NULL, NULL)
    ,(93 , 2, '2006-03-24', '2006-04-04', 5 , 25 , NULL, NULL, NULL)
    ,(94 , 2, '2006-03-24', '2006-04-04', 41, 30 , NULL, NULL, NULL)
    ,(95 , 2, '2006-03-24', '2006-04-04', 40, 30 , NULL, NULL, NULL)
    ,(96 , 3, '2006-03-30', '2006-03-30', 34, 12 , NULL, NULL, NULL)
    ,(97 , 3, '2006-03-30', '2006-03-30', 34, 10 , NULL, NULL, NULL)
    ,(98 , 3, '2006-03-30', '2006-03-30', 34, 1  , NULL, NULL, NULL)
    ,(99 , 2, '2006-04-03', '2006-04-03', 48, 10 , NULL, NULL, NULL)
    ,(100, 1, '2006-04-04', '2006-04-04', 57, 100, NULL, NULL, NULL)
    ,(101, 2, '2006-04-04', '2006-04-04', 57, 100, NULL, NULL, 'Fill Back Ordered product, Order #46')
    ,(102, 1, '2006-04-04', '2006-04-04', 34, 50 , NULL, NULL, NULL)
    ,(103, 1, '2006-04-04', '2006-04-04', 43, 250, NULL, NULL, NULL)
    ,(104, 3, '2006-04-04', '2006-04-04', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #41')
    ,(105, 1, '2006-04-04', '2006-04-04', 8 , 25 , NULL, NULL, NULL)
    ,(106, 2, '2006-04-04', '2006-04-04', 8 , 25 , NULL, NULL, 'Fill Back Ordered product, Order #48')
    ,(107, 1, '2006-04-04', '2006-04-04', 34, 300, NULL, NULL, NULL)
    ,(108, 2, '2006-04-04', '2006-04-04', 34, 300, NULL, NULL, 'Fill Back Ordered product, Order #47')
    ,(109, 1, '2006-04-04', '2006-04-04', 19, 25 , NULL, NULL, NULL)
    ,(110, 2, '2006-04-04', '2006-04-04', 19, 10 , NULL, NULL, 'Fill Back Ordered product, Order #42')
    ,(111, 1, '2006-04-04', '2006-04-04', 19, 10 , NULL, NULL, NULL)
    ,(112, 2, '2006-04-04', '2006-04-04', 19, 25 , NULL, NULL, 'Fill Back Ordered product, Order #48')
    ,(113, 1, '2006-04-04', '2006-04-04', 72, 50 , NULL, NULL, NULL)
    ,(114, 2, '2006-04-04', '2006-04-04', 72, 50 , NULL, NULL, 'Fill Back Ordered product, Order #46')
    ,(115, 1, '2006-04-04', '2006-04-04', 41, 50 , NULL, NULL, NULL)
    ,(116, 2, '2006-04-04', '2006-04-04', 41, 50 , NULL, NULL, 'Fill Back Ordered product, Order #45')
    ,(117, 2, '2006-04-04', '2006-04-04', 34, 87 , NULL, NULL, NULL)
    ,(118, 2, '2006-04-04', '2006-04-04', 51, 30 , NULL, NULL, NULL)
    ,(119, 2, '2006-04-04', '2006-04-04', 7 , 30 , NULL, NULL, NULL)
    ,(120, 2, '2006-04-04', '2006-04-04', 17, 40 , NULL, NULL, NULL)
    ,(121, 2, '2006-04-04', '2006-04-04', 6 , 90 , NULL, NULL, NULL)
    ,(122, 2, '2006-04-04', '2006-04-04', 4 , 30 , NULL, NULL, NULL)
    ,(123, 2, '2006-04-04', '2006-04-04', 48, 40 , NULL, NULL, NULL)
    ,(124, 2, '2006-04-04', '2006-04-04', 48, 40 , NULL, NULL, NULL)
    ,(125, 2, '2006-04-04', '2006-04-04', 41, 10 , NULL, NULL, NULL)
    ,(126, 2, '2006-04-04', '2006-04-04', 43, 5  , NULL, NULL, NULL)
    ,(127, 2, '2006-04-04', '2006-04-04', 40, 40 , NULL, NULL, NULL)
    ,(128, 2, '2006-04-04', '2006-04-04', 8 , 20 , NULL, NULL, NULL)
    ,(129, 2, '2006-04-04', '2006-04-04', 80, 15 , NULL, NULL, NULL)
    ,(130, 2, '2006-04-04', '2006-04-04', 74, 20 , NULL, NULL, NULL)
    ,(131, 2, '2006-04-04', '2006-04-04', 72, 40 , NULL, NULL, NULL)
    ,(132, 2, '2006-04-04', '2006-04-04', 3 , 50 , NULL, NULL, NULL)
    ,(133, 2, '2006-04-04', '2006-04-04', 8 , 3  , NULL, NULL, NULL)
    ,(134, 2, '2006-04-04', '2006-04-04', 20, 40 , NULL, NULL, NULL)
    ,(135, 2, '2006-04-04', '2006-04-04', 52, 40 , NULL, NULL, NULL)
    ,(136, 3, '2006-04-25', '2006-04-25', 56, 110, NULL, NULL, NULL);
/* End of inventory_transactions */


/* purchase_order_details  */
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES 
     (238, 90 , 1 , 40 , 14, '2006-01-22', 1, 59)
    ,(239, 91 , 3 , 100, 8 , '2006-01-22', 1, 54)
    ,(240, 91 , 4 , 40 , 16, '2006-01-22', 1, 55)
    ,(241, 91 , 5 , 40 , 16, '2006-01-22', 1, 56)
    ,(242, 92 , 6 , 100, 19, '2006-01-22', 1, 40)
    ,(243, 92 , 7 , 40 , 22, '2006-01-22', 1, 41)
    ,(244, 92 , 8 , 40 , 30, '2006-01-22', 1, 42)
    ,(245, 92 , 14, 40 , 17, '2006-01-22', 1, 43)
    ,(246, 92 , 17, 40 , 29, '2006-01-22', 1, 44)
    ,(247, 92 , 19, 20 , 7 , '2006-01-22', 1, 45)
    ,(248, 92 , 20, 40 , 61, '2006-01-22', 1, 46)
    ,(249, 92 , 21, 20 , 8 , '2006-01-22', 1, 47)
    ,(250, 90 , 34, 60 , 10, '2006-01-22', 1, 60)
    ,(251, 92 , 40, 120, 14, '2006-01-22', 1, 48)
    ,(252, 92 , 41, 40 , 7 , '2006-01-22', 1, 49)
    ,(253, 90 , 43, 100, 34, '2006-01-22', 1, 61)
    ,(254, 92 , 48, 100, 10, '2006-01-22', 1, 50)
    ,(255, 92 , 51, 40 , 40, '2006-01-22', 1, 51)
    ,(256, 93 , 52, 100, 5,  '2006-01-22', 1, 37)
    ,(257, 93 , 56, 120, 28, '2006-01-22', 1, 38)
    ,(258, 93 , 57, 80 , 15, '2006-01-22', 1, 39)
    ,(259, 91 , 65, 40 , 16, '2006-01-22', 1, 57)
    ,(260, 91 , 66, 80 , 13, '2006-01-22', 1, 58)
    ,(261, 94 , 72, 40 , 26, '2006-01-22', 1, 36)
    ,(262, 92 , 74, 20 , 8,  '2006-01-22', 1, 52)
    ,(263, 92 , 77, 60 , 10, '2006-01-22', 1, 53)
    ,(264, 95 , 80, 75 , 3 , '2006-01-22', 1, 35)
    ,(265, 90 , 81, 125, 2 , '2006-01-22', 1, 62)
    ,(266, 96 , 34, 100, 10, '2006-01-22', 1, 82)
    ,(267, 97 , 19, 30 , 7 , '2006-01-22', 1, 80)
    ,(268, 98 , 41, 200, 7 , '2006-01-22', 1, 78)
    ,(269, 99 , 43, 300, 34, '2006-01-22', 1, 76)
    ,(270, 100, 48, 100, 10, '2006-01-22', 1, 74)
    ,(271, 101, 81, 200, 2 , '2006-01-22', 1, 72)
    ,(272, 102, 43, 300, 34, NULL, 0, NULL)
    ,(273, 103, 19, 10 , 7 , '2006-04-17', 1, 111)
    ,(274, 104, 41, 50 , 7 , '2006-04-06', 1, 115)
    ,(275, 105, 57, 100, 15, '2006-04-05', 1, 100)
    ,(276, 106, 72, 50 , 26, '2006-04-05', 1, 113)
    ,(277, 107, 34, 300, 10, '2006-04-05', 1, 107)
    ,(278, 108, 8 , 25 , 30, '2006-04-05', 1, 105)
    ,(279, 109, 19, 25 , 7 , '2006-04-05', 1, 109)
    ,(280, 110, 43, 250, 34, '2006-04-10', 1, 103)
    ,(281, 90 , 1 , 40 , 14, NULL, 0, NULL)
    ,(282, 92 , 19, 20 , 7 , NULL, 0, NULL)
    ,(283, 111, 34, 50 , 10, '2006-04-04', 1, 102)
    ,(285, 91 , 3 , 50 , 8 , NULL, 0, NULL)
    ,(286, 91 , 4 , 40 , 16, NULL, 0, NULL)
    ,(288, 140, 85, 10 , 9 , NULL, 0, NULL)
    ,(289, 141, 6 , 10 , 18.75, NULL, 0, NULL)
    ,(290, 142, 1 , 1  , 13.5, NULL, 0, NULL)
    ,(292, 146, 20, 40 , 60, NULL, 0, NULL)
    ,(293, 146, 51, 40 , 39, NULL, 0, NULL)
    ,(294, 147, 40, 120, 13, NULL, 0, NULL)
    ,(295, 148, 72, 40 , 26, NULL, 0, NULL);
/* purchase_order_details */

/* invoices */
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES 
     (5 , 31, '2006-03-22', NULL, 0, 0, 0)
    ,(6 , 32, '2006-03-22', NULL, 0, 0, 0)
    ,(7 , 40, '2006-03-24', NULL, 0, 0, 0)
    ,(8 , 39, '2006-03-24', NULL, 0, 0, 0)
    ,(9 , 38, '2006-03-24', NULL, 0, 0, 0)
    ,(10, 37, '2006-03-24', NULL, 0, 0, 0)
    ,(11, 36, '2006-03-24', NULL, 0, 0, 0)
    ,(12, 35, '2006-03-24', NULL, 0, 0, 0)
    ,(13, 34, '2006-03-24', NULL, 0, 0, 0)
    ,(14, 33, '2006-03-24', NULL, 0, 0, 0)
    ,(15, 30, '2006-03-24', NULL, 0, 0, 0)
    ,(16, 56, '2006-04-03', NULL, 0, 0, 0)
    ,(17, 55, '2006-04-04', NULL, 0, 0, 0)
    ,(18, 51, '2006-04-04', NULL, 0, 0, 0)
    ,(19, 50, '2006-04-04', NULL, 0, 0, 0)
    ,(20, 48, '2006-04-04', NULL, 0, 0, 0)
    ,(21, 47, '2006-04-04', NULL, 0, 0, 0)
    ,(22, 46, '2006-04-04', NULL, 0, 0, 0)
    ,(23, 45, '2006-04-04', NULL, 0, 0, 0)
    ,(24, 79, '2006-04-04', NULL, 0, 0, 0)
    ,(25, 78, '2006-04-04', NULL, 0, 0, 0)
    ,(26, 77, '2006-04-04', NULL, 0, 0, 0)
    ,(27, 76, '2006-04-04', NULL, 0, 0, 0)
    ,(28, 75, '2006-04-04', NULL, 0, 0, 0)
    ,(29, 74, '2006-04-04', NULL, 0, 0, 0)
    ,(30, 73, '2006-04-04', NULL, 0, 0, 0)
    ,(31, 72, '2006-04-04', NULL, 0, 0, 0)
    ,(32, 71, '2006-04-04', NULL, 0, 0, 0)
    ,(33, 70, '2006-04-04', NULL, 0, 0, 0)
    ,(34, 69, '2006-04-04', NULL, 0, 0, 0)
    ,(35, 67, '2006-04-04', NULL, 0, 0, 0)
    ,(36, 42, '2006-04-04', NULL, 0, 0, 0)
    ,(37, 60, '2006-04-04', NULL, 0, 0, 0)
    ,(38, 63, '2006-04-04', NULL, 0, 0, 0)
    ,(39, 58, '2006-04-04', NULL, 0, 0, 0);
/* end of invoices */

/* strings */
INSERT INTO `strings` (`string_id`, `string_data`) VALUES 
     (2 , 'Northwind Traders')
    ,(3 , 'Cannot remove posted inventory!')
    ,(4 , 'Back ordered product filled for Order #|')
    ,(5 , 'Discounted price below cost!')
    ,(6 , 'Insufficient inventory.')
    ,(7 , 'Insufficient inventory. Do you want to create a purchase order?')
    ,(8 , 'Purchase orders were successfully created for | products')
    ,(9 , 'There are no products below their respective reorder levels')
    ,(10, 'Must specify customer name!')
    ,(11, 'Restocking will generate purchase orders for all products below desired inventory levels.  Do you want to continue?')
    ,(12, 'Cannot create purchase order.  No suppliers listed for specified product')
    ,(13, 'Discounted price is below cost!')
    ,(14, 'Do you want to continue?')
    ,(15, 'Order is already invoiced. Do you want to print the invoice?')
    ,(16, 'Order does not contain any line items')
    ,(17, 'Cannot create invoice!  Inventory has not been allocated for each specified product.')
    ,(18, 'Sorry, there are no sales in the specified time period')
    ,(19, 'Product successfully restocked.')
    ,(21, 'Product does not need restocking! Product is already at desired inventory level.')
    ,(22, 'Product restocking failed!')
    ,(23, 'Invalid login specified!')
    ,(24, 'Must first select reported!')
    ,(25, 'Changing supplier will remove purchase line items, continue?')
    ,(26, 'Purchase orders were successfully submitted for | products.  Do you want to view the restocking report?')
    ,(27, 'There was an error attempting to restock inventory levels.')
    ,(28, '| product(s) were successfully restocked.  Do you want to view the restocking report?')
    ,(29, 'You cannot remove purchase line items already posted to inventory!')
    ,(30, 'There was an error removing one or more purchase line items.')
    ,(31, 'You cannot modify quantity for purchased product already received or posted to inventory.')
    ,(32, 'You cannot modify price for purchased product already received or posted to inventory.')
    ,(33, 'Product has been successfully posted to inventory.')
    ,(34, 'Sorry, product cannot be successfully posted to inventory.')
    ,(35, 'There are orders with this product on back order.  Would you like to fill them now?')
    ,(36, 'Cannot post product to inventory without specifying received date!')
    ,(37, 'Do you want to post received product to inventory?')
    ,(38, 'Initialize purchase, orders, and inventory data?')
    ,(39, 'Must first specify employee name!')
    ,(40, 'Specified user must be logged in to approve purchase!')
    ,(41, 'Purchase order must contain completed line items before it can be approved')
    ,(42, 'Sorry, you do not have permission to approve purchases.')
    ,(43, 'Purchase successfully approved')
    ,(44, 'Purchase cannot be approved')
    ,(45, 'Purchase successfully submitted for approval')
    ,(46, 'Purchase cannot be submitted for approval')
    ,(47, 'Sorry, purchase order does not contain line items')
    ,(48, 'Do you want to cancel this order?')
    ,(49, 'Canceling an order will permanently delete the order.  Are you sure you want to cancel?')
    ,(100, 'Your order was successfully canceled.')
    ,(101, 'Cannot cancel an order that has items received and posted to inventory.')
    ,(102, 'There was an error trying to cancel this order.')
    ,(103, 'The invoice for this order has not yet been created.')
    ,(104, 'Shipping information is not complete.  Please specify all shipping information and try again.')
    ,(105, 'Cannot mark as shipped.  Order must first be invoiced!')
    ,(106, 'Cannot cancel an order that has already shipped!')
    ,(107, 'Must first specify salesperson!')
    ,(108, 'Order is now marked closed.')
    ,(109, 'Order must first be marked shipped before closing.')
    ,(110, 'Must first specify payment information!')
    ,(111, 'There was an error attempting to restock inventory levels.  | product(s) were successfully restocked.')
    ,(112, 'You must supply a Unit Cost.')
    ,(113, 'Fill back ordered product, Order #|')
    ,(114, 'Purchase generated based on Order #|');

