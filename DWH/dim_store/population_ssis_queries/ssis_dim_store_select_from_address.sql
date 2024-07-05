select 
	ad.address_id as store_address_id,
	ad.address as store_address,
	ad.city_id as store_city_id,
	ci.city as store_city,
	ci.country_id as store_country_id,
	co.country as store_country,
	ad.last_update as store_address_last_update

from address ad
left join city ci
on ad.city_id = ci.city_id

left join country co
on ci.country_id = co.country_id

UNION ALL
SELECT null, null, null, null, null, null, null