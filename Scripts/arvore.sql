create database arvore;
use arvore;
		
        create table equipe(
        codFunc int primary key,
        nomeFunc char(50),
        cpfFuncionario char(50),
        email char(50),
        cod_chefia int,
        foreign key (cod_chefia) references equipe (codFunc)
        );
describe equipe;

insert into equipe (codFunc, nomeFunc, cpfFuncionario, email) values ('1', 'Daniela de Souza Leão', '19872617', 'dani.leao@coisas.com.br');
insert into equipe values ('2', 'João Carlos da Silva', '78546932', 'dJ.silva@coisas.com.br', '1');
insert into equipe values ('3', 'Fernando de Oliveira', '45789652', 'F.oliveira@coisas.com.br', '1');
insert into equipe values ('4', 'Mariana da Cruz', '5647965', 'm.cruz@coisas.com.br', '3');
insert into equipe values ('5', 'Jairo de Oliveira Leão', '7896542', 'j.leao@coisas.com.br', '2');
insert into equipe values ('6', 'Giovanna da Silva', '7896542', 'j.leao@coisas.com.br', '4');
insert into equipe values ('7', 'Lucas Ribeiro Oliveira', '7896542', 'j.leao@coisas.com.br', '4');
insert into equipe values ('8', 'Helder Ribeiro Oliveira', '7896542', 'j.leao@coisas.com.br', '3');

	select e2.nomeFunc as nome, e1.nomeFunc as NomeChefe, e2.cod_chefia from equipe e1 right join equipe e2 on e2.cod_chefia = e1.codFunc;



#todos os joins, auto relacionamento, 4 e 5 formal com modelagem n pra n. 

