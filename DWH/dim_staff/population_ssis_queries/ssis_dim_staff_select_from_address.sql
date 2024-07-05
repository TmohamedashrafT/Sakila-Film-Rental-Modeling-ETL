select 
	ad.address_id as staff_address_id,
	ad.address as staff_address,
	ad.city_id as staff_city_id,
	ci.city as staff_city,
	ci.country_id as staff_country_id,
	co.country as staff_country,
	ad.last_update as staff_address_last_update

from address ad
left join city ci
on ad.city_id = ci.city_id

left join country co
on ci.country_id = co.country_id

UNION ALL
SELECT null, null, null, null, null, null, null