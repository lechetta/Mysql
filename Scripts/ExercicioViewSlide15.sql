
#exercicio 1a
create view exercicio1 as 
select
c.first_name,
c.id,
o.ship_address,
o.ship_city,
o.ship_state_province,
od.quantity,
p.product_name,
od.product_id
from customers c 
inner join orders o on o.customer_id = c.id
inner join order_details od on od.order_id = o.id
inner join products p on p.id = od.product_id;

select * from exercicio1;

 #exercicio 1b         
select * from exercicio1 where ship_city = 'Las Vegas';


#exercicio 2a
create view VWexercicio2 as 
select 
e.first_Name as NomeDoFuncionario ,
e.id as IDdoFuncionario,
e.job_title as CargoDoFuncionario,
c.first_name as nomeCliente,
c.id as IDdoCliente,
o.ship_city,
p.product_name as NomeProduto,
s.company as EmpresaDeTransporte
from employees e
inner join orders o on e.id = o.employee_id
inner join customers c on c.id = o.customer_id
inner join shippers s on s.id = o.shipper_id
inner join order_details od on o.id = od.order_id
inner join products p on p.id = od.product_id
order by e.id;

select * from VWexercicio2;
#exercicio 2b
select * from VWexercicio2 where ship_city = 'Denver';
 
 
 #exercicio3
 create view VWexercicio3 as
 select
 e.id,
 e.first_name as nome,
 od.quantity as qtd,
 od.unit_price as preco,
 sum(unit_price * quantity) as total
 from employees e
 inner join orders o on e.id = o.employee_id
 inner join order_details od on o.id = od.order_id
 group by e.id;
 
 drop view VWexercicio3;
 
 select 
 nome,
 qtd,
 preco,
 truncate(total, 2) as totalVenda
 from VWexercicio3;

 #exercicio4a
 create view VWexercicio4a as 
 select 
 e.first_name,
 sum(od.unit_price) as totalPreco,
 sum(unit_price * od.quantity ) as totalVenda
 from employees e 
 inner join orders o on o.employee_id = e.id
 inner join order_details od on od.order_id = o.id
 group by e.first_name;
 
 select * from VWexercicio4a;
 
  #exercicio4b
  create view VWexercicio4b as 
  select 
  e.first_name,
 sum(od.unit_price) as totalPreco,
 sum(od.quantity ) as totalProdutos
 from employees e 
 inner join orders o on o.employee_id = e.id
 inner join order_details od on od.order_id = o.id
 group by e.first_name;
 
  select * from VWexercicio4b;
 
   #exercicio4c
     create view VWexercicio4c as 
  select 
  c.first_name,
 sum(od.unit_price) as totalPreco,
 sum(od.quantity ) as totalProdutos
 from customers c 
 inner join orders o on o.customer_id = c.id
 inner join order_details od on od.order_id = o.id
 group by c.first_name;
 
  select * from VWexercicio4c;
  
  #exercicio4d
  
  create view VWexercicio4d as 
  select 
  sum(o.shipping_fee),
  o.ship_city,
  s.company,
  e.first_name
  from orders o 
  inner join shippers s on s.id = o.shipper_id
  inner join employees e on e.id = o.employee_id
  group by o.ship_city;
  
  select * from VWexercicio4d;
  
  
  #exercicio4e
  
  create view VWexercicio4e as
  select 
  p.product_name,
  p.category,
  od.status_id
  from products p 
  inner join order_details od on od.product_id = p.id
  inner join order_details_status ods on ods.id = od.status_id
  group by od.status_id;
  
  select * from VWexercicio4e;
  
   #exercicio4f
   create view VWexercicio4f as 
   select
   po.quantity,
   po.unit_cost,
   sum(unit_cost * quantity) as total,
   su.company
   from purchase_order_details  po
   inner join purchase_orders p on p.id = po.purchase_order_id
   inner join suppliers su on su.id = p.supplier_id
   group by su.company;
   
   select * from VWexercicio4f;
   
    #exercicio4g
  
  create view VWexercicio4g as 
  select 
  p.product_name,
  pod.quantity,
  sum(pod.unit_cost * quantity) as total,
  pod.date_received
  from products p
  inner join purchase_order_details pod on pod.product_id = p.id
  inner join purchase_orders po on po.id = pod.purchase_order_id
  group by p.product_name;
  
  select * from VWexercicio4g;