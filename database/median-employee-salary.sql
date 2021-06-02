/* Write your T-SQL query statement below */
select s.Id, s.Company,s.Salary
from(
    select *, row_number() over (partition by company order by salary,id) as company_order, count(*) over (partition by company) as company_count
    from employee
    ) s
where (company_count%2 = 1 and company_order = company_count/2 +1 )
or (company_count%2 = 0 and ((company_order = company_count/2 +1 ) or (company_order = company_count/2)))