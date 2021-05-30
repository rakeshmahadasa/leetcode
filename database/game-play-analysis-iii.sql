select s.player_id, s.event_date,sum(s.prev_games) as games_played_so_far
from (
select a.player_id,a.event_date,
p.games_played as prev_games
from activity a
left join Activity p
on a.player_id = p.player_id and a.event_date >= p.event_date

) s
group by s.player_id, s.event_date
order by s.player_id,s.event_date