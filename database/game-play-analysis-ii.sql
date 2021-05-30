select s.player_id,s.device_id
from (
select device_id,event_date,player_id , min(event_date) over (partition by player_id) as first_login from Activity) s where s.event_date = s.first_login