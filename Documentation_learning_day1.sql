DOCUMENTATION_LEARNING.PUBLIC.DEMONSTRATION1create database documentation_learning;
use database documentation_learning;

create or replace table Day1(
num FLOAT4,
num1 DECFLOAT,
num2 INT,
bool boolean);

insert into day1 values('-inf',2,3,1);
select * from day1;
describe table day1;
insert into day1 values('NaN',2,3.45,0);
CREATE OR REPLACE TABLE decfloat_sample (
  id INT,
  decfloat_val DECFLOAT,
  float_val FLOAT);

INSERT INTO decfloat_sample VALUES
  (
    1,
    DECFLOAT '123e7000',
    FLOAT '123e7000'
  ),
  (
    2,
    12345678901234567890123456789::DECFLOAT,
    12345678901234567890123456789::FLOAT
  ),
  (
    3,
    '-4.2e-5432'::DECFLOAT,
    '-4.2e-5432'::FLOAT
  ),
  (
    4,
    '1.00000000000000000000000000000000000014'::DECFLOAT,
    '1.00000000000000000000000000000000000014'::FLOAT
  ),
  (
    5,
    '1.00000000000000000000000000000000000015'::DECFLOAT,
    '1.00000000000000000000000000000000000015'::FLOAT
  );
  desc table decfloat_sample;
  select 
  * from decfloat_sample;
  CREATE OR REPLACE TABLE demo_binary_hex (b BINARY);
  INSERT INTO demo_binary_hex (b) SELECT TO_BINARY('HELP', 'HEX');
  INSERT INTO demo_binary_hex (b) SELECT TO_BINARY(HEX_ENCODE('HELP'), 'HEX');
  select * from demo_binary_hex;
  select base64_encode('help');
  insert into day1(bool) values('True');
  select * from day1 limit 3;
  SELECT TO_TIME('04:15:29') + INTERVAL '3 hours, 18 minutes';
  

ALTER SESSION SET TIMEZONE = NULL;
select current_date();
SELECT TO_TIMESTAMP('2019-02-2823:59:59 -07:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM');
create or replace table time_tea (id number,time1 timestamp_ltz default current_timestamp());
insert into time_tea(id) values (2);
select * from time_tea;
CREATE OR REPLACE TABLE variant_insert (v VARIANT);
INSERT INTO variant_insert (v)
  SELECT PARSE_JSON('{"key3": "value3", "key4": "value4"}');
SELECT * FROM variant_insert;
select num,num1::string as "str(num1)" from day1;
select num1::boolean from day1;
SELECT PARSE_JSON('{"key3": "value3", "key4": "value4"}');
select v::text from variant_insert;
create or replace table object_palakkam(v object);
insert into object_palakkam SELECT OBJECT_CONSTRUCT(
  'name', 'Jones'::VARIANT,
  'age',  42::VARIANT);
  select * from object_palakkam;
  insert into object_palakkam select {*} from time_tea;
  select * from object_palakkam;
  set var=20;

select $var*20;
select max(id) from decfloat_sample as koduram;
select v[upper('time1')] from object_palakkam; 

insert into object_palakkam(v) select parse_json('{"age":17,"name":"maria"}');
select v['age'] from object_palakkam;
CREATE OR REPLACE TABLE array_example (array_column ARRAY);
INSERT INTO array_example (array_column)
  SELECT ARRAY_CONSTRUCT(12, 'twelve', NULL,'mikeeee');
select array_column[] from array_example;
update array_example set array_column=[1,2,3,4,5,6];


select * from array_example;
CREATE OR REPLACE TABLE demonstration1 (
  ID INTEGER,
  array1 ARRAY,
  variant1 VARIANT,
  object1 OBJECT);

INSERT INTO demonstration1 (id, array1, variant1, object1)
  SELECT
    1,
    ARRAY_CONSTRUCT(1, 2, 3),
    PARSE_JSON(' { "key1": "value1", "key2": "value2" } '),
    PARSE_JSON(' { "outer_key1": { "inner_key1A": "1a", "inner_key1B": "1b" }, '
              ||
               '   "outer_key2": { "inner_key2": 2 } } ');

INSERT INTO demonstration1 (id, array1, variant1, object1)
  SELECT
    2,
    ARRAY_CONSTRUCT(1, 2, 3, NULL),
    PARSE_JSON(' { "key1": "value1", "key2": NULL } '),
    PARSE_JSON(' { "outer_key1": { "inner_key1A": "1a", "inner_key1B": NULL }, '
              ||
                '   "outer_key2": { "inner_key2": 2 } '
              ||
               ' } ');
CREATE OR REPLACE TABLE demonstration1 (
  ID INTEGER,
  array1 ARRAY,
  variant1 VARIANT,
  object1 OBJECT);

INSERT INTO demonstration1 (id, array1, variant1, object1)
  SELECT
    1,
    ARRAY_CONSTRUCT(1, 2, 3),
    PARSE_JSON(' { "key1": "value1", "key2": "value2" } '),
    PARSE_JSON(' { "outer_key1": { "inner_key1A": "1a", "inner_key1B": "1b" }, '
              ||
               '   "outer_key2": { "inner_key2": 2 } } ');

