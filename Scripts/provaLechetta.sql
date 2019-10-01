create database gustavo;
	use gustavo;
  
##questao 1 

    create table funcionario(
    id_emp int primary key,
    nome varchar(50)
    );
    
    insert into funcionario values (100, 'margarida');
    insert into funcionario values (140, 'helio');
	insert into funcionario values (110, 'cristovao');
	insert into funcionario values (190, 'lourenço');
	insert into funcionario values (150, 'susana');
    
    create table depart(
    id_depart int primary key,
    nome_depart varchar(50)
    );

	insert into depart values (1, 'marketing');
	insert into depart values (2, 'financeira');
	insert into depart values (3, 'sistemas de informação');
	insert into depart values (4, 'contabilidade');


    create table curso (
    id_curso int primary key,
    nome_curso varchar(50)
    );
    
    insert into curso values (1, 'SPSS');
    insert into curso values (2, 'pesquisa');
    insert into curso values (3, 'IVA');
    insert into curso values (4, 'C++');
    insert into curso values (5, 'investimen');
    insert into curso values (6, 'TQM');
    
    create table FuncionarioXDepart (
    id_emp int,
    foreign key(id_emp) references funcionario (id_emp),
    id_depart int,
    foreign key(id_depart) references depart (id_depart),
    salario dec(6,4)
    );
     
    insert into  FuncionarioXDepart values (100, 1, '42.000');
    insert into  FuncionarioXDepart values (140, 2, '39.000');
    insert into  FuncionarioXDepart values (110, 3, '41.500');
    insert into  FuncionarioXDepart values (190, 4, '38.000');
    insert into  FuncionarioXDepart values (150, 1, '38.500');
   
   

   
    create table CursoXFuncionario(
    id_emp int,
    foreign key(id_emp) references funcionario (id_emp),
    id_curso int,
    foreign key(id_curso) references curso (id_curso),
    data_conclusao date
    );
    insert into CursoXFuncionario values (100, 1, '2002/06/19');
     insert into CursoXFuncionario values (100, 2, '2002/10/07');
      insert into CursoXFuncionario values (140, 3, '2002/12/08');
       insert into CursoXFuncionario values (110, 1, '2002/12/01');
        insert into CursoXFuncionario values (110, 4, '2002/04/22');
         insert into CursoXFuncionario values (190, 5, '2002/05/07');
           insert into CursoXFuncionario values (150, 1, '2002/06/19');
            insert into CursoXFuncionario values (150, 6, '2003/08/12');
           
select funcionario.nome, 
	FuncionarioXDepart.salario,
     CursoXFuncionario.id_curso,
      CursoXFuncionario.data_conclusao
		from funcionario 
        inner join FuncionarioXDepart 
        on funcionario.id_emp = FuncionarioXDepart.id_emp 
        inner join  CursoXFuncionario on  CursoXFuncionario.id_emp = funcionario.id_emp
        where FuncionarioXDepart.salario > '40.000';
        


##questao 2 
create table livro(
id_livro int primary key,
livro varchar(50)
);

insert into livro values (1, 'Técnicas de aprendizado de máquina');
insert into livro values (2, 'Matemática para newbies');


create table professor(
cod_prof int primary key,
nome varchar(50)
);

insert into professor values (1, 'joao marcelo');
insert into professor values (2, 'pedro silva');
insert into professor values (3, 'adriana souza');
insert into professor values (4, 'mario costa');
insert into professor values (5, 'carlos castanheda');
insert into professor values (6, 'felipe inocencio');
insert into professor values (7, 'pedro de lara');


create table cursoquestao2 (
id_curso int primary key, 
curso varchar(50)
);

insert into cursoquestao2 values (1, 'BSI');
insert into cursoquestao2 values (2, 'ciencia de dados');
insert into cursoquestao2 values (3, 'engenharia de software');

create table cursoXlivroXPro(
cod int primary key,
id_curso int,
foreign key (id_curso) references cursoquestao2 (id_curso),
id_livro int, 
foreign key (id_livro) references livro (id_livro),
cod_prof int,
foreign key (cod_prof) references professor (cod_prof)
);



insert into cursoXlivroXPro values  (1, 1, 1, 1);
insert into cursoXlivroXPro values (2, 1, 1, 2);
insert into cursoXlivroXPro values (3, 1, 1, 3);
insert into cursoXlivroXPro values (4, 1, 2, 5);
insert into cursoXlivroXPro (cod, id_curso, cod_prof) values (5, 2, 3);
insert into cursoXlivroXPro (cod, id_curso, cod_prof) values (6, 2, 4);
insert into cursoXlivroXPro (cod, id_curso, cod_prof) values (7, 2, 1);
insert into cursoXlivroXPro (cod, id_curso, cod_prof) values (8, 3, 5);
insert into cursoXlivroXPro (cod, id_curso, cod_prof) values (9, 2, 6);
insert into cursoXlivroXPro (cod, id_curso, cod_prof) values (10, 2, 7);



##questao 4 
#INNER JOIN SELECIONA TODOS OS ELEMENTOS EM COMUM ENTRE UMA TABELA A e B.
#RIGHT JOIN SELECIONA TODOS OS ELEMENTOS DA TABELA DA DIREITA E OS ELEMENTOS EM COMUM COM A OUTRA 
#LEFT JOIN SELECIONA TODOS OS ELEMENTOS DA TABELA DA ESQUERDA E OS ELEMENTOS EM COMUM COM A OUTRA
        
        
## questao 5
		create table equipe(
        cod_func int primary key,
        nome_func char(50),
        cpf_funcionario char(50),
        cod_chefia int,
        foreign key (cod_chefia) references equipe (cod_func)
        );
        
        insert into equipe (cod_func, nome_func, cpf_funcionario) values (1, 'vitoria', '457854');
		insert into equipe values (2, 'pedro', '47854', 1);
		insert into equipe values (3, 'ana maria', '78546', 1);
        insert into equipe values (4, 'silvio', '74856', 1);
        insert into equipe values (5, 'carlos', '66652', 3);
        insert into equipe values (6, 'paula', '98745', 3);
        insert into equipe values (7, 'cristiana', '145875', 3);
        insert into equipe values (8, 'antonio', '475821', 6);
        insert into equipe values (9, 'eduardo', '457852', 6);
        insert into equipe values (10, 'anelise', '52136', 4);
        insert into equipe values (11, 'cintia', '65893', 4);
        insert into equipe values (12, 'mario', '78542', 4);
        insert into equipe values (13, 'vilma', '47856', 10);
        insert into equipe values (14, 'fernando', '78546', 10);
        insert into equipe values (15, 'paulo', '00123', 12);
        insert into equipe values (16, 'andre', '4520', 12);
        
        
select e2.nome_func as nome, e1.nome_func as NomeChefe, e2.cod_chefia from equipe e1 right join equipe e2 on e2.cod_chefia = e1.cod_func;

