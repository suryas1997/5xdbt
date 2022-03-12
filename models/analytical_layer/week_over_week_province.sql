{{
    config(materialized='table'
)}}


select DATE_PART(YEAR, DATE) as YEAR,
DATE_PART(WEEK, DATE) AS WEEK_NO,
PROVINCE,
SUM(NEW_CASES ) AS CASES_OVER_WEEK ,
sum(NEW_DEATHS) as DEATHS_OVER_WEEK ,
sum(NEW_RECOVERED) as RECOVERED_OVER_WEEK 
from 
{{ref('active_new_cases')}}
GROUP BY 1,2,3
ORDER BY 1,2