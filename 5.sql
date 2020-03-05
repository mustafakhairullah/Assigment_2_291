--Find the names of persons who have accumulated 15 or more demerit points within the past two years
--i.e. the sum of their demerit points within the past two years is more than 15
-- Hint: Check out the date and time functions in SQLite.

select fname , lname
from demeritNotices
where julianday("now") - julianday(ddate) <= 730

group by fname, lname

having sum(points) >= 15
;