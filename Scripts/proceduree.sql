use northwind;
	create procedure sp_invoices ()
    select id, order_id,invoice_date from invoices;
    
    call sp_invoices();
    describe invoices;
  
  
    create procedure 
    sp_invoices_by_id(id int)
    select i.id,
    i.order_id, 
    i.invoice_date, 
    i.tax, 
    i.shipping, 
    i.amount_due
    from invoices i where i.id=id;
    
    
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


Call sp_orders(3, 8);

create table clientes (
id int primary key,
nome varchar (50),
email varchar(50)
);

select 
if (exists (select * from customers where id = 99)
 , 'existe', 'nao existe') as teste;

select 
if (exists (select * from customers where id = 9)
	,(select last_name from customers where id=9),
		'nao existe') as last_name;
##crie um sql que mostre o nome do vendedor de acordo com o id recebido 

create procedure sp_busca_employees(id int)
select if(exists(select e.first_name from employees e where e.id = id),
	(select e.first_name from employees e where e.id = id),
    'nao encontrado') as nome_vendedor;

   call  sp_busca_employees(3);
   
   
   