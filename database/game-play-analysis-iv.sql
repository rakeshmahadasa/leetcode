select round((count(distinct s.player_id)*1.0)/(select count(distinct player_id) from activity),2) as fraction
from(
select  player_id,
case when lag(event_date) over (partition by player_id order by event_date)  = dateadd(day,-1,event_date) and dateadd(day,-1,event_date) = min(event_date) over(partition by player_id)
then 1
else 0
end as is_valid
from activity
) s
where s.is_valid = 1