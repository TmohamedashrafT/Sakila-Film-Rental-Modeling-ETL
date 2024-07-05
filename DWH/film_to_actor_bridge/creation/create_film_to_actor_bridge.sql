USE sakila_pl
go

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'film_to_actor_bridge')
  DROP TABLE film_to_actor_bridge

CREATE TABLE film_to_actor_bridge
(
	film_to_actor_bridge_key INT NOT NULL IDENTITY(1,1),-- surrogate key
	film_key INT NOT NULL,
	actor_key INT NOT NULL,
	last_update DATETIME
	CONSTRAINT pk_film_to_actor_bridge PRIMARY KEY (film_to_actor_bridge_key),
	CONSTRAINT fk_film_to_actor_bridge_dim_actor FOREIGN KEY (actor_key) REFERENCES
     dim_actor(actor_key),
	CONSTRAINT fk_film_to_actor_bridge_dim_film FOREIGN KEY (film_key) REFERENCES
     dim_film(film_key)
)

