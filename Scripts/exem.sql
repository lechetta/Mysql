use northwind;
select count(*) from products;
describe orders;

select ship_city, count(*) as qtd_vendas from orders group by ship_city;
select ship_city, count(*) as qtd_vendas from orders group by ship_city order by qtd_vendas desc;
#para determinar a cidade 
describe order_details;
#quantas unidades foram vendidas em todas as vendas
select sum(quantity) from order_details;
#mostrar as quantidades, preços e descontos de todas as vendas 
select 
	quantity, 
	unit_price, 
	discount, quantity * unit_price - discount as subtotalLiquido 
	from order_details;
    
select 
	sum(quantity) as quantidade, 
	sum(unit_price) as total_precounitario, 
	sum(discount) total_desconto
	from order_details;

#somar as quantidades, descontos e o total liquido    
select 
	sum(quantity) as quantidade,
	sum(discount) total_desconto,
    sum(quantity * unit_price - discount) as totalliquido
	from order_details;

#mostrar o total liquido por produto
select 
	product_id,
    sum(quantity*unit_price-discount) as TotalLiquido
    from order_details
    group by product_id;

#mostrar a media do totalliquido por produto
select 
	product_id,
    avg(quantity*unit_price-discount) as media_TotalLiquido
    from order_details
    group by product_id;

select 
	ship_city,
	product_id,
    avg(quantity*unit_price-discount) as media_TotalLiquido
    from order_details
    inner join orders on order_details.order_id = orders.id
    group by product_id, ship_city;

describe orders;
describe order_details;

#limitar a quantidade de linhas exibidas 
select * from products limit 5;
