{{
    config(
        materialized='table'
    )
}}

--{% set dept_emp_cnt = '2' %}

select c.country_name,l.city,count(d.department_id) as emp_count from {{ ref('raw_country') }} c 
   inner join {{ ref('raw_location') }} l on c.country_id = l.country_id
   inner join {{ ref('raw_department') }} d on d.location_id = l.location_id 
   where d.department_id in (select e.department_id
     from {{ ref('raw_employee') }} e
   group by e.department_id 
   having count(e.department_id) >=2) group by c.country_name,l.city