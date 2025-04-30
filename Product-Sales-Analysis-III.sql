# Write your MySQL query statement below
with cte1 as(select product_id, min(year) as first_year from Sales group by product_id),
cte2 as(select c1.product_id, c1.first_year, quantity, price, year from cte1 as c1 join Sales as s 
    on c1.product_id = s.product_id)
select product_id, first_year, quantity, price from cte2 where first_year = year;