# System Design Considerations

**The application is intended to be scalable, though not insanely so. The goal
is to be able to handle 1k new URLs/day, where each URL gets 20k hits/day.**

## Metrics and Scaling

* This is a read-heavy system
* 20:1 read-to-write ratio
* QPS for the system:
  * New URLs per second:
    1,000 writes/day x 1 day/86400 seconds = 0.0115740740741 writes/s
  * Redirections per second:
    0.0115740740741 x 20 read/write ratio = 0.231481481482 reads/s
* Storage estimates:
  * assume we store every shortened URL for 5 years, the total number of stored
    objects will be: 30,000 URLs/month x 5 years x 12 months/year = 1.8M URLs
  * assume each object = ~ 500 bytes; 1.8M x 500 bytes = 0.9GB needed for
    storage

## Caching considerations

* Using 80-20 rule, 20% of URLs are assumed to generate 80% of traffic.
  1000 writes/day * .2 * 500 bytes = 100,000 bytes = 0.0001 GB

## Summary of estimates

* 0.0115740740741 writes/s
* 0.231481481482 reads/s
* 0.9GB storage for 5 years
* 0.0001 GB memory for cache

A SQL database such as PostgreSQL can handle ~ 1000 QPS, therefore no concern
for DB scaling at the moment since writes/second + reads/second fall well below
1000 QPS. Since estimation is extremely far away from the limit, no concern
for the extra read/update requests for data that contains statistics on how many
times the shortened URL was used. Memory for storage and caching are useful to
know if intend to host the application and thus need to consider how much memory
the host machine should have. In that case, can assume Rails application
instance takes 200-250 mb in memory. The application is not memory intensive at
all and even a 2 GB machine is good enough. A typical Rails app can handle
5 QPS, which is well above estimated DB QPS; therefore, this application assumes
that 1 application server is enough to handle the load and don't need to worry
about handling concurrent requests from separate Rails app servers.

## Other considerations (outside project's scope)

* No user model needed; no need to register account; no limit/quota/throttling
* No custom URLs/aliases
* No default expiration date; user manually expires URLs
