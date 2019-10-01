create database exerc1
use exerc1;
create table clientes (
cpf char (50) primary key,
nome char (40),
email char (50)
); 
create table documentos (
cod_documento char (60) primary key,
cpf char (50),
foreign key(cpf) references clientes(cpf),
nome_documento char (50), 
numero_documento char (50)
);
insert into clientes values ('123098567-01', 'ana maria souza', 'ana@gmail.com'); 
insert into documentos values ('1', '123098567-01', 'passaporte', '0234501');
insert into documentos values('2', '123098567-01', 'RG', '32145');
select * from documentos 
describe clientes
select * from clientes;
drop table clientes
insert into clientes values ('345678098-99', 'joao da silva', 'js@outlook.com');
insert into documentos values ('3', '345678098-99', 'diploma de graduação', '20010104');
insert into documentos values ('4', '345678098-99', 'RG', '33445');
select * from clientes; 





