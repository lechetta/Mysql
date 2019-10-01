/*1 - conta de admin*/
create user 'admin'@'%' identified by 'SenhaMassa123@';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';
/*2 - conta da Aplicacao*/
create user 'App'@'%' identified by 'App001';
GRANT SELECT,INSERT,UPDATE,DELETE ON *.* TO 'App'@'%';
/*3 - conta do desenvolvedor*/
create user 'Dev'@'%' identified by 'Dev123';
Grant SELECT,INSERT,UPDATE,DELETE,create,drop ON nova_era.* to 'Dev'@'%'; 
/*4 - Conta backup*/
create user 'backup'@'localhost';

create database trabalho2510;
	use trabalho2510;

create table funcao(
id_funcao int (3) primary key,
funcao varchar(50)
);
insert into funcao values (1, 'vendedor');

create table usuario(
id_login int(3) primary key,
nome varchar(50),
senha varchar(50),
ativo int,
id_funcao int (3),
foreign key (id_funcao) references funcao (id_funcao),
user_role varchar(30),
email varchar(30)
);
insert into usuario values (1, 	'gustavo', 'naosei', 1, 1, 'usuario', 'gg@');




create table cliente(
id_cliente int(3) primary key,
nome varchar(50)
);

insert into cliente values(1, 'joao');

create table telefone(
id_cliente int(3),
foreign key (id_cliente) references cliente (id_cliente),
telefone varchar(30)
);


create table entrada_produto(
id int(11) not null auto_increment primary key,
id_produto int(11),
qtde int(11),
valor_unitario decimal(9,2),
data_entrada date
);

create table saida_produto(
id_saida int(11) not null auto_increment primary key,
id_produto_saida int(11),
qtde_saida int(11),
valor_unitario_saida decimal(9,2),
data_saida date
);

create table estoque(
id_estoque int(11) not null auto_increment primary key,
id_produto_estoque int(11),
qtde_estoque int(11),
valor_unitario decimal(9,2) default 0.00
);
 
 create table produtos(
codigo int(6) primary key,
nome varchar(44),
descricao varchar(144),
fabricante varchar(44),
id_estoque int,
foreign key (id_estoque) references estoque(id_estoque)
);

insert into produtos values (1, 'teclado', 'nao sei', 'positivo', 4);


create table ordem(
id_ordem int primary key,
id_login int,
foreign key (id_login) references usuario (id_login),
id_cliente int,
foreign key (id_cliente) references cliente (id_cliente),
tipo_pagto varchar(50)
);

insert into ordem values (1, 1, 1, 'cartao');
insert into ordem values (2, 1, 1, 'cartao');

create table ordem_vendas(
id_vendas int primary key,
id_produto int,
foreign key(id_produto) references produtos (codigo),
id_ordem int,
foreign key (id_ordem) references ordem (id_ordem),
quantidade int,
preco_venda double(6,2),
data_venda datetime
);
select * from ordem_vendas;
insert into ordem_vendas values (1, 1, 1, 2, 200.00, '2018-10-25');
insert into ordem_vendas values (2, 1, 2, 2, 200.00, '2018-11-07');

select id_vendas, id_Produto, id_ordem, data_venda, sum(quantidade * preco_venda) from ordem_vendas
	where month(data_venda) = '10'
    group by id_vendas, id_produto, id_ordem, data_venda;

create table vendas_dia_semana(
segunda dec(12,2),
terca dec(12,2),
quarta dec(12,2),
quinta  dec(12,2),
sexta dec(12,2),
sabado  dec(12,2),
domingo dec(12,2)
);

#insert into vendas_dia_semana values(400.00, 200.00, 1000.00, 500.00, 600.00, 900.00, 700.10);
#select * from vendas_dia_semana;
#drop table vendas_dia_semana;

select sum(o.quantidade * o.preco_venda) from ordem_vendas o;


select dayofweek('2018-10-25');
select month('12');