INSERT INTO demonstration1 (id, array1, variant1, object1)
  SELECT
    2,
    ARRAY_CONSTRUCT(1, 2, 3, NULL),
    PARSE_JSON(' { "key1": "value1", "key2": NULL } '),
    PARSE_JSON(' { "outer_key1": { "inner_key1A": "1a", "inner_key1B": NULL }, '
              ||
                '   "outer_key2": { "inner_key2": 2 } '
              ||
               ' } ');
select * from demonstration1;
select current_available_roles();
use role public;
select object1:outer_key2.inner_key2 from demonstration1;
select * from demonstration1;
SELECT
  SYSTEM$TYPEOF(
    [1, 2, 3]::ARRAY(NUMBER)
  ) AS structured_array,
  SYSTEM$TYPEOF(
    [1, 2, 3]
  ) AS semi_structured_array;
  SELECT
  SYSTEM$TYPEOF(
    {
      'str': 'test',
      'num': 1
    }::OBJECT(
      str VARCHAR NOT NULL,
      num NUMBER
    )
  ) AS structured_object,
  SYSTEM$TYPEOF(
    {
      'str': 'test',
      'num': 1
    }
  ) AS semi_structured_object;
  select current_role();
  use role accountadmin;
CREATE OR REPLACE TABLE my_table_with_map_column(my_map MAP(VARCHAR, VARCHAR));
INSERT INTO my_table_with_map_column SELECT
  {'key123': 'value123'}::MAP(VARCHAR, VARCHAR);
  select to_object(my_map) from my_table_with_map_column;
  SELECT MAP_SIZE({'my_key':'my_value'}::MAP(VARCHAR,VARCHAR));
  select * exclude (num) from day1;
  select * replace('hi'||num2::string as num2) from day1 order by 1 asc limit 2;
  set hello=12;
  select $hello*10;
  create or replace table malai(id integer,arr array(number));
  insert into malai(id,arr) values select 1,array_construct(1,2,3);
  
  desc table malai;
  insert into malai(id,arr) values(1,array_construct(1,2,3));
  select * from day1;
  insert into day1(num,num1) values(1,2),(2,3);
  select current_time();
  SHOW TERSE TABLES LIKE 'day1';
  -- select * from day1 at (timestamp=>'2025-12-11 17:25:04.512 -0800'::timestamp_tz);
  SELECT * FROM day1 AT(OFFSET => -60*1440) AS T;
  CREATE OR REPLACE TABLE t1 (
   id number(8) NOT NULL,
   c1 varchar(255) default NULL
 );

-- Enable change tracking on the table.
 ALTER TABLE t1 SET CHANGE_TRACKING = TRUE;

 -- Initialize a session variable for the current timestamp.
 SET ts1 = (SELECT CURRENT_TIMESTAMP());

 INSERT INTO t1 (id,c1)
 VALUES
 (1,'red'),
 (2,'blue'),
 (3,'green');

 DELETE FROM t1 WHERE id = 1;

 UPDATE t1 SET c1 = 'purple' WHERE id = 2;

 -- Query the change tracking metadata in the table during the interval from $ts1 to the current time.
 -- Return the full delta of the changes.
 SELECT *
 FROM t1
   CHANGES(INFORMATION => DEFAULT)
   AT(TIMESTAMP => $ts1);


 -- Query the change tracking metadata in the table during the interval from $ts1 to the current time.
 -- Return the append-only changes.
 SELECT *
 FROM t1
   CHANGES(INFORMATION => APPEND_ONLY)
   AT(TIMESTAMP => $ts1);
show terse tables;
  CREATE TABLE orders (
    order_id NUMBER,
    items ARRAY
);
INSERT INTO orders VALUES
(1, ARRAY_CONSTRUCT('pen', 'book')),
(2, ARRAY_CONSTRUCT('laptop', 'mouse', 'keyboard'));
show terse tables;
CREATE OR REPLACE TABLE left_table (
  c1 VARCHAR(1),
  c2 TINYINT,
  c3 TIME,
  c4 NUMBER(3,2)
);

CREATE OR REPLACE TABLE right_table (
  c1 VARCHAR(1),
  c2 TINYINT,
  c3 TIME,
  c4 NUMBER(3,2)
);

INSERT INTO left_table VALUES
  ('A',1,'09:15:00',3.21),
  ('A',2,'09:16:00',3.22),
  ('B',1,'09:17:00',3.23),
  ('B',2,'09:18:00',4.23);

INSERT INTO right_table VALUES
  ('A',1,'09:14:00',3.19),
  ('B',1,'09:16:00',3.04);
SELECT * FROM left_table ORDER BY c1, c2;
SELECT * FROM right_table ORDER BY c1, c2;
SELECT *
  FROM left_table l ASOF JOIN right_table r
    MATCH_CONDITION(l.c3>=r.c3)
    ON(l.c1=r.c1 and l.c2=r.c2)
  ORDER BY l.c1, l.c2;
  create or replace table matti(id tinyint,arr array(number),var variant);
  insert into matti(id,arr,var) select 2::tinyint,[3,2]::array(number),'bollo'::variant;
  select * from matti ,lateral flatten(arr);
