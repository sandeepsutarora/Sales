-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-07-25 10:00:40.142

-- tables
-- Table: dim_city
CREATE TABLE dim_city (
    city_id int  NOT NULL,
    city varchar(256)  NOT NULL,
    region_id int  NOT NULL,
    CONSTRAINT dim_city_pk PRIMARY KEY (city_id)
);

-- Table: dim_country
CREATE TABLE dim_country (
    country_id int  NOT NULL,
    country varchar(128)  NOT NULL,
    CONSTRAINT dim_country_pk PRIMARY KEY (country_id)
);

-- Table: dim_employee
CREATE TABLE dim_employee (
    employee_id int  NOT NULL,
    first_name varchar(128)  NOT NULL,
    last_name varchar(128)  NOT NULL,
    birth_year int  NOT NULL,
    CONSTRAINT dim_employee_pk PRIMARY KEY (employee_id)
);

-- Table: dim_month
CREATE TABLE dim_month (
    month_id int  NOT NULL,
    action_month int  NOT NULL,
    CONSTRAINT dim_month_pk PRIMARY KEY (month_id)
);

-- Table: dim_product
CREATE TABLE dim_product (
    product_id int  NOT NULL,
    product_name varchar(256)  NOT NULL,
    product_type_id int  NOT NULL,
    CONSTRAINT dim_product_pk PRIMARY KEY (product_id)
);

-- Table: dim_product_type
CREATE TABLE dim_product_type (
    product_type_id int  NOT NULL,
    product_type_name varchar(256)  NOT NULL,
    CONSTRAINT dim_product_type_pk PRIMARY KEY (product_type_id)
);

-- Table: dim_region
CREATE TABLE dim_region (
    region_id int  NOT NULL,
    region varchar(128)  NOT NULL,
    state_id int  NOT NULL,
    CONSTRAINT dim_region_pk PRIMARY KEY (region_id)
);

-- Table: dim_sales_type
CREATE TABLE dim_sales_type (
    sales_type_id int  NOT NULL,
    type_name varchar(128)  NOT NULL,
    CONSTRAINT dim_sales_type_pk PRIMARY KEY (sales_type_id)
);

-- Table: dim_state
CREATE TABLE dim_state (
    state_id int  NOT NULL,
    state varchar(128)  NOT NULL,
    country_id int  NOT NULL,
    CONSTRAINT dim_state_pk PRIMARY KEY (state_id)
);

-- Table: dim_store
CREATE TABLE dim_store (
    store_id int  NOT NULL,
    store_address varchar(256)  NOT NULL,
    city_id int  NOT NULL,
    CONSTRAINT dim_store_pk PRIMARY KEY (store_id)
);

-- Table: dim_time
CREATE TABLE dim_time (
    time_id int  NOT NULL,
    action_date date  NOT NULL,
    week_id int  NOT NULL,
    month_id int  NOT NULL,
    year_id int  NOT NULL,
    weekday_id int  NOT NULL,
    CONSTRAINT dim_time_pk PRIMARY KEY (time_id)
);

-- Table: dim_week
CREATE TABLE dim_week (
    week_id int  NOT NULL,
    action_week int  NOT NULL,
    CONSTRAINT dim_week_pk PRIMARY KEY (week_id)
);

-- Table: dim_weekday
CREATE TABLE dim_weekday (
    weekday_id int  NOT NULL,
    action_weekday varchar(16)  NOT NULL,
    CONSTRAINT dim_weekday_pk PRIMARY KEY (weekday_id)
);

-- Table: dim_year
CREATE TABLE dim_year (
    year_id int  NOT NULL,
    action_year int  NOT NULL,
    CONSTRAINT dim_year_pk PRIMARY KEY (year_id)
);

-- Table: fact_sales
CREATE TABLE fact_sales (
    product_id int  NOT NULL,
    time_id int  NOT NULL,
    store_id int  NOT NULL,
    employee_id int  NOT NULL,
    sales_type_id int  NOT NULL,
    price decimal(8,2)  NOT NULL,
    quantity decimal(8,2)  NOT NULL,
    CONSTRAINT fact_sales_pk PRIMARY KEY (product_id,time_id,store_id,employee_id,sales_type_id)
);

-- foreign keys
-- Reference: dim_city_dim_region (table: dim_city)
ALTER TABLE dim_city ADD CONSTRAINT dim_city_dim_region
    FOREIGN KEY (region_id)
    REFERENCES dim_region (region_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_product_dim_product_type (table: dim_product)
ALTER TABLE dim_product ADD CONSTRAINT dim_product_dim_product_type
    FOREIGN KEY (product_type_id)
    REFERENCES dim_product_type (product_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_region_dim_state (table: dim_region)
ALTER TABLE dim_region ADD CONSTRAINT dim_region_dim_state
    FOREIGN KEY (state_id)
    REFERENCES dim_state (state_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_state_dim_country (table: dim_state)
ALTER TABLE dim_state ADD CONSTRAINT dim_state_dim_country
    FOREIGN KEY (country_id)
    REFERENCES dim_country (country_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_store_dim_city (table: dim_store)
ALTER TABLE dim_store ADD CONSTRAINT dim_store_dim_city
    FOREIGN KEY (city_id)
    REFERENCES dim_city (city_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_time_dim_month (table: dim_time)
ALTER TABLE dim_time ADD CONSTRAINT dim_time_dim_month
    FOREIGN KEY (month_id)
    REFERENCES dim_month (month_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_time_dim_week (table: dim_time)
ALTER TABLE dim_time ADD CONSTRAINT dim_time_dim_week
    FOREIGN KEY (week_id)
    REFERENCES dim_week (week_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_time_dim_weekday (table: dim_time)
ALTER TABLE dim_time ADD CONSTRAINT dim_time_dim_weekday
    FOREIGN KEY (weekday_id)
    REFERENCES dim_weekday (weekday_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: dim_time_dim_year (table: dim_time)
ALTER TABLE dim_time ADD CONSTRAINT dim_time_dim_year
    FOREIGN KEY (year_id)
    REFERENCES dim_year (year_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_sales_dim_customer (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_dim_customer
    FOREIGN KEY (store_id)
    REFERENCES dim_store (store_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_sales_dim_employee (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_dim_employee
    FOREIGN KEY (employee_id)
    REFERENCES dim_employee (employee_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_sales_dim_product (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_dim_product
    FOREIGN KEY (product_id)
    REFERENCES dim_product (product_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_sales_dim_sales_type (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_dim_sales_type
    FOREIGN KEY (sales_type_id)
    REFERENCES dim_sales_type (sales_type_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_sales_dim_time (table: fact_sales)
ALTER TABLE fact_sales ADD CONSTRAINT fact_sales_dim_time
    FOREIGN KEY (time_id)
    REFERENCES dim_time (time_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

