create database normal2
	use normal2
    
    create table projeto (
    cod_projeto char (50) primary key,
    descricao char (140), 
    tipo char (100)
    );
    create table empregado (
    cod_empregado char (50) primary key,
    nome char (50),
    categoria char (100),
    salario char(100)
    );
    create table servico (
     cod_projeto char (50),
    foreign key (cod_projeto) references projeto (cod_projeto),
    cod_empregado char(50),
    foreign key (cod_empregado) references empregado (cod_empregado),
    data_inicio char(50), 
    tempo_alocado char (50)
    );
    

    drop table empregado 
select * from empregado
describe servico
    insert into projeto values ('LSC001', 'sistema de estoque', 'novo desenvolvimento')
    insert into empregado values ('2146', 'joao', 'a1', '4')
    insert into empregado values ('3145', 'silvio', 'a2', '4')
    insert into empregado values ('6156', 'jose', 'b1', '9')
    update empregado set cod_empregado = '6126' where cod_empregado = '6156'
    
    insert into empregado values ('1214', 'carlos', 'a2', '4')
    insert into empregado values ('8191', 'mario', 'a1', '4')
    insert into empregado values ('4112', 'joao', 'a2', '4')
    select * from empregado
    insert into projeto values ('PAG02', 'sistema de RH', 'manutenção')
    insert into servico values ('PAG02', '8191', '01/05/93', '12')
    insert into servico values ('PAG02', '4112', '04/01/91', '24')
    insert into servico values ('PAG02', '6126', '01/11/92', '12')
    insert into servico values ('LSC001', '2146', '1/11/91', '24')
    insert into servico values ('LSC001', '6126', '3/10/92', '18')
    insert into servico values ('LSC001', '3145', '2/10/91', '24')
    insert into servico values ('LSC001', '1214', '4/10/92', '18')
    insert into servico values ('LSC001', '8191', '1/11/92', '12') 
    
    
    
    select * from projeto 
    select * from empregado
    select * from servico