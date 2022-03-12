{{
    config(materialized='table'
)}}

WIth total_cases as
(
select province
,max(TOTAL_CASES) as TOTAL_CASES
,max(TOTAL_DEATHS)  as TOTAL_DEATHS
,max(TOTAL_RECOVERED) as TOTAL_RECOVERED
from 
{{ref('total_cases_deaths')}}
group by 1
  )
select p.province,
population,
TOTAL_CASES,
round(TOTAL_CASES/p.population*100,2) as percent_affected,
round(TOTAL_DEATHS/p.population*100,2) as percent_died,
round(TOTAL_RECOVERED/p.population*100,2) as percent_recovered
from total_cases tc
join {{ref('provinces')}} p on tc.province = p.province