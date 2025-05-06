# Write your MySQL query statement below
with cte as 
(select d.name as Department, e.name as Employee, e.salary as Salary,
 dense_rank()over(partition by d.name order by salary desc) as rn
from Employee as e join Department as d on e.departmentId = d.id)
select Department, Employee, Salary from cte where rn <= 3;