# Write your MySQL query statement below
with cte as (select  num,count(num)as counts from MyNumbers group by num)
select max(num) as num from cte where counts = 1;