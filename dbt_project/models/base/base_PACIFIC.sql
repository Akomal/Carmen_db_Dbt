{{ config(materialized='table') }}

with source as (
    select *
    from {{ ref('raw_PACIFIC') }}
),
renamed as (
    select sight_on::date AS date_witness,
        file_on::date AS date_agent,
        report_office::text AS city_agent,
        sighter::text AS witness,
        filer::text AS agent,
        town::text AS city,
        nation::text AS country,
        lat::FLOAT AS latitude,
        long::FLOAT AS longitude,
        has_weapon,
        has_hat,
        has_jacket,
        behavior
        from source
)
select *
from renamed