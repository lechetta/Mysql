create database Exerc_Banco_Divertido;
use Exerc_Banco_Divertido;

create table cliente(
cpf char(12) primary key,
nome char(144),
telefone char(12),
endereco char(144)
);

create table tipoPagamento(
id_tipo char (44) primary key,
nome_tipo char (144)
);

create table pagamento(
id_pagamento char (44) primary key,
id_tipo char (44),
precoP double,
juros double,
data_2 date,
foreign key (id_tipo) references tipoPagamento (id_tipo)
);

create table categoria(
cod_categoria int primary key,
precoM double,
franquia double
);

create table servicos(
cod_servicos int primary key,
cod_categoria int,
id_pagamento char (44),
consumo double,
foreign key (cod_categoria) references categoria(cod_categoria),
foreign key (id_pagamento) references pagamento(id_pagamento)
);

create table clienteXservicos(
id_clienteServicos int primary key,
cliente_cpf char(12),
cod_servicos int,
data_2 date,
foreign key (cliente_cpf) references cliente (cpf),
foreign key (cod_servicos) references servicos(cod_servicos)
);


insert into cliente values ('2645789', 'gustavo', '1999/08/26');
insert into cliente values ('9874563', 'victor', '1945/09/08');
insert into cliente values ('784630122', 'jesus', '2014/06/22');
insert into cliente values ('7854632', 'ricardo', '1998/03/16');

insert into categoria values ('1', 'A', '15.55');
insert into categoria values ('2', 'B', '19.99');
insert into categoria values ('3', 'C', '23.86');

insert into franquia values ('1', '10GB');
insert into franquia values ('2', '20GB');
insert into franquia values ('3', '30GB');

insert into servicos values ('1', '1 tela');
insert into servicos values ('2', '2 telas');
insert into servicos values ('3', '2 telas HD');
insert into servicos values ('4', '3 telas HD');
insert into servicos values ('5', '4 telas Full HD');
insert into servicos values ('6', '3 telas Full HD');
insert into servicos values ('7', '2 telas 4k');

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

insert into FormaPagamento values ('1', 'boleto');
insert into FormaPagamento values ('2', 'cartao de credito');

insert into opcao values ('1', 'pre pago');
insert into opcao values ('2', 'pos pago');

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

insert into ClientexFormaXopcaoxservicoXfranquia values ('2645789', '2', '2', '1', '7','1', '2369784');
insert into ClientexFormaXopcaoxservicoXfranquia values ('9874563', '2', '1', '2', '2','2', '98754136');
insert into ClientexFormaXopcaoxservicoXfranquia values ('784630122', '2', '1', '2', '7', '2', '6667895469');
insert into ClientexFormaXopcaoxservicoXfranquia values ('7854632', '2', '1', '3', '4','3', '7845678');

