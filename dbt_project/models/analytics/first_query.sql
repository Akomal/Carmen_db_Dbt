





select
  city_agent, date_witness

from {{ source('analytics_db', 'stg_agent') }}
join {{ source('analytics_db', 'stg_witness') }}
 using (witnessid)

