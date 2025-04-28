# Write your MySQL query statement below
select round(count(case when DateDiff(upcome_date, event_date)=1 then 1 end)/count(distinct player_id), 2) as fraction
from(
select player_id,min(event_date)over(partition by player_id) as event_date,lead(event_date)over(partition by player_id order by event_date) as upcome_date
from Activity) as subquery