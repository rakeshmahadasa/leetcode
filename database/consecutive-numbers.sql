/* Write your T-SQL query statement below */
-- # Write your MySQL query statement below
select distinct(s.num) as ConsecutiveNums from (
select Num, LAG(Num) over(order by id) as prev, LEAD(Num) over(order by id)  as next
from logs 
) s
where s.num = s.prev and s.num = s.next