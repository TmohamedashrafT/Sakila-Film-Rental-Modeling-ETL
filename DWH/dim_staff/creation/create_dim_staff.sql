USE sakila_pl
go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_staff'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_staff;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_staff')
  DROP TABLE dim_staff

CREATE TABLE dim_staff
(
	staff_key INT NOT NULL IDENTITY(0,1),-- surrogate key
	staff_id TINYINT,-- business key
	staff_first_name VARCHAR(45),
	staff_last_name VARCHAR(45),
	staff_email VARCHAR(50) DEFAULT NULL,
	staff_active char(2)  DEFAULT '1',
	staff_address_id INT,
	staff_address VARCHAR(50) ,
	staff_city_id INT,
	staff_city VARCHAR(50),
	staff_country_id SMALLINT,
	staff_country VARCHAR(50),
	staff_last_update DATETIME,
	CONSTRAINT pk_dim_staff PRIMARY KEY NONCLUSTERED (staff_key)
)
CREATE CLUSTERED COLUMNSTORE INDEX CLUSTERED_COLUMNSTORE_dim_staff
ON dim_staff
insert into dim_staff 
values (0, 'unknown', 'unknown', 'unknown', '-1', -1, 'unknown', -1, 'unknown', -1, 'unknown', '1900-1-1')  

