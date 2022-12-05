{{ config(materialized='table') }}

with merge as (
select witness,date_witness,latitude,longitude from {{ref('base_AFRICA')}}
UNION
select witness,date_witness,latitude,longitude from {{ref('base_AMERICA')}}
UNION
select witness,date_witness,latitude,longitude from {{ref('base_ASIA')}}
UNION
select witness,date_witness,latitude,longitude from {{ref('base_ATLANTIC')}}
UNION
select witness,date_witness,latitude,longitude from {{ref('base_AUSTRALIA')}}
UNION
select witness,date_witness,latitude,longitude from {{ref('base_EUROPE')}}
UNION
select witness,date_witness,latitude,longitude from {{ref('base_INDIAN')}}
UNION
select witness,date_witness,latitude,longitude from {{ref('base_PACIFIC')}}
)

 select
 {{ dbt_utils.surrogate_key(
      'witness',
      'date_witness'
  ) }} as witnessid,
  *
 from merge


