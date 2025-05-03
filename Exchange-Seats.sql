# Write your MySQL query statement below
select id, 
case when id%2=1 and lead(student)over() is null then student 
when id%2=1 then lead(student)over() 
when id%2=0 then lag(student)over() end as student
from Seat order by id asc;