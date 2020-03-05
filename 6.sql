--Who is the partner of Michael Fox. In case of multiple marriages, return the one from the latest marriage
--Hint: Check out the limit clause for sqlite. You may also find subqueries in the from clause useful.

select distinct part1.p2_fname, part1.p2_lname

from marriages part1

where part1.p1_fname = "Michael" and part1.p1_lname = "Fox"

order by part1.regdate desc

limit 1
;