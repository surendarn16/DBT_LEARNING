with result as (
    select 
    DATE(to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI')) STARTTIME,
    BIKEID,
    START_STATION_ID,
    END_STATION_ID,
    USERTYPE,
    TIMESTAMPDIFF(SECONDS,to_timestamp(STARTTIME,'MM/DD/YYYY HH:MI'),to_timestamp(STOPTIME,'MM/DD/YYYY HH:MI')) TRIP_DURATION_SECONDS
    from {{ source('DEMO', 'BIKE') }}
)
SELECT * FROM RESULT