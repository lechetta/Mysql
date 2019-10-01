create database bella;
use bella;
create table cliente (
cpf char (50) primary key,
nome char (50)
);
insert into cliente values ('345.567.890-00', 'Maria da Silva');
insert into cliente values ('123.654.987-11',' Ana do Santos');
insert into cliente values ('321.543.654-22', 'ana dos santos');

create table tipo_telefone (
cod_tipo char (50) primary key,
tipo char (50)
);
insert into tipo_telefone values (1, 'comercial');
insert into tipo_telefone values (2, 'residencial');
insert into tipo_telefone values (3, 'celular');



create table contato (
cpf char (50),
foreign key (cpf) references cliente (cpf),
cod_tipo char(50), 
foreign key (cod_tipo) references tipo_telefone(cod_tipo),
numero char (50)
); 
insert into contato values ('345.567.890-00',3, '41 98765 8456');
insert into contato values ('123.654.987-11', 3, '41 98990 1234');
insert into contato values ('321.543.654-22', 3, '41 984235456');


create table endereco (
tipo_endereco char (50),
cpf char (50), 
foreign key (cpf) references cliente (cpf),
endereco char (50),
bairro char(50),
cidade char (50),
uf char(50)
);
insert into endereco values ('residencial', '345.567.890-00', 'Rua das Margaridas, 33', 'Pilarzinho', 'curitiba', 'PR');
insert into endereco values ('residencial', '123.654.987-11', 'Rua Alegria, 234', 'santo inacio', 'curitiba', 'PR');
insert into endereco values ('residencial', '321.543.654-22', 'Rua 21 de Abril, 1430', 'alto da xv', 'curitiba', 'PR');


create table email (
cod_email char (50) primary key,
cpf char (50), 
foreign key (cpf) references cliente (cpf),
email char (50)
);
insert into email values (1, '345.567.890-00', 'msilva@gmail.com');
insert into email values (2, '123.654.987-11' ,'anasantos@gmail.com');
insert into email values (3, '321.543.654-22', 'ana_dos_santos@hotmail.com');

create table atendimento(
cod_atendimento char (50) primary key,
cpf char (50), 
foreign key (cpf) references cliente (cpf),
data char (50),
hora char (50)
);


create table procedimento (
cod_procedimento char (50) primary key,
procedimento char (50),
preco char (50)
);

insert into procedimento values ('L01', 'Laser facial', '3500.00');
insert into procedimento values ('L02', 'laser maos', '2500,00');
insert into procedimento values ('p01', 'Peeling químico face', '1200,00');
insert into procedimento values ('p02', 'Peeling químico mãos', '800');

create table consulta (
cod_atendimento char(50),
foreign key (cod_atendimento) references atendimento (cod_atendimento),
cod_procedimento char (50),
foreign key (cod_procedimento) references procedimento (cod_procedimento),
quantidade char (50)
);

#D
update contato set numero = ' 41 987658455' where cpf = '345.567.890-00';
 
#E
update endereco set endereco = 'Rua 21 de Abril, 4130' where cpf = '321.543.654-22';

#F

update cliente set nome = 'Ana Maria Barbosa dos Santos' where cpf =  '123.654.987-11';

#G

update procedimento set preco = '900,00' where cod_procedimento = 'p02';

#H

update procedimento set preco = '2750'  where cod_procedimento = 'l02';

#I

insert into atendimento values (1, '123.654.987-11', '01/04/2018', '14h00');
insert into consulta values (1, 'L01', '1');
insert into consulta values (1, 'P02', '2');
select atendimento.cpf, atendimento.data, atendimento.hora, procedimento.cod_procedimento, consulta.quantidade, procedimento.preco from atendimento inner join consulta on atendimento.cod_atendimento = consulta.cod_atendimento inner join procedimento on procedimento.cod_procedimento = consulta.cod_procedimento;

insert into atendimento values(2, '345.567.890-00', '10/04/2018', '15h00');
insert into consulta values  (2, 'P01', 1);

select atendimento.cpf, atendimento.data, atendimento.hora, procedimento.cod_procedimento, consulta.quantidade, procedimento.preco, sum(preco) from atendimento inner join consulta inner join procedimento on procedimento.cod_procedimento = consulta.cod_procedimento where cpf = '123.654.987-11';

#J

#3 forma normal
