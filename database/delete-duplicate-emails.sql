with cc as (select min(id) as id
from person
group by email)

delete from person where id not in (select * from cc)