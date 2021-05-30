/* Write your T-SQL query statement below */
-- # Write your MySQL query statement below
select score, DENSE_RANK() OVER (ORDER BY SCORE DESC) as Rank
from scores
order by rank