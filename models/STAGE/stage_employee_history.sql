{{
    config(
        materialized='table'
    )
}}

  select job_title,department_name,concat(e.first_name,'',e.last_name) as fullname
   from {{ ref('raw_employee') }} e inner join {{ ref('raw_job_history') }} jh on e.employee_id = jh.employee_id
   and jh.start_date between '1993-01-01' and '1997-08-31' inner join {{ ref('raw_jobs') }} j on j.job_id=jh.job_id
   inner join {{ ref('raw_department') }} d on d.department_id = jh.department_id