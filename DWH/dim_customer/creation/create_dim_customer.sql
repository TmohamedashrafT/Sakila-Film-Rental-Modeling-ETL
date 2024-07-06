USE sakila_pl
go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_customer'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_customer;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_customer')
  DROP TABLE dim_customer

CREATE TABLE dim_customer
(
	customer_key INT NOT NULL IDENTITY(-1,1),-- surrogate key
	customer_id INT,-- business key
	customer_first_name VARCHAR(45),
	customer_last_name VARCHAR(45),
	customer_email VARCHAR(50),
	customer_active CHAR(1),
	customer_address_id INT,
	customer_address VARCHAR(50),
	customer_city_id INT,
	customer_city VARCHAR(50),
	customer_country_id SMALLINT,
	customer_country VARCHAR(50),
	customer_create_date DATETIME,
	customer_last_update DATETIME,
	customer_address_last_update DATETIME,
	customer_is_current CHAR(2) DEFAULT '1',
	customer_valid_from DATETIME DEFAULT (Getdate()),
	customer_valid_through DATETIME
	CONSTRAINT pk_dim_customer PRIMARY KEY NONCLUSTERED (customer_key)
)
CREATE CLUSTERED COLUMNSTORE INDEX CLUSTERED_COLUMNSTORE_dim_customer
ON dim_customer
insert into dim_customer 
values (-1,'unknown', 'unknown', 'unknown','x', -1, 'unknown', -1, 'unknown', -1,'unknown', '1900-1-1',
       '1900-1-1', '1900-1-1', '-1', '1900-1-1', '1900-1-1')
	    