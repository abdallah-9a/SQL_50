# Write your MySQL query statement below
with cte as 
(select num, lead(num)over(order by id) as prev, lag(num)over(order by id) as next from Logs)
select distinct num as ConsecutiveNums from cte where num = prev and num = next;