Delimiter $$
create procedure TotalDiaSemana(c_dia int)
Begin
	declare c_terminou integer default 0;
   
	declare c_id_vendas int (11) default 0;
	declare c_id_produto int (11) default 0;
	declare c_id_ordem int (11) default 0;
	declare c_quantidade int  default 0;
    declare c_preco_venda double(6,2) default 0;
    declare c_data_venda datetime default 0;
    declare c_total dec(12,2) default 0;
    declare c_segunda dec(12,2) default 0;
	declare c_terca dec(12,2) default 0;
    declare c_quarta dec(12,2) default 0;
    declare c_quinta dec(12,2) default 0;
    declare c_sexta dec(12,2)  default 0;
    declare c_sabado dec(12,2)  default 0;
    declare c_domingo dec(12,2) default 0;
	
   
	declare busca_cursor cursor for
		select 
        o.id_vendas,
        o.id_produto,
        o.id_ordem,
        o.data_venda,
        o.quantidade,
        o.preco_venda,
        sum(quantidade * preco_venda) as total
		from ordem_vendas o
        where dayofweek(o.data_venda) = c_dia
        group by o.id_vendas, o.id_produto, o.id_ordem, o.data_venda;
        
        
         declare continue handler 
				for not found set c_terminou =1;
    
  #select c_dia;
  
	open busca_cursor;
     select c_dia;

    while c_terminou != 1 do
		fetch busca_cursor into c_id_vendas, c_id_produto, c_id_ordem, c_data_venda, c_quantidade, c_preco_venda,  c_total;
		  if c_dia = 1 then
			#set c_total =(c_preco_venda * c_quantidade) + c_total;
            set c_domingo = c_total;
             end if;
				if c_dia = 2 then 
					#set c_total =(c_preco_venda * c_quantidade) + c_total;
					set c_segunda = c_total;
                    end if;
						if c_dia = 3 then
						#set c_total = (c_preco_venda * c_quantidade) + c_total;
                        set c_terca = c_total ;
                         end if;
								if c_dia = 4 then
                                	#set c_total = (c_preco_venda * c_quantidade) + c_total;
									set c_quarta = c_total;
                                    end if;
											if c_dia = 5 then
												#set c_total = (c_preco_venda * c_quantidade) + c_total;
                                                set c_quinta = c_total;
                                                      end if;
													if c_dia = 6 then
															#set c_total = (c_preco_venda * c_quantidade) + c_total;
															set c_sexta = c_total;  
																end if;
                                                                if c_dia = 7 then
                                                   # set c_total = (c_preco_venda * c_quantidade) + c_total;
														set c_sabado = c_total;
                                                         end if;
													
		select c_dia;	
	end while;
		insert into vendas_dia_semana(segunda, terca, quarta, quinta, sexta, sabado, domingo) values (c_segunda, c_terca, c_quarta, c_quinta, c_sexta, c_sabado, c_domingo);


    select * from vendas_dia_semana;
    
    close busca_cursor;
   
	
End$$
Delimiter ;

call TotalDiaSemana(4);

select * from vendas_dia_semana;
#truncate table  vendas_dia_semana;
drop procedure  TotalDiaSemana;
drop table vendas_dia_semana;

create table Vendas_mes(
janeiro dec(12,2),
fevereiro dec(12,2),
marco dec(12,2),
abril dec(12,2), 
maio dec(12,2), 
junho dec(12,2), 
julho dec(12,2), 
agosto dec(12,2), 
setembro dec(12,2), 
outubro dec(12,2),
novembro dec(12,2),
dezembro dec(12,2)
);



