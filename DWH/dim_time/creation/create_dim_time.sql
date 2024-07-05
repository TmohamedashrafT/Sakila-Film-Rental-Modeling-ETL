USE sakila_pl
go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_time_rental'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_time_rental;

IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_time_return'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_time_return;

IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_time_payment'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_time_payment;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_time')
  DROP TABLE dim_time

CREATE TABLE dim_time
(
	time_key INT NOT NULL IDENTITY(1,1),-- surrogate key
	full_time TIME,-- business key
	hour INT,
	minute INT,
	CONSTRAINT pk_time_key PRIMARY KEY (time_key)
)

