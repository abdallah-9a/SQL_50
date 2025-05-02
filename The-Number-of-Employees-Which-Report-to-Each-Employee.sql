# Write your MySQL query statement below
select e.employee_id, e.name, count(*) as reports_count, round(avg(m.age)) as average_age
from Employees as e join Employees as m on e.employee_id = m.reports_to 
group by e.employee_id, e.name order by employee_id asc