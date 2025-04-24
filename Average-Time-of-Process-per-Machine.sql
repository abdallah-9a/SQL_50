# Write your MySQL query statement below
with cte as
(
select machine_id, count(process_id)/2 as running_num, 
sum(case when activity_type = 'start' then - timestamp
    else timestamp end) as total_time
from Activity group by machine_id
)
select machine_id, round(total_time/running_num,3) as processing_time from cte