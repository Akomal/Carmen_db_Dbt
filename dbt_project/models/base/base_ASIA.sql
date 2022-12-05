{{ config(materialized='table') }}

with source as (
    select *
    from {{ ref('raw_ASIA') }}
),
renamed as (
    select sighting::date as date_witness,
        报道::date as date_agent,
        city_interpol::text AS city_agent,
        citizen::text as witness,
        officer::text as agent,
        city,
        nation::text as country,
        纬度::FLOAT as latitude,
        经度::FLOAT as longitude,
        has_weapon,
        has_hat,
        has_jacket,
        behavior
        from source
)
select *
from renamed