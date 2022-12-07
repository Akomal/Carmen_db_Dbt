{{ config(materialized='table') }}

with merge as (
select witness,date_witness,latitude,longitude from {{ref('base_AFRICA')}}
UNION ALL
select witness,date_witness,latitude,longitude from {{ref('base_AMERICA')}}
UNION ALL
select witness,date_witness,latitude,longitude from {{ref('base_ASIA')}}
UNION ALL
select witness,date_witness,latitude,longitude from {{ref('base_ATLANTIC')}}
UNION ALL
select witness,date_witness,latitude,longitude from {{ref('base_AUSTRALIA')}}
UNION ALL
select witness,date_witness,latitude,longitude from {{ref('base_EUROPE')}}
UNION ALL
select witness,date_witness,latitude,longitude from {{ref('base_INDIAN')}}
UNION ALL
select witness,date_witness,latitude,longitude from {{ref('base_PACIFIC')}}
)

 select
 {{ dbt_utils.surrogate_key(
      'witness',
      'date_witness'
  ) }} as witnessid,
  *
 from merge


