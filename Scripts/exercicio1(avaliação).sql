create database aluno;
use aluno;
create table aluno (
matricula char (50) primary key,
cpf char (50),
nome char (50)
);
select * from aluno;
describe aluno;


create table tipo_telefone(
cod_tipo char (50) primary key,
tipo char (50)
);

create table contato (
matricula char (50),
foreign key (matricula) references aluno (matricula),
cod_tipo char (50), 
foreign key (cod_tipo) references tipo_telefone (cod_tipo),
numero char (50)
);

create table tipo_endereco (
cod_endereco char (50) primary key,
tipo char (50)
);


create table endereco (
matricula char (50),
foreign key (matricula) references aluno (matricula),
cod_endereco char (50), 
foreign key (cod_endereco) references tipo_endereco (cod_endereco),
endereco char (50)
);
