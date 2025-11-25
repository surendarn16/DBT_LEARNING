with result as (
    select 
    to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI') STARTTIME,
    to_date(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) DATE_STARTDATE,
    HOUR(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) HOUR_STARTDATE,
    DAYOFWEEK(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) DAYOFWEEK_STARTDATE,
    DAYNAME(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) DAYNAME_STARTDATE,
    CASE WHEN DAYNAME(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) IN ('Sat','Sun') then 'Weekend' else 'BusinessDay' end as Day_Type,
    CASE WHEN MONTH(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) IN (12,1,2) THEN 'Winter'
         WHEN MONTH(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) IN (3,4,5) THEN 'Spring'
         WHEN MONTH(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) IN (6,7,8) THEN 'Summer'
         else 'Autumn' end as STATION_OF_YEAR
    
    from {{ source('DEMO', 'BIKE') }}
)
SELECT * FROM RESULT