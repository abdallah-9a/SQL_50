# Write your MySQL query statement below
with cte as (select person_id, person_name, sum(weight)over(order by turn) as weight, turn from Queue)
select person_name from cte where weight <= 1000 order by weight desc limit 1;