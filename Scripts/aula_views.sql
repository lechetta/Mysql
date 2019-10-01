create database aula_views;
use aula_views;
create table departamento(
deptoID varchar(10) primary key,
depto varchar(30)
);

create table item(
itemID varchar(10) primary key,
item varchar(30)
);

create table requisicoes(
reqID varchar(10) primary key,
deptoID varchar(10),
itemID varchar(10),
qtd int,
precounit float,
foreign key (deptoID) references departamento(deptoID),
foreign key (itemID) references item(itemID)
);

insert into departamento values
('D001','RH'), 
('D002','Financeiro'), 
('D003','Producao'),
('D004','TI');

insert into item values
('I001','Papel'),
('I002','Caneta'),
('I003','NoteBook'),
('I004','Impressora');

insert into requisicoes values
('Q001','D002', 'I001',500,0.3),
('Q002','D004', 'I002',40,2.5),
('Q003','D001', 'I003',5,3000),
('Q004','D001', 'I004',2,650),
('Q005','D001', 'I003',2,3000);