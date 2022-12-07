{{ config(materialized='table') }}
with merge as (
select agent,date_agent,city_agent from {{ref('base_AFRICA')}}
UNION ALL
select agent,date_agent,city_agent from {{ref('base_AMERICA')}}
UNION ALL
select agent,date_agent,city_agent from {{ref('base_ASIA')}}
UNION ALL
select agent,date_agent,city_agent from {{ref('base_ATLANTIC')}}
UNION ALL
select agent,date_agent,city_agent from {{ref('base_AUSTRALIA')}}
UNION ALL
select agent,date_agent,city_agent from {{ref('base_EUROPE')}}
UNION ALL
select agent,date_agent,city_agent from {{ref('base_INDIAN')}}
UNION ALL
select agent,date_agent,city_agent from {{ref('base_PACIFIC')}}
)

 select
 {{ dbt_utils.surrogate_key(
      'agent',
      'date_agent'
  ) }} as agentid,
  *
 from merge