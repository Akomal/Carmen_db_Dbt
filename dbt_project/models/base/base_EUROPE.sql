{{ config(materialized='table') }}
with source as (
    select *
    from {{ ref('raw_EUROPE') }}
),
renamed as (
    select date_witness,
        date_filed::date AS date_agent,
        region_hq::text AS city_agent,
        witness,
        agent,
        city,
        country,
        lat_::FLOAT AS latitude,
        long_::FLOAT AS longitude,
        "armed?" AS has_weapon,
        "chapeau?" AS has_hat,
        "coat?" AS has_jacket,
        observed_action::text AS behavior
        from source
)
select *
from renamed