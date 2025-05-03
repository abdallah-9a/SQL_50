# Write your MySQL query statement below
with user_result as
(select name, count(rating) as ratings
from Users as u join MovieRating as r on u.user_id = r.user_id
group by name order by ratings desc, name asc limit 1),
movie_result as (select title, avg(rating) as highest_ratings
from Movies as m join MovieRating as r on m.movie_id = r.movie_id 
where created_at between '2020-02-01' and '2020-02-29'
group by title order by highest_ratings desc, title limit 1)
select name as results from user_result
union all
select title from movie_result