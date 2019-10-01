use northwind;
create procedure sp_aula16_exerc2(employee_id int)
select
	orders.employee_id,
    orders.id,
    order_details.order_id,
    count(order_details.quantity)  as Quant
	from orders
    inner join order_details on order_details.order_id = orders.id
    where orders.employee_id = employee_id;
    
    call sp_aula16_exerc2(1)
	