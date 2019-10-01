create database aula2
    use aula2
    
    
    create table produtos (
    cod_produto char (10) primary key,
    descricao char (144),
    nome char (50)
    );
   
   create table pecas (
   cod_peca char (10) primary key,
   nome_peca char (50),
   cod_produto char (10),
   foreign key(cod_produto) references produtos(cod_produto)
   );
    
   
   
   select * from produtos;
   insert into produtos(cod_produto, descricao, nome) values ('1', 'automovel marca subaru', 'impreza');
   insert into produtos(cod_produto, descricao, nome) values ('2', 'automovel marca 68', 'maverick');
   insert into pecas(cod_peca, nome_peca, cod_produto) values ('p001', 'banco bipartido', '1')
   select * from pecas;
   
      insert into pecas(cod_peca, nome_peca, cod_produto) values ('p002', 'pistao', '2')
      
      
#atualizar o nome do produto 02 de maverick para mavecao


update produtos set nome = 'mavecao' where cod_produto = '2'

#atualizar o nome subaru para del rey, cod_produto 1

update produtos set nome = 'del rey' where cod_produto= '1'
update produtos set descricao = 'so segura quem tem braço' where cod_produto = '1'
update produtos set cod_produto = '3' where cod_produto = '1'
update produtos set descricao = 'so segura quem tem braço' where cod_produto = '2'
select * from produtos;
select * from pecas;

delete from pecas where cod_peca = 'p001'
delete from produtos where cod_produto = '1'


# exercicios 
create database exerc1
use exerc1
create table clientes (
	cpf char (20) primary key,
    nome char (60),
    email char (60) );
    
    create table documentos (
    cod_documento char (10),
    nome_documento char (60),
    numero_documento char(10) );
    