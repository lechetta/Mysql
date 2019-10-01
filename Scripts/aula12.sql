
select 
	e.first_name,
	e.last_name,
	orders.order_date,
    orders.order_status,
    order_details.product_id,
    order_details.quantity,
    order_details.unit_price,
    order_details.quantity * order_details.unit_price as subtotal_price,
    products.product_name
    from employees e
inner join Orders on e.id = orders.employee_id 
inner join order_details on orders.id = order_details.order_id 
inner join products on order_details.product_id = products.id
where e.id = 210;



select 
o.id,
e.first_name
from employees e 
inner join orders o on e.id = o.employee_id;

select 
orders.order_status,
orders.id,
customers.first_name,
customers.email,
customers.company
from orders 
inner join customers on orders.customer_id = customers.id;


#contar registros 
select 
city, 
count(*) as total_customers 
from customers 
group by city 
order by total_customers desc, city asc;
#asc = ordem alfabetica 
# desc = descendente (ordem decrescente)
select 
category,
count(*) as quantidade
from products
group by category ;

select 
product_id, 
product_name, 
sum(quantity) 
from order_details 
join products on products.id = order_details.product_id 
group by product_id, product_name desc