# Conte quantos registros há na tabela products
use Northwind;
select count(*) from products;

#Mostra a estrutura de uma tabela
describe orders;

Select * from employees
Inner join Orders on employees.id = orders.employee_id
Where employees.id = 210;

select Employees.first_name, Employees.last_name, orders.id, orders.order_date, orders.Order_status  from employees inner join orders on employees.id = orders.employee_id group by orders.id asc;
select orders.id, orders.Order_status, customers.first_Name, customers.email, customers.company from orders inner join customers on customers.id = orders.customer_id group by orders.id asc;
SELECT 
    orders.id,
    orders.order_date,
    orders.Order_status,
    customers.first_Name,
    customers.last_name,
    customers.email,
    customers.city
FROM
    orders
        INNER JOIN
    customers ON customers.id = orders.customer_id
WHERE
    customers.city = 'New Orleans'
GROUP BY id ASC;
#contar quantos clientes ha na tabela customers
Select count(*) from customers;
#Contar quantos clientes há em cada cidade na tabema Customers
Select city, count(*) from customers group by city asc;
#contar quantos produtos ha em cada categoria
select category, count(*) from products group by category asc;

#Selecionar a quantidade média de produtos vendidos na tabela Order_Details
Select avg(Quantity) from order_details;
#Selecionar a quantidade média de produtos vendidos na tabela Order_Details, por produto
Select product_id, avg(Quantity) from order_details group by product_id;
#Selecione a o valor médio em cada venda  (unit_price)
select product_id, avg(unit_price) from order_details group by product_id;
#Somar a quantidade de produtos vendidos na tabela Order_Details
Select Sum(Quantity) from order_details;
#Somar a quantidade de produtos vendidos na tabela Order_Details, por produto
Select Sum(Quantity) from order_details group by product_id;
#somar total vendido por produto
select product_id, sum(unit_price) from order_details group by order_id desc;



#contar quantas vendas (tabela Orders) foram realizadas por cidade
# (ship_city)
# para determinar a cidade em que houve mais vendas, o uso do order não é recomendado
# porque retorna vários registros
select 	ship_city,
		count(*) as qtd_vendas 
        from orders 
        group by ship_city
        order by qtd_vendas desc;
#Quantas unidades foram vendidas em todas as vendas
describe order_details;
select sum(quantity) from order_details;

#mostrar as quantidades, preços e dscontos de todas as vendas
select 
	quantity, 
    discount,
    quantity*unit_price - discount 
    from order_details;
#somar as quantidades, descontos e o total liquido
select 
	sum(quantity) as quantidade_total, 
    sum(discount) as total_descontos,
    sum( quantity*unit_price - discount) as TotalLiquido
    from order_details;

#mostrar o total liquido por produto
select 
	product_id,
    sum(quantity*unit_price-discount)as total_liquido
    from order_details
    group by product_id;

#mostrar a média do total liquido por produto
select 
	product_id,
    avg(quantity*unit_price-discount)as total_liquido_medio
    from order_details
    group by product_id;

#mostrar a média do total liquido por produto mas em cada cidade
select 
	ship_city,
	product_id,
    avg(quantity*unit_price-discount)as total_liquido_medio
    from order_details
    INNER JOIN orders on order_details.order_id = orders.id
    group by product_id, ship_city;
    
#Limitar a quantidade de linhas exibidas
select * from products limit 5;


select orders.id, employees.last_name, employees.first_name
from orders
left join employees on orders.employee_id = employees.id
order by orders.id;

select orders.id, employees.last_name, employees.first_name
from orders
right join employees on orders.employee_id = employees.id
order by orders.id;

select orders.id, employees.last_name, employees.first_name
from orders
inner join employees on orders.employee_id = employees.id
order by orders.id;

select customers.first_name, orders.id
from customers
left join orders on customers.id = orders.customer_id
order by customers.first_name asc;








# EXERCÍCIOS PRÁTICOS
/*
1 -Quantos funcionários há no banco de dados da empresa?
2 -Quantos funcionários por cidade?
3 -Quantos funcionários por estado (state)?
4 -Quantos funcionários há por "cargo" (job_title)
5 -Qual foi o total ($) geral em produtos vendidos?
6 -Qual foi o total liquido vendido por vendedor?
7 -Qual foi a média (em$) das vendas de cada vendodor?
8 -Qual foi o total vendido para cada cliente?
9 -Quais foram os produtos e respectivos  preços unitários comprados por cada cliente?
10-A empresa paga 2% de comissão aos vendedores. Calcule a comissão que cada vendedor deve ter recebido
11-A empresa deseja saber quais são os três produtos mais vendidos em quantidade
12-A empresa deseja saber quais são os três produtos mais vendidos em $
13-Quem são os top 5 clientes da empresa?
*/
select count(*) from employees;
select city, count(*) from employees group by city;
select state, count(*) from employees group by state;
select job_title, count(*) from employees group by job_title;
select sum(unit_price) from order_details;
select 
	orders.id,
    sum(quantity*unit_price-discount)as total_liquido
    from order_details
    inner join orders
    on orders.id = order_details.order_id
    group by orders.id;


#outros exercicios 
select product_name, quantity_per_unit from products group by product_name;
select product_name, quantity_per_unit from products group by quantity_per_unit asc;
select product_name, quantity_per_unit from products group by quantity_per_unit desc;
select product_code, product_name from products where discontinued = 0;
select product_code, product_name, discontinued from products  where discontinued = 1;
select products.id, products.standard_cost, products.product_name, order_details.unit_price from products 
inner join order_details on products.id = order_details.product_id where products.standard_cost <=20;


#Para ver a estrutura das tabelas

describe orders;
describe order_details;