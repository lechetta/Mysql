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


 
create table categoria(
cod_categoria char(50) primary key,
categoria char(50),
preco char(50)
);

insert into categoria values ('1', 'A', '15.55');
insert into categoria values ('2', 'B', '19.99');
insert into categoria values ('3', 'C', '23.86');


create table franquia (
cod_franquia char(50) primary key,
franquia char(50)
#preco dec(2,2)
);

insert into franquia values ('1', '10GB');
insert into franquia values ('2', '20GB');
insert into franquia values ('3', '30GB');

create table servicos (
cod_servico char(50) primary key,
servicos char(50)
#preco dec (2,2)
);

insert into servicos values ('1', '1 tela');
insert into servicos values ('2', '2 telas');
insert into servicos values ('3', '2 telas HD');
insert into servicos values ('4', '3 telas HD');
insert into servicos values ('5', '4 telas Full HD');
insert into servicos values ('6', '3 telas Full HD');
insert into servicos values ('7', '2 telas 4k');

create table ServicoxFranquiaxCategoria (
cod_franquia char(50),
foreign key (cod_franquia) references franquia (cod_franquia),
cod_servico char(50),
foreign key (cod_servico) references servicos (cod_servico),
cod_categoria char(50),
foreign key (cod_categoria) references categoria (cod_categoria),
primary key (cod_franquia, cod_servico, cod_categoria)
);

insert into ServicoxFranquiaxCategoria values ('1', '1','1'); 
insert into ServicoxFranquiaxCategoria values ('2', '1','2'); 
insert into ServicoxFranquiaxCategoria values ('3', '1','3'); 
insert into ServicoxFranquiaxCategoria values ('1', '2','1'); 
insert into ServicoxFranquiaxCategoria values ('2', '2','2'); 
insert into ServicoxFranquiaxCategoria values ('3', '2','3'); 
insert into ServicoxFranquiaxCategoria values ('1', '3','1'); 
insert into ServicoxFranquiaxCategoria values ('2', '3','2'); 
insert into ServicoxFranquiaxCategoria values ('3', '3','3'); 
insert into ServicoxFranquiaxCategoria values ('1', '4','1'); 
insert into ServicoxFranquiaxCategoria values ('2', '4','2'); 
insert into ServicoxFranquiaxCategoria values ('3', '4','3');
insert into ServicoxFranquiaxCategoria values ('1', '5','1'); 
insert into ServicoxFranquiaxCategoria values ('2', '5','2'); 
insert into ServicoxFranquiaxCategoria values ('3', '5','3');
insert into ServicoxFranquiaxCategoria values ('1', '6','1'); 
insert into ServicoxFranquiaxCategoria values ('2', '6','2'); 
insert into ServicoxFranquiaxCategoria values ('3', '6','3');   
insert into ServicoxFranquiaxCategoria values ('1', '7','1'); 
insert into ServicoxFranquiaxCategoria values ('2', '7','2'); 
insert into ServicoxFranquiaxCategoria values ('3', '7','3');   


create table FormaPagamento (
cod_forma char(50) primary key,
forma char(50)
);

insert into FormaPagamento values ('1', 'boleto');
insert into FormaPagamento values ('2', 'cartao de credito');

create table opcao (
cod_opcao char(50) primary key,
opcao char(50)
);

insert into opcao values ('1', 'pre pago');
insert into opcao values ('2', 'pos pago');

create table FormaXopcaoxservicoXfranquiaXcategoria(
cod_forma char(50),
foreign key (cod_forma) references FormaPagamento (cod_forma),
cod_opcao char(50),
foreign key (cod_opcao) references opcao (cod_opcao),
cod_franquia char(50),
cod_servico char(50),
cod_categoria char(50),
foreign key (cod_franquia, cod_servico, cod_categoria) references ServicoxFranquiaxCategoria (cod_franquia, cod_servico, cod_categoria),
primary key (cod_forma, cod_opcao, cod_franquia, cod_servico, cod_categoria)
);

insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '1', '2', '7', '2');
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '2','1', '1', '1'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '2', '2', '1','2'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '1', '3', '1','3'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '2', '1', '2','1'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '1', '2', '2','2'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '1', '3', '2','3'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '2', '1', '3','1'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '2', '2', '3','2'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '1', '3', '3','3'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '1', '1', '4','1'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '1', '2', '4','2'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '1', '3', '4','3');
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '2', '1', '5','1'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '2', '2', '5','2'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '2', '3', '5','3');
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '2', '1', '6','1'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '2', '2', '6','2'); 
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('1', '2', '3', '6','3');   
insert into FormaXopcaoxservicoXfranquiaXcategoria values ('2', '2', '1', '7','1'); 



create table ClientexFormaXopcaoxservicoXfranquia(
cpf char(50),
foreign key (cpf) references cliente (cpf),
cod_forma char(50),
cod_opcao char(50),
cod_franquia char(50),
cod_servico char(50),
cod_categoria char(50),
numero_cartao char(50),
foreign key (cod_forma, cod_opcao, cod_franquia, cod_servico, cod_categoria) references FormaXopcaoxservicoXfranquiaXcategoria (cod_forma, cod_opcao, cod_franquia, cod_servico, cod_categoria)
);

insert into ClientexFormaXopcaoxservicoXfranquia values ('2645789', '2', '2', '1', '7','1', '2369784');
insert into ClientexFormaXopcaoxservicoXfranquia values ('9874563', '2', '1', '2', '2','2', '98754136');
insert into ClientexFormaXopcaoxservicoXfranquia values ('784630122', '2', '1', '2', '7', '2', '6667895469');
insert into ClientexFormaXopcaoxservicoXfranquia values ('7854632', '2', '1', '3', '4','3', '7845678');



