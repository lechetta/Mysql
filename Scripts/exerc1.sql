use northwind;
drop procedure sp_aula16_exerc1;
create procedure sp_aula16_exerc1(orders_id int)
select
orders.id,
orders.customer_id,
customers.first_name

from orders
inner join customers on customers.id = orders.customer_id
where customers.id = orders_id;
    
	

call sp_aula16_exerc1(10);