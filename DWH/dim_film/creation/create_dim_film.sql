USE sakila_pl
go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_rental_dim_film'
                  AND parent_object_id = Object_id('fact_rental'))
  ALTER TABLE fact_rental
    DROP CONSTRAINT fk_fact_rental_dim_film;

IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_film_to_actor_bridge_dim_film'
                  AND parent_object_id = Object_id('film_to_actor_bridge'))
  ALTER TABLE film_to_actor_bridge
    DROP CONSTRAINT fk_film_to_actor_bridge_dim_film;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_film')
  DROP TABLE dim_film

CREATE TABLE dim_film
(
	film_key INT NOT NULL IDENTITY(-1,1),-- surrogate key
	film_id INT,-- business key
	film_title VARCHAR(255),
	film_description VARCHAR(MAX) DEFAULT NULL,
	film_release_year VARCHAR(4),
	film_rental_duration INT DEFAULT 3,
	film_rental_rate_per_day DECIMAL(4,2) DEFAULT 4.99,
	film_length INT DEFAULT NULL,
	film_replacement_cost DECIMAL(5,2) DEFAULT 19.99,
	film_rating VARCHAR(10) DEFAULT 'G',
	film_special_features VARCHAR(255) DEFAULT NULL,
	film_language_id INT,
	film_language_name CHAR(20),
	film_last_update DATETIME,
	film_category_action char(3),
	film_category_animation char(3),
	film_category_children char(3),
	film_category_classics char(3),
	film_category_comedy char(3),
	film_category_documentary char(3),
	film_category_drama char(3),
	film_category_family char(3),
	film_category_foreign char(3),
	film_category_games char(3),
	film_category_horror char(3),
	film_category_music char(3),
	film_category_new char(3),
	film_category_scifi char(3),
	film_category_sports char(3),
	film_category_travel char(3),
	CONSTRAINT pk_dim_film PRIMARY KEY NONCLUSTERED (film_key)
)
CREATE CLUSTERED COLUMNSTORE INDEX CLUSTERED_COLUMNSTORE_dim_film
ON dim_film
insert into dim_film
values (-1, 'unknown', 'unknown', 'xxx', -1, -1, -1, -1, 'unknown', 'unknown', -1, 'unknown',
		'1900-1-1','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx','xxx',
		'xxx','xxx','xxx')
