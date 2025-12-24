use database documentation_learning;
use schema public;
CREATE OR REPLACE TABLE quarterly_sales(
  empid INT,
  amount INT,
  quarter TEXT)
  AS SELECT * FROM VALUES
    (1, 10000, '2023_Q1'),
    (1, 400, '2023_Q1'),
    (2, 4500, '2023_Q1'),
    (2, 35000, '2023_Q1'),
    (1, 5000, '2023_Q2'),
    (1, 3000, '2023_Q2'),
    (2, 200, '2023_Q2'),
    (2, 90500, '2023_Q2'),
    (1, 6000, '2023_Q3'),
    (1, 5000, '2023_Q3'),
    (2, 2500, '2023_Q3'),
    (2, 9500, '2023_Q3'),
    (3, 2700, '2023_Q3'),
    (1, 8000, '2023_Q4'),
    (1, 10000, '2023_Q4'),
    (2, 800, '2023_Q4'),
    (2, 4500, '2023_Q4'),
    (3, 2700, '2023_Q4'),
    (3, 16000, '2023_Q4'),
    (3, 10200, '2023_Q4');
    SELECT *
  FROM quarterly_sales
    PIVOT(SUM(amount) FOR quarter IN (ANY ORDER BY quarter))
  ORDER BY empid;
  select quarter,empid,sum(amount) from quarterly_sales group by quarter,empid order by 1;
  select * from quarterly_sales pivot(sum(amount) for quarter in (select distinct quarter from quarterly_sales)) order by empid;
  SELECT 'Average sale amount' AS aggregate, *
  FROM quarterly_sales
    PIVOT(AVG(amount) FOR quarter IN (ANY ORDER BY quarter))
UNION
SELECT 'Highest value sale' AS aggregate, *
  FROM quarterly_sales
    PIVOT(MAX(amount) FOR quarter IN (ANY ORDER BY quarter))
UNION
SELECT 'Lowest value sale' AS aggregate, *
  FROM quarterly_sales
    PIVOT(MIN(amount) FOR quarter IN (ANY ORDER BY quarter))
UNION
SELECT 'Number of sales' AS aggregate, *
  FROM quarterly_sales
    PIVOT(COUNT(amount) FOR quarter IN (ANY ORDER BY quarter))
UNION
SELECT 'Total amount' AS aggregate, *
  FROM quarterly_sales
    PIVOT(SUM(amount) FOR quarter IN (ANY ORDER BY quarter))
ORDER BY aggregate, empid;
CREATE OR REPLACE TABLE monthly_sales(
  empid INT,
  dept TEXT,
  jan INT,
  feb INT,
  mar INT,
  apr INT);

INSERT INTO monthly_sales VALUES
  (1, 'electronics', 100, 200, 300, 100),
  (2, 'clothes', 100, 300, 150, 200),
  (3, 'cars', 200, 400, 100, 50),
  (4, 'appliances', 100, NULL, 100, 50);

SELECT * FROM monthly_sales;
select * from monthly_sales unpivot(sales for month in (jan,feb,mar,apr));
//resample
CREATE OR REPLACE TABLE sensor_data_unixtime (device_id VARCHAR(10), unixtime NUMBER(38,0), avg_temp NUMBER(6,4), vibration NUMBER (5,4), motor_rpm INT);

INSERT INTO sensor_data_unixtime VALUES
  ('DEVICE3', 1696150802, 36.1103, 0.4226, 1560),
  ('DEVICE3', 1696150803, 35.2987, 0.4326, 1561),
  ('DEVICE3', 1696150804, 40.0001, 0.3221, 1562),
  ('DEVICE3', 1696150805, 38.0422, 0.3333, 1589),
  ('DEVICE3', 1696150807, 33.1524, 0.4865, 1499),
  ('DEVICE3', 1696150808, 32.0422, 0.4221, 1498),
  ('DEVICE3', 1696150809, 31.1519, 0.4751, 1600),
  ('DEVICE3', 1696150810, 29.1524, 0.4639, 1605),
  ('DEVICE3', 1696150812, 35.2987, 0.4336, 1585),
  ('DEVICE3', 1696150813, 40.0000, 0.4226, 1560)
;
SELECT * FROM sensor_data_unixtime
  RESAMPLE(USING unixtime INCREMENT BY 1) ORDER BY unixtime;
CREATE TABLE sales (
  product_ID INTEGER,
  retail_price REAL,
  quantity INTEGER,
  city VARCHAR,
  state VARCHAR);

