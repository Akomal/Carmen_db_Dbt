{{ config(materialized='table') }}

with merge as (
select country,city, has_weapon,has_hat,has_jacket,behavior from {{ref('base_AFRICA')}}
UNION ALL
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_AMERICA')}}
UNION ALL
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_ASIA')}}
UNION ALL
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_ATLANTIC')}}
UNION ALL
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_AUSTRALIA')}}
UNION ALL
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_EUROPE')}}
UNION ALL
select country,city,has_weapon,has_hat,has_jacket,behavior from {{ref('base_INDIAN')}}
UNION ALL
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_PACIFIC')}}
)

 select
 {{ dbt_utils.surrogate_key(
      'country',
      'behavior'
  ) }} as suspectid,
  *
 from merge