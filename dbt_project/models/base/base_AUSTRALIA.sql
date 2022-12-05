{{ config(materialized='table') }}

with source as (
    select *
    from {{ ref('raw_AUSTRALIA') }}
),
renamed as (
    select witnessed::date AS date_witness,
        reported::date AS date_agent,
        interpol_spot::text AS city_agent,
        observer::text AS witness,
        field_chap AS agent,
        place::text AS city,
        nation::text AS country,
        lat::FLOAT AS latitude,
        long::FLOAT AS longitude,
        has_weapon,
        has_hat,
        has_jacket,
        state_of_mind::text AS behavior
        from source
)
select *
from renamed