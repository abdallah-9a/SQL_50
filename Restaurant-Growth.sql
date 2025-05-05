# Write your MySQL query statement below
with cte as (select visited_on, sum(amount) amount from Customer group by visited_on)
select c1.visited_on, sum(c2.amount) as amount, round(avg(c2.amount), 2) as average_amount
from cte as c1 join cte as c2 
on c2.visited_on between date_sub(c1.visited_on, interval 6 day) and c1.visited_on
group by c1.visited_on
having count(*) = 7
order by visited_on asc;