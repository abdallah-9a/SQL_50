# Write your MySQL query statement below
select *, case when x >= y+z or y >= x+z or z>=x+y then 'No' else 'Yes' end as triangle
from Triangle;