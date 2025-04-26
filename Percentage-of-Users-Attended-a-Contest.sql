# Write your MySQL query statement below
with total as
(
    select count(*) as total from Users 
)select r.contest_id, round((count(user_id)/total)*100,2) as percentage
 from total join Register as r group by contest_id order by 2 desc, 1 asc