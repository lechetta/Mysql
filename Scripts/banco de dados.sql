create database cantina;
use cantina;

create table cliente (
cpf char (50) primary key,
nome char (100),
data char (50)
);
describe cliente;


create table contato (
cpf char (50),
foreign key (cpf) references cliente (cpf),
cod_tipo char(50),
foreign key (cod_tipo) references tipo_telefone(cod_tipo),
numero char (50)
);

insert into contato values ('123.456.789-11', 01, '419987412563');
insert into contato values ('123.456.789-11', 03, '34478596');
insert into contato values ('321.654.978-01', 01, '4125450125');
insert into contato values ('321.654.978-01', 01, '41789653214');
insert into contato values ('321.654.978-01', 03, '344785961');
insert into contato values ('321.654.978-01', 02, '58746932');
insert into contato values ('321.654.978-01', 02, '369874521');
insert into contato values ('654.345.332-91', 02, '6257841');

describe contato;


create table tipo_telefone (
cod_tipo char (50) primary key,
tipo char (50)
);

insert into tipo_telefone values (01, 'celular');
insert into tipo_telefone values (02, 'comercial');
insert into tipo_telefone values (03, 'residencial');
describe tipo_telefone;


create table produto (
id_produto char (50) primary key,
nome char (100),
custo decimal (4,2) null default '0.00',
preco decimal (4,2) null default '0.00',
categoria char (50),
foreign key (categoria) references categoria (categoria)
);
describe produto;



create table consumo (
id_produto char (50),
foreign key (id_produto) references produto (id_produto),
numero_comanda char (50), 
foreign key (numero_comanda) references comanda (numero_comanda),
quantidade char (50)
);
insert into consumo values (03, 1, 2);
insert into consumo values (01, 1, 3);
insert into consumo values (04, 2, 1);
insert into consumo values (02, 2, 2);
insert into consumo values (04, 3, 1);
insert into consumo values (03, 3, 3);
insert into consumo values (02, 3, 2);
insert into consumo values (05, 4, 1);
insert into consumo values (04, 5, 1);
insert into consumo values (05, 5, 6);
insert into consumo values (02, 5, 3);
describe consumo;


create table comanda (
numero_comanda char (50) primary key,
cpf char (50),
foreign key (cpf) references cliente (cpf),
cod_atendente char (50),
foreign key (cod_atendente) references atendente (cod_atendente),
data_consumo char (50)
);
drop table comanda;
insert into comanda values (1, '456.987.123-22', 1, '01/01/2018');
insert into comanda values (2, '654.345.332-91', 3, '01/01/2018');
insert into comanda values (3, '123.456.789-11', 1, '10/02/2018');
insert into comanda values (4, '654.345.332-91', 2, '11/02/2018');
insert into comanda values (5, '321.654.978-01', 1, '10/02/2018');
describe comanda;


create table atendente (
cod_atendente char(50) primary key,
nome char (50)
);
insert into atendente values (01, 'tonho');
insert into atendente values (02, 'purga');
insert into atendente values (03, 'chinela');
describe atendente;

create table categoria (
categoria char (50) primary key,
nome_categoria char (50)
);
describe categoria;

insert into cliente values ('123.456.789-11', 'ana maria aparecida', '01/01/1985');
insert into cliente values ('321.654.978-01',	'Pedro de Lara',	'01/08/1938');
insert into cliente values ('456.987.123-22',	'Maria Antonia da Silva',	'10/09/2000');
insert into cliente values ('654.345.332-91',	'Napoleão de Souza e Silva',	'15/11/1994');
select * from cliente;

insert into produto values (01, 'risoles', 2.00, 3.50, 03);
insert into produto values (02, 'pastel', 1.20, 3.50, 03);
insert into produto values (03, 'coca cola 350ml', 2.6, 4.7, 01);
insert into produto values (04, 'fanta uva 350ml', 2.6, 4.7, 01);
insert into produto values (05, 'ovo cozido', 0.30, 3.00, 05);
select * from produto;

insert into categoria values (01, "bebidas");
insert into categoria values (02, "assados");
insert into categoria values (03, "fritos");
insert into categoria values (04, "bomboniere");
insert into categoria values (05, "frios e conservas");
select * from categoria;


# questao 4
select * from cliente;
select * from cliente where nome like '%d%';
select cliente.nome, cliente.cpf, cliente.data, tipo_telefone.tipo, contato.numero from cliente inner join contato on cliente.cpf = contato.cpf inner join tipo_telefone on tipo_telefone.cod_tipo = contato.cod_tipo;
select cliente.nome, cliente.cpf, cliente.data, contato.numero, contato.cod_tipo from cliente inner join contato on cliente.cpf = contato.cpf  where cod_tipo = 03; 
select comanda.cpf, comanda.cod_atendente, comanda.numero_comanda, consumo.id_produto from comanda inner join consumo on comanda.numero_comanda = consumo.numero_comanda;
select consumo.id_produto, comanda.cod_atendente from comanda inner join consumo on comanda.numero_comanda = consumo.numero_comanda where cod_atendente = 1;
select cod_atendente, sum(id_produto) from consumo inner join comanda group by cod_atendente;
select id_produto, sum(id_produto) from consumo inner join comanda group by id_produto;
select comanda.cpf, consumo.id_produto from comanda inner join consumo on comanda.numero_comanda = consumo.numero_comanda;
select cpf, sum(id_produto) from consumo inner join comanda group by cpf;

Select comanda.numero_comanda, Sum(id_produto) from consumo inner join comanda group by numero_comanda;
select comanda.cpf, sum(id_produto) from consumo inner join comanda group by cpf;
select consumo.id_produto, sum(id_produto) from consumo group by id_produto;
select comanda.cpf, consumo.id_produto from comanda inner join consumo where cpf='321.654.978-01';
select consumo.id_produto, sum(id_produto) from comanda inner join consumo on comanda.numero_comanda = consumo.numero_comanda order by id_produto;



