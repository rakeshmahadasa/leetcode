select 
d.Department as 'Department',
e.Name as Employee,
e.Salary as Salary
from employee e
inner join (
    select 
    distinct d.id as 'id', max(e.salary) over(partition by e.departmentId) as max_salary,
    d.Name as 'department'
    from department d
    left join employee e
    on d.id = e.departmentid
) d
on d.id = e.departmentid and e.salary = d.max_salary 
