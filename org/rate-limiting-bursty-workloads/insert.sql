\set id random(0, 10000)

with ins_or_upt as (
     insert into rate_limit as x (id)
     values (:id)
         on conflict(id) do
     update set tokens = x.tokens - 1
      where x.id = excluded.id
        and x.tokens > 0
  returning tokens
)
select tokens
  from ins_or_upt
 union all
select 0
 limit 1
