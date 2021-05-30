select
    top 1 max(s.SecondHighestSalary) as SecondHighestSalary
    
from (
select salary as SecondHighestSalary, DENSE_RANK() over(order by salary desc) as salary_rank
from employee) s
where s.salary_rank = 2
