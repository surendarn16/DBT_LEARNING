with cte as(
    select a.*,b.*
    from {{ ref('trip_fact') }} a
    left outer join {{ ref('daily_weather') }} b
    on a.STARTTIME = b.date
)

select * from cte