{% snapshot accepted_snapshot %}
{%set new_schema=target.schema + '_snapshot'%}
  {{
        config(
          target_schema=new_schema,
          strategy='check',
          unique_key='agentid',
          check_cols='all',
        )
    }}

select * from {{ ref('stg_agent') }}


{% endsnapshot %}