{{ config(materialized='table') }}

with merge as (
select country,city, has_weapon,has_hat,has_jacket,behavior from {{ref('base_AFRICA')}}
UNION
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_AMERICA')}}
UNION
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_ASIA')}}
UNION
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_ATLANTIC')}}
UNION
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_AUSTRALIA')}}
UNION
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_EUROPE')}}
UNION
select country,city,has_weapon,has_hat,has_jacket,behavior from {{ref('base_INDIAN')}}
UNION
select country,city,has_weapon,has_hat,has_jacket,behavior  from {{ref('base_PACIFIC')}}
)

 select
 {{ dbt_utils.surrogate_key(
      'country',
      'behavior'
  ) }} as suspectid,
  *
 from merge