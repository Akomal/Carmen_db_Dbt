{{ config(materialized='table') }}

with source as (
    select *
    from {{ ref('raw_ATLANTIC') }}
),
renamed as (
    select date_witness,
        date_agent,
        region_hq::text AS city_agent,
        witness,
        agent,
        city,
        country,
        latitude::FLOAT,
        longitude::FLOAT,
        has_weapon,
        has_hat,
        has_jacket,
        behavior
        from source
)
select *
from renamed