INSERT INTO sales (product_id, retail_price, quantity, city, state) VALUES
  (1, 2.00,  1, 'SF', 'CA'),
  (1, 2.00,  2, 'SJ', 'CA'),
  (2, 5.00,  4, 'SF', 'CA'),
  (2, 5.00,  8, 'SJ', 'CA'),
  (2, 5.00, 16, 'Miami', 'FL'),
  (2, 5.00, 32, 'Orlando', 'FL'),
  (2, 5.00, 64, 'SJ', 'PR');

CREATE TABLE products (
  product_ID INTEGER,
  wholesale_price REAL);
INSERT INTO products (product_ID, wholesale_price) VALUES (1, 1.00);
INSERT INTO products (product_ID, wholesale_price) VALUES (2, 2.00);
SELECT product_ID, SUM(retail_price * quantity) AS gross_revenue
  FROM sales
  GROUP BY product_ID;
  select typeof(retail_price) from sales;
  select '03-11-2025'-'01-11-2025';
  select 1.73*2.454545;
  select coalesce(num1,0),num1,* from day1;
  SELECT COALESCE(NULL, NULL, 10, 20) AS result;
  CREATE OR REPLACE TABLE spread_demo (col1 INT, col2 VARCHAR);

INSERT INTO spread_demo VALUES
  (1, 'a'),
  (2, 'b'),
  (3, 'c'),
  (4, 'd'),
  (5, 'e');

SELECT least(col1,0) FROM spread_demo;
show terse tables;
select greatest(** array_column) from array_example;
select v:age from object_palakkam;
create or replace table mallu(v object);
SHOW WAREHOUSES;

SELECT *
  FROM TABLE(RESULT_SCAN(LAST_QUERY_ID(-2)));
  CREATE OR REPLACE TABLE dept_pipe_demo (
  deptno NUMBER(2),
  dname VARCHAR(14),
  loc VARCHAR(13)
  ) AS SELECT * FROM VALUES
     (10, 'ACCOUNTING', 'NEW YORK'),
     (20, 'RESEARCH', 'DALLAS'),
     (30, 'SALES', 'CHICAGO'),
     (40, 'OPERATIONS', 'BOSTON');

CREATE OR REPLACE TABLE emp_pipe_demo (
  empno NUMBER(4),
  ename VARCHAR(10),
  sal NUMBER(7,2),
  deptno NUMBER(2)
  ) AS SELECT * FROM VALUES
    (7369, 'SMITH', 800, 20),
    (7499, 'ALLEN', 1600, 30),
    (7521, 'WARD', 1250, 30),
    (7698, 'BLAKE', 2850, 30),
    (7782, 'CLARK', 2450, 10);
    select *from emp_pipe_demo;
    select * from dept_pipe_demo where dname ='SALES';
    SELECT * FROM dept_pipe_demo WHERE dname = 'SALES'
  ->> SELECT * FROM emp_pipe_demo WHERE sal > 1500 AND deptno IN (SELECT deptno FROM $1)
  ->> SELECT ename, sal FROM $1 ORDER BY 2 DESC;




  select max(num) from day1 ->> select * from day1 where num = (select * from $1)
;
select * from day1 where num =(select max(num) from day1);
select * from values(1,1),(1,2) union all
SELECT *
FROM VALUES
    (1, 2),
    (2, 1),
    (3, 4);
CREATE OR REPLACE TABLE sales_office_postal_example(
  office_name VARCHAR,
  postal_code VARCHAR);

INSERT INTO sales_office_postal_example VALUES ('sales1', '94061');
INSERT INTO sales_office_postal_example VALUES ('sales2', '94070');
INSERT INTO sales_office_postal_example VALUES ('sales3', '98116');
INSERT INTO sales_office_postal_example VALUES ('sales4', '98005');

CREATE OR REPLACE TABLE customer_postal_example(
  customer VARCHAR,
  postal_code VARCHAR);

INSERT INTO customer_postal_example VALUES ('customer1', '94066');
INSERT INTO customer_postal_example VALUES ('customer2', '94061');
INSERT INTO customer_postal_example VALUES ('customer3', '98444');
INSERT INTO customer_postal_example VALUES ('customer4', '98005');
SELECT postal_code FROM sales_office_postal_example
INTERSECT
SELECT postal_code FROM customer_postal_example
ORDER BY postal_code;
SELECT postal_code FROM sales_office_postal_example
except
SELECT postal_code FROM customer_postal_example
ORDER BY postal_code;
select postal_code from sales_office_postal_example union all select postal_code from customer_postal_example;