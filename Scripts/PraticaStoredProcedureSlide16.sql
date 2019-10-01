use northwind;

	
  create procedure total_vendido (employee_id int)
  select 
  o.employee_id,
  od.quantity,
  od.unit_price,
  sum(unit_price * quantity) as total_vendido
  from orders o
  inner join order_details od on o.id = od.order_id
  group by o.employee_id;
  
	#drop procedure total_vendido;
    
    call total_vendido(1);