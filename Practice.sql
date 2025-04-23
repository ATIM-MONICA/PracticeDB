SELECT * FROM sql_hr.employees;
select * from sql_store.customers;
select * from sql_store.customers where city='Hampton';
select * from sql_store.customers where city='Hampton' or 'Chicago';
select * from sql_store.customers where city='Hampton' and 'Chicago';
select * from sql_store.customers where city='Chicago';
select count(*)  from sql_store.customers where city='Chicago';
select * from store.customers;
select * from store.orders;
#Adding primary key but wont happen in this code line coz primary key already exists
ALTER TABLE orders ADD PRIMARY KEY (order_date);
#Dropping primary key
alter table store.orders drop primary key;
#NOT NULL Constraint
ALTER TABLE orders
MODIFY customer_id int NOT NULL;
#Date
SELECT * FROM Orders WHERE Order_date='2008-11-11';
SELECT * FROM Orders WHERE Order_date='2018-06-08';
#Adding unique 
ALTER TABLE orders ADD UNIQUE (order_date);
#Check constraint
ALTER TABLE orders
ADD CHECK (order_date BETWEEN '2018-01-01' AND '2018-12-31');
#Latest order date
SELECT order_date, COUNT(*) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY total_orders DESC
LIMIT 1;
#Earliest order date
SELECT order_date, COUNT(*) AS total_orders
FROM orders
GROUP BY order_date
ORDER BY total_orders ASC
LIMIT 2;
#Recent order date 
SELECT MAX(order_date) AS most_recent_order_date
FROM orders;
#Rows with the most recent date
SELECT *
FROM orders
WHERE order_date = (
    SELECT MAX(order_date) FROM orders
);
#Most 2 recent oreder
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 2;
# 2 Distinct recent date
SELECT o.*
FROM orders o
JOIN (
    SELECT DISTINCT order_date
    FROM orders
    ORDER BY order_date DESC
    LIMIT 2
) AS recent_dates
ON o.order_date = recent_dates.order_date
ORDER BY o.order_date DESC;
#Default constraint on alter table
ALTER TABLE orders
ALTER comments SET DEFAULT 'Well done';
# Default on creating the table
CREATE TABLE orders (
    order_date date DEFAULT (current_date())
);#Will throw error cox table orders already exists
ALTER TABLE orders
ALTER comments drop default;#Dropping the default value
## Inserting a new record though dont have this table person just used to illustrate insert into
INSERT INTO Persons (FirstName,LastName)
VALUES ('Lars','Monsen');
#Auto increment
CREATE TABLE Persons (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);
#An existing table
ALTER TABLE Persons
MODIFY COLUMN ID INT NOT NULL AUTO_INCREMENT;











