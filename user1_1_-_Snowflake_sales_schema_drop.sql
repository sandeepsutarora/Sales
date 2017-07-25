-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-07-25 10:00:40.142

-- foreign keys
ALTER TABLE dim_city
    DROP CONSTRAINT dim_city_dim_region;

ALTER TABLE dim_product
    DROP CONSTRAINT dim_product_dim_product_type;

ALTER TABLE dim_region
    DROP CONSTRAINT dim_region_dim_state;

ALTER TABLE dim_state
    DROP CONSTRAINT dim_state_dim_country;

ALTER TABLE dim_store
    DROP CONSTRAINT dim_store_dim_city;

ALTER TABLE dim_time
    DROP CONSTRAINT dim_time_dim_month;

ALTER TABLE dim_time
    DROP CONSTRAINT dim_time_dim_week;

ALTER TABLE dim_time
    DROP CONSTRAINT dim_time_dim_weekday;

ALTER TABLE dim_time
    DROP CONSTRAINT dim_time_dim_year;

ALTER TABLE fact_sales
    DROP CONSTRAINT fact_sales_dim_customer;

ALTER TABLE fact_sales
    DROP CONSTRAINT fact_sales_dim_employee;

ALTER TABLE fact_sales
    DROP CONSTRAINT fact_sales_dim_product;

ALTER TABLE fact_sales
    DROP CONSTRAINT fact_sales_dim_sales_type;

ALTER TABLE fact_sales
    DROP CONSTRAINT fact_sales_dim_time;

-- tables
DROP TABLE dim_city;

DROP TABLE dim_country;

DROP TABLE dim_employee;

DROP TABLE dim_month;

DROP TABLE dim_product;

DROP TABLE dim_product_type;

DROP TABLE dim_region;

DROP TABLE dim_sales_type;

DROP TABLE dim_state;

DROP TABLE dim_store;

DROP TABLE dim_time;

DROP TABLE dim_week;

DROP TABLE dim_weekday;

DROP TABLE dim_year;

DROP TABLE fact_sales;

-- End of file.

