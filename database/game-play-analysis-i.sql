-- # Write your MySQL query statement below
select s.player_id,s.first_login
from (
select event_date,player_id , min(event_date) over (partition by player_id) as first_login from Activity) s where s.event_date = s.first_login