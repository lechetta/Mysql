create view VWbc
as select count(employees.first_name)
from employees;
drop view VWbc;
select * from VWbc;

create view VWcity
as select 
employees.city,
count(employees.city)
from employees 
group by employees.city;
select * from VWcity;
drop view VWcity;

create view VWstate
as select 
employees.state_province,
count(employees.state_province)
from employees 
group by employees.state_province;
select * from VWstate;


create view VWcargo
as select 
employees.job_title,
count(employees.job_title)
from employees
group by employees.job_title;
select * from VWcargo;

