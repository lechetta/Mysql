use northwind;
select count(*) from products;

#Mostrar a estrutura de uma tabela
describe orders;
desc order_details;

#para determinar 
select ship_city, 
	count(*) as qtd_vendas 
    from orders 
    group by ship_city
    order by qtd_vendas desc;
    
#quantas unidades vendidas em todas as vendas

select sum(quantity) from order_details;

#MOSTAR as quantidades, preços e descontos de todas as vendas
select
    quantity,
    unit_price,
    discount,
    sum((quantity*unit_price)-discount) as Subtotal_Liquido
	from order_details;
    
#somar as quantidades, descontos e o total liquido

select
    quantity,
    unit_price,
    discount,
    sum((quantity*unit_price)-discount) as Subtotal_Liquido
	from order_details;
    
#mostrar o total liquido por prod
select
	product_id,
	sum(quantity*unit_price-discount) as total_liquido
    from order_details
    group by product_id;
    
#mostrar a media do total liquido por prod
select
	product_id,
	avg(quantity*unit_price-discount) as media_total_liquido
    from order_details
    group by product_id;
    
#mostrar a media do total liquido por prod em cada cidade
select
	ship_city,
	product_id,
	avg(quantity*unit_price-discount) as media_total_liquido
    from order_details
    inner join orders on order_details.order_id = orders.id
    group by product_id,ship_city;
    
