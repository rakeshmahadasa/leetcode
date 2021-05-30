select s.id from 
(

    select id, 
            temperature as ctemp, 
            case when
                (lag(RecordDate) over(order by RecordDate)) <> dateadd(day,-1,recordDate)
            then temperature
            else
                isnull(lag(temperature) over(order by recordDate),temperature) 
            end as ptemp
    from weather
    
) s
where s.ctemp > s.ptemp