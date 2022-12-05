{{ config(materialized='table') }}
with merge as (
select agent,date_agent,city_agent from {{ref('base_AFRICA')}}
UNION
select agent,date_agent,city_agent from {{ref('base_AMERICA')}}
UNION
select agent,date_agent,city_agent from {{ref('base_ASIA')}}
UNION
select agent,date_agent,city_agent from {{ref('base_ATLANTIC')}}
UNION
select agent,date_agent,city_agent from {{ref('base_AUSTRALIA')}}
UNION
select agent,date_agent,city_agent from {{ref('base_EUROPE')}}
UNION
select agent,date_agent,city_agent from {{ref('base_INDIAN')}}
UNION
select agent,date_agent,city_agent from {{ref('base_PACIFIC')}}
)

 select
 {{ dbt_utils.surrogate_key(
      'agent',
      'date_agent'
  ) }} as agentid,
  *
 from merge