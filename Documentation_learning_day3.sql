use database documentation_learning;
use schema public;
create or replace table arr(arrayv array) as select * from values(array_construct(1,2,3)),(array_construct(1,2,3));  
CREATE or replace SCHEMA my_schema COMMENT='this is comment2';

SHOW SCHEMAS LIKE 'my_schema';
CREATE OR REPLACE TABLE arr (arrayv ARRAY)
AS
SELECT *
FROM VALUES
  (ARRAY_CONSTRUCT(1,2,3,4)),
  (ARRAY_CONSTRUCT(2,3,4,5)),
  (ARRAY_CONSTRUCT(3,4,5,6));
  CREATE OR REPLACE TABLE arr (arrayv ARRAY)
AS
SELECT
  v::ARRAY
FROM VALUES
  (PARSE_JSON('[1,2,3,4]')),
  (PARSE_JSON('[2,3,4,5]')),
  (PARSE_JSON('[3,4,5,6]')) AS t(v);
  show terse users;

show accounts;
select current_secondary_roles();