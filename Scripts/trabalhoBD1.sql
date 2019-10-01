create database normal
use normal
create table aluno (
matricula char (50) primary key,
nome char (50)

);
create table curso (
curso char(50) primary key,
matricula char (50),
foreign key (matricula) references aluno (matricula)
);
create table materia (
matricula char (50), 
foreign key (matricula) references aluno (matricula),
curso char(50),
foreign key (curso) references curso (curso),
disciplina char (50) primary key
);
create table situacao (
disciplina char(50),
foreign key (disciplina) references materia (disciplina),
ano char (50), 
situacao char (50)
)
describe situacao 
insert into aluno values ('336451', 'antonio aparecido da silva')
insert into curso values ('bacharelado em sistemas de informação', '336451')
insert into materia values ('336451', 'bacharelado em sistemas de informação', 'algoritmos e estrutura de dados')
insert into materia values ('336451', 'bacharelado em sistemas de informação', 'desenvolvimento de software')
insert into materia values ('336451', 'bacharelado em sistemas de informação', 'banco de dados')
insert into materia values ('336451', 'bacharelado em sistemas de informação', 'aplicativos moveis')
insert into materia values ('336451', 'bacharelado em sistemas de informação', 'analise e projeto de sistemas') 
select * from aluno
insert into situacao values('algoritmos e estrutura de dados', '1', 'matriculado')
insert into situacao values('desenvolvimento de software', '1', 'matriculado')
insert into situacao values('banco de dados', '1', 'matriculado')
insert into situacao values('aplicativos moveis', '2', 'pendente')
insert into situacao values('analise e projeto de sistemas', '2', 'pendente')
select * from situacao
select * from curso
select * from materia 

