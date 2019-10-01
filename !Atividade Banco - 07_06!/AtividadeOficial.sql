create database divertido;
	use divertido;
  
  create table cliente (
    cpf char(50) primary key,
    nome char (50),
    data date
    );
    
    insert into cliente values ('2645789', 'gustavo', '1999/08/26');
	insert into cliente values ('9874563', 'victor', '1945/09/08');
	insert into cliente values ('784630122', 'jesus', '2014/06/22');
	insert into cliente values ('7854632', 'ricardo', '1998/03/16');
    select * from cliente;
    
    create table servico(
    cod_servico char(50) primary key,
    servico char(50)
    );
    
    insert into servico values ('1', '1 tela');
	insert into servico values ('2', '2 telas');
	insert into servico values ('3', '2 telas HD');
	insert into servico values ('4', '3 telas HD');
	insert into servico values ('5', '4 telas Full HD');
	insert into servico values ('6', '3 telas Full HD');
	insert into servico values ('7', '2 telas 4k');
    
    create table plano(
    id_plano char(50) primary key,
    plano char(50)
    );
    
    insert into plano values ('1', 'normal');
    insert into plano values ('2', 'medio');
    insert into plano values ('3', 'premium');
    insert into plano values ('4', 'vip');
    
    create table categoria (
    cod_categoria char(50) primary key,
    categoria char(50),
    preco dec(3,2)
    );
    
    insert into categoria values ('1', 'terror', '1');
    insert into categoria values ('2', 'guerra', '2');
    insert into categoria values ('3', 'policial', '3');
    insert into categoria values ('4', 'comedia', '3');
    
    create table ServicoXCategoria(
    cod_servico char(50),
    foreign key (cod_servico) references servico (cod_servico),
    cod_categoria char(50),
    foreign key (cod_categoria) references categoria (cod_categoria),
    primary key (cod_servico, cod_categoria)
    );
    
    insert into ServicoXCategoria values ('1', '1');
    insert into ServicoXCategoria values ('2', '1');
    insert into ServicoXCategoria values ('3', '1');
    insert into ServicoXCategoria values ('4', '1');
    insert into ServicoXCategoria values ('5', '1');
    insert into ServicoXCategoria values ('6', '1');
    insert into ServicoXCategoria values ('7', '1');
     insert into ServicoXCategoria values ('1', '2');
    insert into ServicoXCategoria values ('2', '2');
    insert into ServicoXCategoria values ('3', '2');
    insert into ServicoXCategoria values ('4', '2');
    insert into ServicoXCategoria values ('5', '2');
    insert into ServicoXCategoria values ('6', '2');
    insert into ServicoXCategoria values ('7', '2');
     insert into ServicoXCategoria values ('1', '3');
    insert into ServicoXCategoria values ('2', '3');
    insert into ServicoXCategoria values ('3', '3');
    insert into ServicoXCategoria values ('4', '3');
    insert into ServicoXCategoria values ('5', '3');
    insert into ServicoXCategoria values ('6', '3');
    insert into ServicoXCategoria values ('7', '3');
     insert into ServicoXCategoria values ('1', '4');
    insert into ServicoXCategoria values ('2', '4');
    insert into ServicoXCategoria values ('3', '4');
    insert into ServicoXCategoria values ('4', '4');
    insert into ServicoXCategoria values ('5', '4');
    insert into ServicoXCategoria values ('6', '4');
    insert into ServicoXCategoria values ('7', '4');
    
    
    create table franquia (
    cod_franquia char(50) primary key,
    franquia char(50)
    );
    
    insert into franquia values ('1', '10 creditos');
     insert into franquia values ('2', '20 creditos');
     insert into franquia values ('3', '30 creditos');
     
    
    create table consumo (
    id_consumo char(50) primary key not null,
    tipo_consumo char(50),
    cod_franquia char(50),
    foreign key (cod_franquia) references franquia (cod_franquia),
    cod_servico char(50),
    cod_categoria char(50),
    foreign key (cod_servico, cod_categoria) references  ServicoXCategoria (cod_servico, cod_categoria) ,
    cpf char(50),
    foreign key (cpf) references cliente (cpf),
	id_plano char(50),
    foreign key (id_plano) references plano (id_plano)
    );
  
    insert into consumo values('1', 'familia', '1', '7', '2', '2645789', '1');
	insert into consumo values('2', 'solo', '2', '7', '2', '2645789', '4');
    insert into consumo values('3', 'dupla', '3', '5', '1',  '9874563', '2');
	insert into consumo values('4', 'esquadrao', '2', '5', '1',  '9874563', '3');
    
    create table opcao (
    cod_opcao char(50) primary key,
    opcao char(50)
    );
    
    insert into opcao values ('1', 'pre pago');
    insert into opcao values ('2', 'pos pago');
    
    
    create table forma(
    cod_forma char(50) primary key not null,
    forma char(50),
    cod_opcao char(50),
    foreign key (cod_opcao) references opcao (cod_opcao),
    cpf char(50),
    foreign key(cpf) references cliente (cpf)
    );
 
    insert into forma values ('1', 'cartao de credito', '1', '2645789');
    insert into forma values ('2', 'boleto', '2', '9874563');
    
    
    select cliente.nome, consumo.cpf, consumo.tipo_consumo, consumo.cod_servico, consumo.cod_categoria, consumo.cod_franquia
    from cliente 
	inner join consumo
    on cliente.cpf = consumo.cpf;
    
    select sum(preco), consumo.cod_categoria, consumo.cod_servico, consumo.tipo_consumo, consumo.cpf from categoria inner join consumo;
    
    select ServicoXCategoria.cod_servico, ServicoXCategoria.cod_categoria from ServicoXCategoria;
    
	select forma.forma, forma.cod_opcao, forma.cpf, categoria.categoria, categoria.preco from forma inner join categoria;