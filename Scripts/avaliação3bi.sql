create database avaliacao;
	use avaliacao;
    
    create table associados(
    matricula int(4),
    nome varchar(30),
    cpf varchar(30),
    genero varchar(30),
    data_nascimento varchar(30),
    celular varchar(30),
    primary key(matricula, cpf)
    );
    
    create table dependentes(
	matricula_associado int (4),
    foreign key(matricula_associado) references associados (matricula),
    nome_dependente varchar(30),
    cpf_dependente varchar(50) primary key,
    data_nascimento_dependente varchar(30),
    genero_dependente varchar(30),
    Grau_parentesco varchar(30),
    celular_dependente varchar(30)
    );
    select * from associados;
    
    insert into associados values(123, 'gustavo', '1478545200', 'masculino', '26/08/1990', '41578428541');
	insert into associados values(1234, 'jessica', '25478965212', 'feminino', '12/10/1995', '415789652300');
    
	insert into dependentes values (123, 'Gabriela', '12475212', '10/02/2005', 'feminino', 'filha', null);
	insert into dependentes values (1234, 'Gabriel', '74854632100', '10/02/2010', 'masculino', 'filho', null);
    
	create view VWfamilia
    as select a.matricula,
    a.nome,
    a.cpf,
    a.genero,
    a.data_nascimento,
    a.celular,
    d.matricula_associado,
    d.nome_dependente,
    d.cpf_dependente,
    d.data_nascimento_dependente,
    d.genero_dependente,
    d.Grau_parentesco,
    d.celular_dependente
    from associados a
    inner join dependentes d on a.matricula = d.matricula_associado
    group by a.matricula;
    
    select * from VWfamilia where cpf_dependente = '12475212';
    select * from associados inner join dependentes on associados.matricula = dependentes.matricula_associado;
