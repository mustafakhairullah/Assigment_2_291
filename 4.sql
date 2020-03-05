--Who is the oldest child of Michael Fox. In case of ties, return all those ties.

select bir.fname, bir.lname

from 
(
    select *
    from births b, persons p 
    where (b.f_fname = "Michael" and b.f_lname = "Fox")
    and (p.fname = b.fname and p.lname = b.lname)
    order by p.bdate
    limit 1
) as maximum, births bir, persons per

where per.bdate = maximum.bdate
and bir.f_fname = "Michael" and bir.f_lname = "Fox"
and (per.fname = bir.fname and per.lname = bir.lname)
;