
CREATE USER 'admin'@'%' IDENTIFIED BY '123456789';
		GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';
		
drop USER admin;

drop database trabalho2510;

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


create table produtos(
codigo int(6) primary key,
nome varchar(44),
descricao varchar(144),
fabricante varchar(44),
estoque int,
preco_custo double (6,2),
preco_venda double(6,2)
);

insert into produtos values (1, 'teclado', 'nao sei', 'positivo', 4, 144.00, 200.00);


create table ordem(
id_ordem int primary key,
id_login int,
foreign key (id_login) references usuario (id_login),
id_cliente int,
foreign key (id_cliente) references cliente (id_cliente),
tipo_pagto varchar(50)
);

insert into ordem values (1, 1, 1, 'cartao');

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

insert into ordem_vendas values (1, 1, 1, 2, 200.00, '2018-10-25');



select sum(o.quantidade * o.preco_venda) from ordem_vendas o;


select dayofweek('2018-10-25')


Delimiter $$
create procedure TotalDiaSemana(in c_dia int)
Begin
	declare c_terminou integer default 0;
   
	declare c_id_vendas int default ' ';
	declare c_id_produto int default ' ';
	declare c_id_ordem int default ' ';
	declare c_quantidade int default ' ';
    declare c_preco_venda double(6,2) default ' ';
    declare c_data_venda datetime default ' ';
    declare c_total double(6,2) default ' ';
	
    
    
	declare busca_cursor cursor for
		select 
        o.id_vendas,
        o.id_produto,
        o.c_id_ordem,
        o.quantidade,
        o.preco_venda,
        o.data_venda
		from ordem_vendas o
        where dayofweek(o.data_venda) = c_dia;
				
         declare continue handler 
				for not found set c_terminou =1;
    
   select c_dia;
	open busca_cursor;
    while c_terminou != 1 do
		fetch busca_cursor into  c_id_vendas, c_id_produto, c_id_ordem, c_quantidade, c_preco_venda, c_data_venda;
		set c_total = sum(c_preco_venda * c_quantidade);
        

	end while;
    close busca_cursor;
   
	
End$$
Delimiter ;

call TotalDiaSemana(5);


