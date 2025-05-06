# Write your MySQL query statement below
with cte as
(select *, row_number()over(partition by email order by id asc) as rn from Person)
delete
from Person where id not in (select id from cte where rn =1)