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