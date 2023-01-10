CREATE TABLE customer_services.promotions (
    promotion_id INT PRIMARY KEY IDENTITY (1, 1),
    promotion_name VARCHAR (255) NOT NULL,
    discount NUMERIC (3, 2) DEFAULT 0,
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
); 

-- insert query for add data in table
INSERT INTO customer_services.promotions (promotion_name,discount,start_date,expired_date)
VALUES('2018 Summer Promotion',0.15,'20180601','20180901');

-- insert multiple data at single time
INSERT INTO customer_services.promotions (promotion_name,discount,start_date,expired_date)
VALUES('2019 Summer Promotion',0.15,'20190601','20190901'),
    ('2019 Fall Promotion',0.20,'20191001','20191101'),
    ('2019 Winter Promotion',0.25,'20191201','20200101');

Select * from customer_services.promotions

-- insert into select
CREATE TABLE customer_services.addresses (
    address_id INT IDENTITY PRIMARY KEY,
    street VARCHAR (255) NOT NULL,
);   
