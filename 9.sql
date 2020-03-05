--Create a view called personDetails with columns 
--fname, lname, bdate, bplace, carsowned, and ticketsRcvd. 
--The view includes for each person, fname, lname, bdate, bplace, 
--the number of different cars registered under the person name in the past year
--and the number of different tickets given to those registered cars within the past year
--Include people who have no cars registered under their names 
--or no tickets with zero values.

select *
from 
(
select persons.fname, persons.lname, persons.bdate, persons.bplace, car_reg.regno, car_reg.num_cars
from
persons left outer join

    (
        select fname, lname, vin, regno, count(vin) as num_cars
        from registrations
        where julianday("now") - julianday(regdate) <= 365
        group by fname, lname
    ) as car_reg on (car_reg.fname = persons.fname and car_reg.lname = persons.lname)
) as per_inf left outer join (
        select r.fname, r.lname, count(*) as num_tick
        from tickets t, registrations r
        where julianday("now") - julianday(t.vdate) <= 365
        and t.regno = r.regno
        group by r.fname, r.lname
    ) as tick_num on (per_inf.fname = tick_num.fname and per_inf.lname = tick_num.lname)


;