create procedure sp_invoices ()
	select * from invoices;

Call sp_invoices ();


create procedure sp_invoices_by_id(id int)
select 
	i.id, 
    i.order_id, 
    i.invoice_date,
    i.tax, 
    i.shipping, 
    i.amount_due
    from invoices i where i.id = id;
    
call sp_invoices_by_id(29);

create procedure sp_orders(employee_id int, customer_id int)
select 
	o.id,employee_id, 
	o.customer_id, 
	o.order_date, 
	o.shipper_id, 
	o.ship_name, 
	o.ship_address, 
	o.ship_city, 
	o.status_id 
    from orders o 
    where o.employee_id = employee_id and o.customer_id=customer_id;

call sp_orders(1,1)