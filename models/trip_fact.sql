with result as (
    select 
    DATE(to_timestamp(STARTTIME)) STARTTIME,
    BIKEID,
    START_STATION_ID,
    END_STATION_ID,
    USERTYPE,
    TIMESTAMPDIFF(SECONDS,to_timestamp(STARTTIME),to_timestamp(STOPTIME)) TRIP_DURATION_SECONDS
    from {{ source('DEMO', 'BIKE') }}
)
SELECT * FROM RESULT