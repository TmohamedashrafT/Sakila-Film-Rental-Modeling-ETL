select
    fc.film_id,
    MAX(CASE WHEN c.name = 'Action' THEN 'yes' ELSE 'no' END) AS film_category_action,
    MAX(CASE WHEN c.name = 'Animation' THEN 'yes' ELSE 'no' END) AS film_category_animation,
    MAX(CASE WHEN c.name = 'Children' THEN 'yes' ELSE 'no' END) AS film_category_children,
    MAX(CASE WHEN c.name = 'Classics' THEN 'yes' ELSE 'no' END) AS film_category_classics,
    MAX(CASE WHEN c.name = 'Comedy' THEN 'yes' ELSE 'no' END) AS film_category_comedy,
    MAX(CASE WHEN c.name = 'Documentary' THEN 'yes' ELSE 'no' END) AS film_category_documentary,
    MAX(CASE WHEN c.name = 'Drama' THEN 'yes' ELSE 'no' END) AS film_category_drama,
    MAX(CASE WHEN c.name = 'Family' THEN 'yes' ELSE 'no' END) AS film_category_family,
    MAX(CASE WHEN c.name = 'foreign' THEN 'yes' ELSE 'no' END) AS film_category_foreign,
    MAX(CASE WHEN c.name = 'Games' THEN 'yes' ELSE 'no' END) AS film_category_games,
    MAX(CASE WHEN c.name = 'Horror' THEN 'yes' ELSE 'no' END) AS film_category_horror,
    MAX(CASE WHEN c.name = 'Music' THEN 'yes' ELSE 'no' END) AS film_category_music,
    MAX(CASE WHEN c.name = 'New' THEN 'yes' ELSE 'no' END) AS film_category_new,
    MAX(CASE WHEN c.name = 'Sci-Fi' THEN 'yes' ELSE 'no' END) AS film_category_scifi,
    MAX(CASE WHEN c.name = 'sports' THEN 'yes' ELSE 'no' END) AS film_category_sports,
    MAX(CASE WHEN c.name = 'travel' THEN 'yes' ELSE 'no' END) AS film_category_travel

FROM
    film_category fc
left join
    category c ON fc.category_id = c.category_id
group by
    fc.film_id;
