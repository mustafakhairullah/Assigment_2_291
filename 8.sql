--For each year of a car, find the most frequent make 
--and the most frequent car color. 
--In case of ties, list all those ties.

select distinct info_color.year, info_color.color, info_make.make
from
(
    select color_query.year as color_year, color_query.color as max_color, max(color_query.color_count) as max_count_color
    from 
    (
        select year, color, count(*) as color_count 
        from vehicles
        group by year, color
    ) as color_query
    group by year
) as max_color, 

(   
    select year, color, count(*) as info_color
    from vehicles
    group by year, color
) as info_color,

(
    select make_query.year as make_year, make_query.make as max_make, max(make_query.make_count) as max_count_make
    from 
    (
        select year, make, count(*) as make_count 
        from vehicles
        group by year, make
    ) as make_query
    group by year
) as max_make, 

(   
    select year, make, count(*) as info_make
    from vehicles
    group by year, make
) as info_make

where (max_color.max_count_color = info_color and color_year= info_color.year)
and (max_make.max_count_make = info_make and make_year= info_make.year)
and (info_make.year = info_color.year)
;