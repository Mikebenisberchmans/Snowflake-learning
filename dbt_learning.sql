use role securityadmin;
show roles;
drop warehouse if exists dbt_wh;

CREATE ROLE IF NOT EXISTS TRANSFORMER;
GRANT ROLE TRANSFORMER TO ROLE SYSADMIN;
USE ROLE SYSADMIN;

CREATE WAREHOUSE IF NOT EXISTS TRANSFORMER_WH
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  COMMENT = 'Warehouse for dbt transformations';

GRANT USAGE
ON WAREHOUSE TRANSFORMER_WH
TO ROLE TRANSFORMER;

GRANT MONITOR
ON WAREHOUSE TRANSFORMER_WH
TO ROLE TRANSFORMER;
show terse warehouses like 'transformer_wh';
show roles like 'transformer';
show grants on warehouse transformer_wh;
create or replace database dbt_db;
use database dbt_db;
create schema raw;
create or replace schema transformed;
grant usage on database dbt_db to role transformer;

GRANT USAGE
ON SCHEMA dbt_db.raw
TO ROLE TRANSFORMER;

GRANT SELECT
ON ALL TABLES IN SCHEMA dbt_db.RAW
TO ROLE TRANSFORMER;

GRANT SELECT
ON FUTURE TABLES IN SCHEMA dbt_db.RAW
TO ROLE TRANSFORMER;

GRANT USAGE
ON SCHEMA dbt_db.transformed
TO ROLE TRANSFORMER;

GRANT SELECT
ON ALL TABLES IN SCHEMA dbt_db.transformed
TO ROLE TRANSFORMER;

GRANT SELECT
ON FUTURE TABLES IN SCHEMA dbt_db.transformed
TO ROLE TRANSFORMER;

grant create table,create view on schema dbt_db.transformed to role transformer;

USE ROLE SECURITYADMIN;

CREATE USER IF NOT EXISTS dbt_user
  LOGIN_NAME = 'dbt_user'
  DISPLAY_NAME = 'dbt Service User'
  PASSWORD = 'mikAL@12345678'   
  DEFAULT_ROLE = TRANSFORMER
  DEFAULT_WAREHOUSE = TRANSFORMER_WH
  MUST_CHANGE_PASSWORD = FALSE
  DISABLED = FALSE;
  grant role transformer to user dbt_user;
  show grants on user dbt_user;
show users like 'dbt_user';

use role transformer;
create table transformed.hello(id int);
drop table transformed.hello; 
use role 