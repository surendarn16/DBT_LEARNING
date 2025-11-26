{%macro get_season(date_var) %}
CASE WHEN MONTH(to_timestamp({{date_var}})) IN (12,1,2) THEN 'Winter'
         WHEN MONTH(to_timestamp({{date_var}})) IN (3,4,5) THEN 'Spring'
         WHEN MONTH(to_timestamp({{date_var}})) IN (6,7,8) THEN 'Summer'
         else 'Autumn' end
{%endmacro%}

{%macro get_day_type(date_var) %}
CASE WHEN DAYNAME(to_timestamp({{date_var}})) IN ('Sat','Sun') then 'Weekend' else 'BusinessDay' end 
{%endmacro%}