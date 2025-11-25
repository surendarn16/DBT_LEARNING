{{ config(materialized='view') }}

select
*
from {{ source('DEMO', 'BIKE') }}