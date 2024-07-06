USE sakila_pl
go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_store'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_store;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_store')
  DROP TABLE dim_store

CREATE TABLE dim_store
(
	store_key INT NOT NULL IDENTITY(-1,1),-- surrogate key
	store_id INT,-- business key
	store_address_id INT,
	store_address VARCHAR(50),
	store_city_id INT,
	store_city VARCHAR(50),
	store_country_id SMALLINT,
	store_country VARCHAR(50),
	store_last_update DATETIME,
	store_manager_staff_id INT,
	store_manager_first_name VARCHAR(45),
	store_manager_last_name VARCHAR(45)
	CONSTRAINT pk_dim_store PRIMARY KEY NONCLUSTERED (store_key)
)
CREATE CLUSTERED COLUMNSTORE INDEX CLUSTERED_COLUMNSTORE_dim_store
ON dim_store
insert into dim_store
values (-1, -1, 'unknown', -1, 'unknown', -1,'unknown', '1900-1-1', -1, 'unknown', 'unknown')
