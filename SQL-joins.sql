use srinu;

create table a(pk int, value varchar(20), primary key(pk));

create table b(pkb int, value varchar(20), primary key(pkb));

insert into a values(1, "FOX"), (2, "COP"), (3, "TAXI"), (6, "WASHINGTON"), (7, "DELL"),
					(5, "ARIZONA"), (4, "LINCOLN"), (10, "LUCENT");
                    
insert into b values(1, "TROT"), (2, "CAR"), (3, "CAB"), (6, "MONUMENT"), (7, "PC"),
					(8, "MICROSOFT"), (9, "APPLE"), (10, "SCOTCH");
                    
select * from a;
select * from b;
                    
select * from a full join b; -- on a.pk = b.pkb;

select * from a,b where a.pk = b.pkb;

select * from a,b where a.pk > b.pkb;

select * from a inner join b on a.pk > b.pkb;

select * from a left outer join b on a.pk = b.pkb;

select * from a right outer join b on a.pk = b.pkb;

-- select * from a full  join b on a.pk = b.pkb;

select * from a left join b on a.pk = b.pkb union select * from a right join b on a.pk = b.pkb;


