--Find the names of people other than Michael Fox who are born to the same parent as Michael Fox.

select b1.fname, b1.lname 
from births b1, births b2
where b2.fname = "Michael" and b2.lname = "Fox"
and ((b1.f_fname = b2.f_fname and b1.f_lname = b2.f_lname) 
and (b1.m_fname = b2.m_fname and b1.m_lname = b2.m_lname))

except 

select b1.fname, b1.lname
from births b1
where b1.fname = "Michael" and b1.lname = "Fox"
;