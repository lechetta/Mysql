describe employees;

#1
select count(id) as total_funcionario from employees; 

#2
select city, count(id) from employees group by city;

#3
select state, count(id) from employees group by state;

#4
select job_title, count(id) from employees group by job_title;

#5
select sum(unit_price*quantity-discount) as total from order_details;

#6
select employees.id, employees.first_name sum(

#7
select avg(

#8
select customers.id, customers.first_name,
	sum(unit_price*quantity-discount) 
	as total from order_details 
	inner join orders
	on  orders.id = order_details.order_id
	inner join customers
    on customers.id = orders.customer_id  
	group by customers.id, customers.first_name;
    
describe orders
describe order_details;
describe customers;