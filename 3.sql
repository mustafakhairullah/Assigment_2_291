--Find the names of persons who have the same grandfather as Michael Fox
--If X and Y denote the grandfathers of Michael Fox (from mother and father sides respectively)
--then we want to find all grand children of X and Y. The result should exclude Michael Fox.

select distinct per1.fname, per1.lname
from births per1, births per2, births mf1, births mf2

where (per1.f_fname = per2.fname and per1.f_lname = per2.lname
or per1.m_fname = per2.fname and per1.m_lname = per2.lname)

and (mf1.fname = "Michael" and mf1.lname = "Fox")

and (mf1.f_fname = mf2.fname and mf1.f_lname = mf2.lname
or mf1.m_fname = mf2.fname and mf1.m_lname = mf2.lname)

and (mf2.f_fname = per2.f_fname and mf2.f_lname = per2.f_lname)

except
select "Michael",  "Fox"