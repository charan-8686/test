{{ config(materialized='table',
   alias='emp_tgt')
}}

select
*
from {{var("src_tbl")}}
qualify row_number() over(partition by {{var("ukey")}} order by {{var("ts_col")}} desc)=1