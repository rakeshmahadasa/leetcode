/* Write your PL/SQL query statement below */
select p.FirstName, p.LastName, a.City, a.State
from Person p
left join address a
on p.PersonId = a.personid