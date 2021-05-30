CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        select distinct Salary
        from Employee
        order by Salary Desc
        offset @N-1 rows FETCH NEXT 1 ROWS ONLY
        
    );
END