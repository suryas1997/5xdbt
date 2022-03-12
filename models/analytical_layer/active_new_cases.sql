{{
    config(materialized='table'
)}}


select DATE::timestamp as DATE
,PROVINCE
,TOTAL_ACTIVE_CASES
,NEW_CASES_PER_MILLION
,NEW_DEATHS_PER_MILLION
,NEW_RECOVERED
,NEW_DEATHS
,NEW_CASES
,GROWTH_FACTOR_OF_NEW_CASES
,GROWTH_FACTOR_OF_NEW_DEATHS
from  "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_SURYA_SRINIVASAN" 
where ISLAND is not null 