Delimiter $$
create procedure TotalMes(c_mes int)
Begin
	declare c_terminou integer default 0;
   
	declare c_id_vendas int (11) default 0;
	declare c_id_produto int (11) default 0;
	declare c_id_ordem int (11) default 0;
	declare c_quantidade int default 0;
    declare c_preco_venda double(6,2) default 0;
    declare c_data_venda datetime default 0;
    declare c_total dec(12,2) default 0;
    declare c_janeiro dec(12,2) default 0;
	declare c_fevereiro dec(12,2) default 0;
    declare c_marco dec(12,2) default 0;
    declare c_abril dec(12,2) default 0;
    declare c_maio dec(12,2)  default 0;
    declare c_junho dec(12,2)  default 0;
    declare c_julho dec(12,2) default 0;
	declare c_agosto dec(12,2) default 0;
    declare c_setembro dec(12,2) default 0;
    declare c_outubro dec(12,2) default 0;
    declare c_novembro dec(12,2) default 0;
    declare c_dezembro dec(12,2) default 0;
    

	declare busca_cursor cursor for
		select 
        o.id_vendas,
        o.id_produto,
        o.id_ordem,
        o.data_venda,
        o.quantidade,
        o.preco_venda,
        sum(quantidade * preco_venda) as total
		from ordem_vendas o
        where month(o.data_venda) = c_mes
        group by o.id_vendas, o.id_produto, o.id_ordem, o.data_venda;
        
        
         declare continue handler 
				for not found set c_terminou =1;
    
  #select c_dia;
  
	open busca_cursor;
    while c_terminou != 1 do
		fetch busca_cursor into c_id_vendas, c_id_produto, c_id_ordem, c_data_venda, c_quantidade, c_preco_venda, c_total;
		  if c_mes = 1 then
            set c_janeiro = c_total;
             end if;
				if c_mes = 2 then 
					set c_fevereiro = c_total;
                    end if;
						if c_mes = 3 then
                        set c_marco = c_total;
                         end if;
								if c_mes = 4 then
									set c_abril = c_total;
                                    end if;
											if c_mes = 5 then
                                                set c_maio = c_total;
                                                      end if;
													if c_mes = 6 then
															set c_junho = c_total; 
																end if;
																	if c_mes = 7 then
																		set c_julho = c_total; 
																			end if;
																				if c_mes = 8 then
																					set c_agosto = c_total; 
																						end if;
																							if c_mes = 9 then
																								set c_setembro = c_total; 
																									end if;
																										if c_mes = 10 then
																											set c_outubro = c_total; 
																												end if;
																													if c_mes = 11 then
																														set c_novembro = c_total; 
																															end if;
																																if c_mes = 12 then
																																	set c_dezembro = c_total; 
																																		end if;
                                                
													
			
	end while;
    		insert into  Vendas_mes(janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro) values (c_janeiro, c_fevereiro, c_marco, c_abril, c_maio, c_junho, c_julho, c_agosto, c_setembro, c_outubro, c_novembro, c_dezembro);

    select * from  Vendas_mes;
    
    close busca_cursor;
   
	
End$$
Delimiter ;

call TotalMes(11);
drop procedure TotalMes;
drop table  Vendas_mes;

Delimiter $$
Create Trigger trg_Entrada_Prod after insert on entrada_produto
for each row
begin
	call SP_AtualizaEstoque (new.id_produto, new.qtde,new.valor_unitario );
end $$
Delimiter ;

Delimiter $$
create trigger trg_Entrada_Prod_AU after update on entrada_produto
for each row
Begin
	call SP_AtualizaEstoque (new.id_produto,new.qtde - old.qtde,new.valor_unitario);
End $$
Delimiter ;

Delimiter $$
create trigger trg_Entrada_Prod_AD after delete on entrada_produto
for each row
begin
	call SP_AtualizaEstoque (old.id_produto, old.qtde *-1,old.valor_unitario);
end $$
Delimiter ;

/*Trigger para saida de produtos*/

DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AI AFTER INSERT ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto_saida, new.qtde_saida * -1, new.valor_unitario_saida);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AU AFTER UPDATE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto_saida, old.qtde_saida - new.qtde_saida, new.valor_unitario_saida);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AD AFTER DELETE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto_saida, old.qtde_saida, old.valor_unitario_saida);
END $$
DELIMITER ;

#SP atualiza estoque
Delimiter $$
create procedure SP_AtualizaEstoque(id_prod int,qtde_comprada int,valor_unit decimal(9,2))
begin
	declare contador int(11);
    select count(*) into contador from estoque where id_estoque = id_prod;
    if contador > 0 then
		update estoque set qtde=qtde+qtde_comprada, valor_unitario=valor_unit
        where id_produto = id_prod;
	else
		insert into estoque(id_estoque,qtde_estoque,valor_unitario) values (id_prod,qtde_comprada,valor_unit);
	end if;
end $$
Delimiter ;
drop procedure SP_AtualizaEstoque;
