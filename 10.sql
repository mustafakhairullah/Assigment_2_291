--Using the view created in Q9, for every person
--who has received at least 3 different tickets within the past year
--and one of those tickets involves a 'red light' violation
--(i.e. 'red light' appears in the violation text
--e.g. 'red light crossing', 'crossing red light at 114 St and 87 Ave')
--list the name of the person and the make and the model of the car 
--for which the red violation ticket is given.

select 
from personDetails det, vehicles veh
