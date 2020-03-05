--For each color of a car with a registration 
--that does not expire at least for another month
--find the average number of tickets issued per registration
--the average amount of fine given, and the maximum amount of fine given
--Include colors with no tickets in the output with zero counts 
--(if applicable) or null values. Hint: you may find outer join useful.

select color, fine, veh_reg.expiry as reg_date, regno, count(regno) as count_reg, avg(fine) as av_fine, max(fine) as max_fine
from
--joining vehicles and registration tables
(
	select color, expiry, regno
	from vehicles left outer join registrations using (vin)
	where julianday("now") - julianday(expiry) <= 30
		
) as veh_reg left outer join tickets using (regno)

group by regno, color
;