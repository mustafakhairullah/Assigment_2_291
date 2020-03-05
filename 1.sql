--Find the names and the phone numbers of persons who have had a 1969 Chevrolet Camaro registered under their names at some point.
select per.fname, per.lname, per.phone
from registrations reg , persons per, vehicles veh 
where per.lname = reg.lname
and per.fname = reg.fname
and veh.vin = reg.vin
and veh.make = "Chevrolet" and veh.model = "Camaro" and veh.year = 1969
;