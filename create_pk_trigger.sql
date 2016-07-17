-- create trigger to resolve users_test pk table
create or replace trigger tg_pk_users_test
before insert on users_test
for each row
begin
  select users_test_seq.nextval
  into   :new.id
  from   dual;
end;
