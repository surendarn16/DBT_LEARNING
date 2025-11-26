{{ config(materialized='table') }}
with result as (
    select 
    to_timestamp(STARTTIME) STARTTIME,
    date(to_timestamp(STARTTIME)) DATE_STARTDATE,
    HOUR(to_timestamp(STARTTIME)) HOUR_STARTDATE,
    DAYOFWEEK(to_timestamp(STARTTIME)) DAYOFWEEK_STARTDATE,
    DAYNAME(to_timestamp(STARTTIME)) DAYNAME_STARTDATE,
    {{get_day_type('STARTTIME')}}Day_Type,
    {{get_season('STARTTIME')}} STATION_OF_YEAR
    
    from {{ source('DEMO', 'BIKE') }}
)
SELECT * FROM RESULT