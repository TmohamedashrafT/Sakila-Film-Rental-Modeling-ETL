USE sakila_pl
go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_date_rental'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_date_rental;

IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_date_return'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_date_return;

IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_date_payment'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_date_payment;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_date')
  DROP TABLE dim_date

CREATE TABLE dim_date
(
	date_key INT IDENTITY(-1,1),-- surrogate key
	full_date DATE,-- business key
	day_of_week INT,
	day_name varchar(10),
	day_of_month INT,
	day_of_year INT,
	week_of_year INT,
	month_name VARCHAR(10),
	month_of_year INT,
	quarter INT,
	year INT,
	CONSTRAINT pk_dim_date PRIMARY KEY (date_key)
)

insert into dim_date values ('1900-1-1',-1,'unknown', -1,-1,-1,'unknown',-1,-1,-1)