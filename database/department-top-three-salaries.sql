-- # Write your MySQL query statement below
select s.department,
s.employee,
s.salary

from (
    select d.name as 'department', e.name as 'employee', e.salary as salary,
    dense_rank() over (partition by e.departmentid order by e.salary desc) as ranke
    from employee e
    left join department d
    on e.departmentid = d.id
) s

where s.ranke <=3