# Conte quantos registros há na tabela products
use Northwind;
select count(*) from products ;

#Mostra a estrutura de uma tabela
describe orders;

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

#Para ver a estrutura das tabelas
describe orders;
describe order_details;