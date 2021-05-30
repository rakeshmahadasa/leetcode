/* Write your T-SQL query statement below */
select distinct sa.email from (
select email , count(*) over(partition by email) as cnt
from person
    ) sa
where sa.cnt > 1
