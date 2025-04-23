# Write your MySQL query statement below
with cte as
(
select id, temperature - LAG(temperature)over(order by recordDate) as diff,
        DATEDIFF(recordDate,LAG(recordDate)over(order by recordDate)) as gap
from Weather
)
select id from cte where diff > 0 and gap = 1;