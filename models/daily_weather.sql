{{ config(materialized='table') }}
with daily_weather as (
    select 
    DATE(TIME) DATE,
    WEATHER,
    TEMP,
    PRESSURE,
    HUMIDITY,
    CLOUDS
    from {{ source('DEMO', 'WEATHER') }}
),
avg_daily_weather as(
    select
    date,
    weather,
    round(avg(TEMP),2) avg_temp,
    round(avg(PRESSURE),2) avg_presure,
    round(avg(HUMIDITY),2) avg_humidity,
    round(avg(CLOUDS),2) avg_clouds
    from daily_weather group by date,weather
    qualify row_number() over (partition by date order by count(weather) desc) = 1
)
SELECT * FROM avg_daily_weather 