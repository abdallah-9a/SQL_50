# Write your MySQL query statement below
with cte as (select person_id, person_name, sum(weight)over(order by turn) as weight, turn from Queue),
cte2 as (select *, row_number()over(order by weight desc) as rn from cte where weight <= 1000)
select person_name from cte2 where rn = 1;