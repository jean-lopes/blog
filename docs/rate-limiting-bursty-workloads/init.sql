create unlogged table rate_limit(
  id          int not null,
  tokens      smallint not null default 9 check(tokens >= 0 and tokens <= 10),
  primary key (id)
);

create index on rate_limit
 using btree(tokens)
 where tokens < 10;

select cron.schedule(
       '1 second',
       $$ update rate_limit
             set tokens = tokens + 1
           where tokens < 10 $$);
