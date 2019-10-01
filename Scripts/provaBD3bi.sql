use northwind;
	
  
 #EXERCICIO 1 
 
  create view VWexercicio1 as 
    select 
    p.product_code as CodigoProduto,
    p.product_name as NomeProduto,
    s.first_name as NomeFornecedor,
    p.standard_cost as Custo,
    p.list_price as PrecoVenda,
    p.quantity_per_unit as Quantidade,
	itt.type_name as TipoTransacao,
    it.id as ID_Transacao,
    it.transaction_type as ID_tipo_Transacao,
    it.quantity as QTD_transacao
    from products p 
	inner join suppliers s on s.id = p.supplier_ids
    inner join inventory_transactions it on p.id = it.product_id
    inner join inventory_transaction_types itt on itt.id = it.transaction_type
    order by p.product_code;
   
   
   select * from VWexercicio1;




#EXERCICIO 2



create procedure exerc2(transaction_code int, produto_cod int)
select 
    p.product_code as CodigoProduto,
    p.product_name as NomeProduto,
    s.first_name as NomeFornecedor,
    p.standard_cost as Custo,
    p.list_price as PrecoVenda,
    p.quantity_per_unit as Quantidade,
	itt.type_name as TipoTransacao,
    it.id as ID_Transacao,
    it.transaction_type as ID_tipo_Transacao,
    it.transaction_created_date,
    sum(it.quantity) as total_movimentado
    from products p 
	inner join suppliers s on s.id = p.supplier_ids
    inner join inventory_transactions it on p.id = it.product_id
    inner join inventory_transaction_types itt on itt.id = it.transaction_type
    where it.id = transaction_code and p.id = produto_cod
    group by it.transaction_created_date;

call exerc2(67,1);

drop procedure exerc2;


#select * from inventory_transactions;
#select id from products;

#exercicio 3 

create table movimentacoes(
product_cod int(11),
product_name varchar(144),
qtd_Purchased int(11),
qtd_Sold int(11),
qtd_OnHold int(11),
qtd_Waste int(11)
);

select * from movimentacoes;

drop table movimentacoes;
drop procedure exerx3;

Delimiter $$
create procedure exerx3(in c_cod_produto int(11))
Begin 
	declare c_terminou integer default 0;
	declare c_product_cod int (11) default ' ';
	declare c_product_name varchar(144) default ' ';
    declare c_qtd_Purchased int (11) default ' ';
    declare c_qtd_Sold int (11) default ' ';
    declare c_qtd_OnHold int (11) default ' ';
    declare c_qtd_Waste int (11) default ' ';
	declare c_tipo varchar(144) default ' ';
	declare c_preco int(11) default ' ';
	declare c_quantidade int(11) default ' ';
	declare c_total float default ' ';

	declare busca_cursor cursor for
    
		select
        p.id,
        p.product_name,
        p.list_price,
        it.transaction_type,
        it.quantity
		from products p 
        inner join inventory_transactions it on p.id = it.product_id
		where p.id = c_cod_produto;
        
        
        
        
         declare continue handler 
				for not found set c_terminou =1;
   
	open busca_cursor;
    while c_terminou != 1 do
		 if(c_cod_produto = 0 || c_cod_produto != 0) then
        fetch busca_cursor into c_product_cod, c_product_name, c_preco, c_tipo, c_quantidade;
        if c_tipo = 'Purchased' then
			set c_qtd_Purchased = sum(c_quantidade);
             end if;
				if c_tipo = 'Sold' then 
					set c_qtd_Sold = sum(c_quantidade);
                    end if;
						if c_tipo = 'On Hold' then
						set c_qtd_OnHold = sum(c_quantidade);
                         end if;
								if c_tipo = 'Waste' then
                                	set c_qtd_Waste = sum(c_quantidade);
                                    end if;
	
													
			
		insert into movimentacoes(product_cod, product_name, qtd_Purchased, qtd_Sold, qtd_OnHold, qtd_Waste) values ( c_product_cod, c_product_name, c_qtd_Purchased, c_qtd_Sold, c_qtd_OnHold, c_qtd_Waste);
        
	  end if;
	end while;
  
    close busca_cursor;
    
	
End$$
Delimiter ;


call exerx3();
select * from products;










#EXERCICIO 4

create table produtos2(
id_produto int(11) primary key,
produto varchar(144),
preco_custo float,
preco_lista float,
qtd_estoque varchar (50)
);

#drop table produtos2;
#drop procedure exerc4;


Delimiter $$
create procedure exerc4(id int,
    nome varchar(50),
    preco_custo float,
    preco_lista float,
    qtd_estoque varchar (50))
Begin
	declare c_terminou integer default 0;
   
	declare c_id_produto int(11) default ' ';
	declare c_produto varchar(144) default ' ';
    declare c_preco_custo float default ' ';
	declare c_preco_lista float default ' ';
 	declare c_qtd_estoque varchar (50) default ' ';   
    
	declare busca_cursor cursor for
		select 
        p.id,
        p.product_name,
        p.standard_cost,
        p.list_price,
        p.quantity_per_unit
		from products p
        where p.id = id and p.product_name = nome and p.standard_cost = preco_custo and p.list_price = preco_lista and p.quantity_per_unit = qtd_estoque
        group by p.id;
        
         declare continue handler 
				for not found set c_terminou =1;
    
	open busca_cursor;
    while c_terminou != 1 do
		fetch busca_cursor into c_id_produto, c_produto, c_preco_custo, c_preco_lista, c_qtd_estoque;
		if exists(select id from produtos2) then
			update produtos2 set produtos2.id_produto = id, 
			produtos2.produto = produto, 
			produtos2.preco_custo = preco_custo,
			produtos2.preco_lista = preco_lista,
			produtos2.qtd_estoque = qtd_estoque
			where produtos2.id_produto = id;
				else
					insert into produtos2( id_produto, produto, preco_custo, preco_lista, qtd_estoque) values (c_id_produto, c_produto, c_preco_custo, c_preco_lista, c_qtd_estoque);
			end if;

	end while;
    close busca_cursor;
   
	
End$$
Delimiter ;

call  exerc4 (3, 'Northwind Traders Syrup', 7.5000, 10.0000, '12 - 550 alterado');

select * from produtos2;





