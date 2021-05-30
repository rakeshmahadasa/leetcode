
with unbanned as (
    
    select s.status,s.request_at from (
    select *
from Trips t
left join Users u
on t.client_id = u.users_id
where u.banned = 'No'
and t.Request_at in ('2013-10-01','2013-10-02','2013-10-03')
        ) s
    left join Users u
on s.driver_id = u.users_id
where u.banned = 'No'
)
select s.Day as Day, round(((s.total-s.completed)*1.0)/s.total,2) as 'Cancellation Rate'
from (
select u.request_at as Day,count(*) as total,
sum(
case when u.status='completed' then 1
else 0
end) as completed
from 
unbanned u
group by u.request_at
) s
