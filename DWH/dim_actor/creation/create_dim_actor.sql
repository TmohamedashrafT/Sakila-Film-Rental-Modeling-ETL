USE sakila_pl
go

-- Drop foregin Keys if exists
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_film_to_actor_bridge_dim_actor'
                  AND parent_object_id = Object_id('film_to_actor_bridge'))
  ALTER TABLE film_to_actor_bridge
    DROP CONSTRAINT fk_film_to_actor_bridge_dim_actor;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'dim_actor')
  DROP TABLE dim_actor


CREATE TABLE dim_actor
(
	actor_key INT NOT NULL IDENTITY(-1,1),-- surrogate key
	actor_id INT,-- business key
	actor_full_name VARCHAR(100),
	actor_last_update DATETIME
	CONSTRAINT pk_dim_actor PRIMARY KEY (actor_key)
)
insert into dim_actor
values (-1, 'unknown', '1900-1-1')

