{{ 
    config(
        materialized="table"
        ) 
}} 

select * from dbt_transform.customer_schema.countries
