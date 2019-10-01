use northwind;

    create procedure cliente(orders_id int)
select
orders.id,
customers.first_name
from customers
inner join orders on orders.customer_id = customers.customer_id
where orders.id = orders_id;

call cliente (1);


create procedure cc(order_details.quantity)