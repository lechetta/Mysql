create database tiburcio;
	use tiburcio;
    create table cliente (
    cpf char (50) primary key,
    nome char (50)
    );
    create table carros (
    placa char (50) primary key,
    cpf char (50),
    foreign key (cpf) references cliente (cpf),
    ano char (50), 
    cod_cor char (50),
    foreign key (cod_cor) references cor (cod_cor)
    );
    select * from carros ;
    create table cor (
    cod_cor char (50) primary key,
    nome char (50)
    );
    create table servico (
    cod_servico char (50) primary key,
    servico_prestado char (100),
    tempo int(100),
    valor double
    );
    create table CarrosVSservico (
    cod_servico char (50),
    foreign key (cod_servico) references servico (cod_servico),
    placa char (50),
    foreign key (placa) references carros (placa)
    );
    
    drop table servico;
    select * from carros;
    select ca.placa, ca.ano, cli.nome, cli.cpf from carros ca inner join cliente cli on ca.cpf = cli.cpf;
    
    insert into cliente values ('9990999012','joao da silva');
    insert into cliente values ('2345678922', 'maria souza');
    insert into servico values ('1', 'balanceamento', '2', 150);
    insert into servico values ('2', 'lavagem completa','3', 35);
    select * from servico;
    
    