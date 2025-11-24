select
*
from {{ source('PETS', 'PETS') }}