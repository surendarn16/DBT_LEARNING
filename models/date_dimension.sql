{{ config(materialized='table') }}
with result as (
    select 
    to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI') STARTTIME,
    to_date(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) DATE_STARTDATE,
    HOUR(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) HOUR_STARTDATE,
    DAYOFWEEK(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) DAYOFWEEK_STARTDATE,
    DAYNAME(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) DAYNAME_STARTDATE,
    {{get_day_type('STARTTIME')}}Day_Type,
    {{get_season('STARTTIME')}} STATION_OF_YEAR
    
    from {{ source('DEMO', 'BIKE') }}
)
SELECT * FROM RESULT