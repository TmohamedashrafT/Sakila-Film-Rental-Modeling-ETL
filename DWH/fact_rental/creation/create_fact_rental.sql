USE sakila_pl
go

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_rental')
  DROP TABLE fact_rental

CREATE TABLE fact_rental
(
	rental_id INT,-- business key
	customer_key INT ,
	staff_key INT ,
	store_key INT,
	film_key INT ,
	rental_date INT ,
	return_date INT ,
	payment_date INT ,
	rental_time INT,
	return_time INT ,
	payment_time INT,
	amount DECIMAL(5,2),
	rental_duration_hours INT,
	is_returned char(3),
	last_update DATETIME,

	CONSTRAINT fk_fact_rental_dim_customer
	FOREIGN KEY (customer_key)
	REFERENCES dim_customer(customer_key),

	CONSTRAINT fk_fact_rental_dim_staff
	FOREIGN KEY (staff_key)
	REFERENCES dim_staff(staff_key),

	CONSTRAINT fk_fact_rental_dim_store
	FOREIGN KEY (store_key)
	REFERENCES dim_store(store_key),

	CONSTRAINT fk_fact_rental_dim_film
	FOREIGN KEY (film_key)
	REFERENCES dim_film(film_key),

	CONSTRAINT fk_fact_rental_dim_date_rental
	FOREIGN KEY (rental_date)
	REFERENCES dim_date(date_key),

	CONSTRAINT fk_fact_rental_dim_date_return
	FOREIGN KEY (return_date)
	REFERENCES dim_date(date_key),

	CONSTRAINT fk_fact_rental_dim_date_payment
	FOREIGN KEY (payment_date)
	REFERENCES dim_date(date_key),

	CONSTRAINT fk_fact_rental_dim_time_rental
	FOREIGN KEY (rental_time)
	REFERENCES dim_time(time_key),

	CONSTRAINT fk_fact_rental_dim_time_return
	FOREIGN KEY (return_time)
	REFERENCES dim_time(time_key),

	CONSTRAINT fk_fact_rental_dim_time_payment
	FOREIGN KEY (payment_time)
	REFERENCES dim_time(time_key),
)
CREATE CLUSTERED COLUMNSTORE INDEX CLUSTERED_COLUMNSTORE_fact_rental
ON fact_rental
