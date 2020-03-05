--For each year of a car, find the most frequent make and the most frequent car make. 
--In case of ties, list all those ties.

select distinct info_make.year, info_make.make, info_make
from
(
    select color_query.year as color_year, color_query.make as max_make, max(make_query.make_count) as max_count
    from (select year, make, count(*) as make_count 
    from vehicles
    group by year, make) as make_query
    group by year
) as max_color, 

(   
    select year, make, count(*) as info_make
    from vehicles
    group by year, make
) as info_make

where max_color.max_count = info_make and color_year= info_make.year
;