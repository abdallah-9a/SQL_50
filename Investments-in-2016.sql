# Write your MySQL query statement below
with uniques as
(select lat, lon from Insurance group by lat, lon having count(*) = 1),
tiv_15 as (select tiv_2015 from Insurance group by tiv_2015 having count(*) > 1)
select round(sum(tiv_2016), 2) as tiv_2016 from Insurance
where (lat, lon) in (select * from uniques) and tiv_2015 in (select * from tiv_15 );