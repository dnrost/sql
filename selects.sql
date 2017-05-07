-- tests with any and some
-- IN - Equal to any member in the list
-- ANY - Compare value to **each** value returned by the subquery
-- ALL - Compare value to **EVERY** value returned by the subquery

-- < ANY() - less than maximum
-- > ANY() - more than minimum
-- = ANY() - equivalent to IN
-- > ALL() - more than the maximum
-- < ALL() - less than the minimum

-- returns all names unless the oldest one 
select u.name from users_test u
where u.age < some(select t.age from users_test t)

-- returns all names unless the youngest one 
select u.name from users_test u
where u.age > some(select t.age from users_test t)
