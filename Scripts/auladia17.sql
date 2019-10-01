create database quartaforma;
	use quartaforma;
    
    
    create table curso (
    cod_curso char (50) primary key,
    nome char (50)
    );
    
    
    create table turma(
    cod_turma char(50) primary key,
    titulo char(50),
    cod_curso char (50),
    foreign key (cod_curso) references curso (cod_curso)
    );
    
    create table cursoXdisc(
    cod_curso char(50),
    foreign key (cod_curso) references curso (cod_curso),
    cod_disc char(50),
    foreign key (cod_disc) references disciplina (cod_disc),
    primary key (cod_curso, cod_disc)
    );
    create table disciplina (
    cod_disc char(50) primary key,
    disciplina char (50)
    );

    create table cursoXdiscXturma(
    cod_turma char(50),
    foreign key (cod_turma) references turma (cod_turma),
    cod_curso char(50),
    cod_disc char(50), 
    foreign key (cod_curso, cod_disc) references cursoXdisc (cod_curso,cod_disc),
    primary key (cod_turma, cod_curso, cod_disc)
    );
    
    create table professor (
    cpf char(50) primary key,
    nome char (50)
    );
    
    create table proXcursoXdiscXturma(
    cpf char (50), 
    foreign key (cpf) references professor (cpf),
    cod_turma char(50),
    cod_curso char(50),
    cod_disc char(50),
    foreign key (cod_turma, cod_curso, cod_disc) references cursoXdiscXturma (cod_turma, cod_curso, cod_disc)
    );
    
    insert into professor values ('6669785', 'marcelo');
    insert into professor values  ('689745', 'malga');
    
    insert into disciplina values ('1', 'design de interação');
    insert into disciplina values ('2', 'engenharia de soft');
    insert into disciplina values ('3', 'desenvolvimento de soft');
    insert into disciplina values ('4', 'arquitetura');
    insert into disciplina values ('5', 'logica');
    
    insert into curso values ('1', 'bsi');
    insert into curso values ('2', 'ads');
    insert into curso values ('3', 'spi');
    insert into curso values ('4', 'engenharia da comp');
    
    insert into turma values ('1', 'turma A', '1');
    insert into turma values ('2', 'turma A', '2');
    insert into turma values ('3', 'turma A', '4');
    insert into turma values ('4', 'turma A', '3');
    insert into turma values ('5', 'turma B', '1');
    insert into turma values ('6', 'turma B', '2');
    insert into turma values ('7', 'turma B', '4');
    insert into turma values ('8', 'turma B', '3');
    insert into turma values ('9', 'turma c', '1');
    insert into turma values ('10', 'turma D', '1');
    
    select * from cursoXdisc;
    
    insert into cursoXdisc values ('1', '1');
    insert into cursoXdisc values ('1', '2');
    insert into cursoXdisc values ('1', '3');
    insert into cursoXdisc values ('1', '5');
    insert into cursoXdisc values ('1', '4');
    insert into cursoXdisc values ('2', '1');
    insert into cursoXdisc values ('2', '3');
    insert into cursoXdisc values ('3', '5');
    insert into cursoXdisc values ('4', '2');
    
    insert into cursoXdiscXturma values ('1', '1', '1');
    insert into cursoXdiscXturma values ('5', '1', '1');
    insert into cursoXdiscXturma values ('9', '1', '1');
    insert into cursoXdiscXturma values ('2', '2', '1');  
	insert into cursoXdiscXturma values ('9', '1', '2');
	insert into cursoXdiscXturma values ('3', '4', '2');
	insert into cursoXdiscXturma values ('7', '4', '2');
	insert into cursoXdiscXturma values ('5', '1', '3');
    
    insert into cursoXdiscXturma values ('1', '1', '5');
    insert into cursoXdiscXturma values ('5', '1', '5');
    insert into cursoXdiscXturma values ('10', '1', '5');
    insert into cursoXdiscXturma values ('4', '3', '5');
    insert into cursoXdiscXturma values ('8', '3', '5');
    insert into cursoXdiscXturma values ('1', '1', '4');
    insert into cursoXdiscXturma values ('5', '1', '4');
    insert into cursoXdiscXturma values ('9', '1', '4');
    insert into cursoXdiscXturma values ('10', '1', '4');
    insert into cursoXdiscXturma values ('1', '1', '3');
    insert into cursoXdiscXturma values ('9', '1', '3');
    insert into cursoXdiscXturma values ('10', '1', '3');
     
    insert into proXcursoXdiscXturma values ('6669785', '1', '1', '1');
    insert into proXcursoXdiscXturma values ('6669785', '5', '1', '1');
    insert into proXcursoXdiscXturma values ('6669785', '9', '1', '1');
    insert into proXcursoXdiscXturma values ('6669785', '2', '2', '1');
    insert into proXcursoXdiscXturma values ('6669785', '9', '1', '2');
    insert into proXcursoXdiscXturma values ('6669785', '3', '4', '2');
    insert into proXcursoXdiscXturma values ('6669785', '7', '4', '2');
    insert into proXcursoXdiscXturma values ('6669785', '5', '1', '3');
    insert into proXcursoXdiscXturma values ('689745', '1', '1', '5');
    insert into proXcursoXdiscXturma values ('689745', '5', '1', '5');
    insert into proXcursoXdiscXturma values ('689745', '10', '1', '5');
    insert into proXcursoXdiscXturma values ('689745', '4', '3', '5');
    insert into proXcursoXdiscXturma values ('689745', '8', '3', '5');
    insert into proXcursoXdiscXturma values ('689745', '1', '1', '4');
    insert into proXcursoXdiscXturma values ('689745', '5', '1', '4');
    insert into proXcursoXdiscXturma values ('689745', '9', '1', '4');
    insert into proXcursoXdiscXturma values ('689745', '10', '1', '4');
    insert into proXcursoXdiscXturma values ('689745', '1', '1', '3');
    insert into proXcursoXdiscXturma values ('689745', '9', '1', '3');
    insert into proXcursoXdiscXturma values ('689745', '10', '1', '3');
    insert into proXcursoXdiscXturma values ('689745', '6', '2', '3');
    


select curso.nome, turma.titulo, disciplina.disciplina from curso inner join turma on curso.cod_curso= turma.cod_curso inner join disciplina on disciplina.cod_disciplina = 