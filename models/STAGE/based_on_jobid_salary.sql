{{
    config(
        materialized='table'
    )
}}


{%- set job_ids = ['AD_PRES','IT_PROG','ST_CLERK','SA_REP'] -%}

select e.job_id,
{%- for j_id in job_ids -%}
sum(case when e.job_id = '{{j_id}}' then e.salary end) as {{j_id}}_tot_amt
{% if not loop.last %},{% endif %}
{%- endfor -%}
 from {{ ref('raw_employee') }} e group by e.job_id