-- create the table users_test
create table users_test(
id number,
name varchar2(500),
age number);

-- create sequence for pk
create sequence users_test_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 2;

-- create trigger to resolve users_test pk table
create or replace trigger tg_pk_users_test
before insert on users_test
for each row
begin
  select users_test_seq.nextval
  into   :new.id
  from   dual;
end;

-- insert some data into table
insert into users_test (name, age) values('Newton', 10);
insert into users_test (name, age) values('Keppler', 11);
insert into users_test (name, age) values('Plato', 12);
insert into users_test (name, age) values('Galileo', 13);
insert into users_test (name, age) values('Locke', 14);

select u.name from users_test u
where u.age > some(select t.age from users_test t)
