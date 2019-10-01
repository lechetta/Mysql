create database CC ;
use CC;
drop database cc;
	
    create table contato (
    tipo int(3) primary key,
    contato varchar(30)
    );
    
    insert into contato values(1, 'telefone');
    insert into contato values(2, 'celular');
    insert into contato values(3, 'email');
    
    create table contatoXpessoa(
	id_contatoXpessoa int(4) primary key,
    tipo int(3),
    foreign key (tipo) references contato (tipo),
    id_pessoa int(3),
    foreign key(id_pessoa) references pessoas (id_pessoa),
    contato varchar(30)
    );
    
    insert into contatoXpessoa values (1, 1, 1, '41314785100');
    
    create table pessoas(
    id_pessoa int (3) not null,
    nome varchar(30),
    cpf varchar(30) not null,
	primary key (id_pessoa, cpf),
    data_nascimento varchar(30)
    );
    
    
    
	insert into pessoas values (1, 'gustavo', '785420395411', '2000/05/28');
    insert into pessoas values (2, 'joao', '1254579600', '1999/03/12');
    insert into pessoas values (3, 'felipe', '5468796324555', '1998/08/07');
    select * from pessoas;
    
    create view VWpessoa
    as select p.nome,
    p.id_pessoa,
    p.cpf,
    c.contato
    from pessoas p
    left join contatoXpessoa c on p.id_pessoa = c.id_pessoa
    group by id_pessoa;
    
    
    select * from VWpessoa where id_pessoa = 2;

 

		create table func(
		id_func int (3),
        id_pessoa  int(3),
		cpf varchar(30),
        foreign key(id_pessoa, cpf) references pessoas (id_pessoa, cpf),
        primary key(id_func, cpf)
        );
        
        create view VWfuncionario
        as select p.nome,
        f.id_func,
        f.id_pessoa,
        f.cpf,
        c.contato
        from pessoas p 
        inner join func f on p.id_pessoa = f.id_pessoa
        left join contatoXpessoa c on p.id_pessoa = c.id_pessoa
        group by id_func;
        
        select * from  VWfuncionario;
        
        insert into func values (1, 2, '1254579600');
        
        create table endereco(
        cod int(30) primary key,
        tipo varchar(30)
        );
         
         insert into endereco values(1, 'residencial');
         insert into endereco values(2, 'comercial');
         
         
        create table ClienteXendereco(
        cod int(3),
        foreign key(cod) references endereco (cod),
        id_cliente int(3),
        cpf varchar(30),
        foreign key(id_cliente, cpf) references cliente (id_cliente, cpf),
        endereco varchar(30)
        );
        
        insert into ClienteXendereco values (2, 1, '785420395411', 'rua joaquim 33 sala 29');
        
        create table cliente (
		id_cliente int(3),
        id_pessoa  int(3),
		cpf varchar(30),
        foreign key(id_pessoa, cpf) references pessoas (id_pessoa, cpf),
        primary key(id_cliente, cpf)
        );
         insert into cliente values(1, 1, '785420395411');
         insert into cliente values(2, 3, '5468796324555');
         
         create table cliente_compras_realizadas(
         id_cliente int(3),
         cpf varchar(30),
         nota_fiscal varchar (40),
         data_compra date,
         foreign key(nota_fiscal, data_compra) references vendas (nota, data)
         );
         
         create view VWcliente
         as select 
         p.nome, 
         p.id_pessoa,
         p.cpf, 
         c.id_cliente,
         x.endereco,
         s.contato
         from pessoas p
         inner join cliente c on p.id_pessoa = c.id_cliente 
         left join contatoXpessoa s on p.id_pessoa = s.id_pessoa
		 left join ClienteXendereco x on c.id_cliente = x.id_cliente;
          
          select * from VWcliente;
         
        
        
        select * from func;
     #   insert into func values('125478963', 1);
         
     #   insert into func values('124789520', 2);
         
     #   insert into func values('1236578965', 3);
        
        create table cate(
		cod_categoria int(3) primary key,
		tipo varchar(40),
        acrescimo dec (3,2)
        );
        
        insert into cate values (1, 'utilidades domesticas', 0.1);
        insert into cate values (2, 'decoração', 1.2);
        insert into cate values (3, 'jardinagem', 0.6);
        
        
        create table produto(
        id_produto int(3), 
        nome varchar(40),
        descricao varchar(40),
        custo_compra int(5),
        cod_categoria int(4),
        preco_venda int(4),
        foreign key (cod_categoria) references cate (cod_categoria),
        promocao int (3),
        primary key(id_produto, cod_categoria, preco_venda)
        );


		insert into produto values(1, 'talher', 'inox', 200, 1, 220, 1);
        insert into produto values(2, 'conjunto de panelas', 'inox', 200, 1, 220, 1);
        insert into produto values(3, 'vaso', 'vidro', 50, 2, 110, 0);
        insert into produto values(4, 'tapete', 'tecido', 300, 2, 660, 0);
        insert into produto values(5, 'maquina de cortar grama', 'roçadeira', 250, 3, 400, 0);
		insert into produto values(6, 'grama', 'bloco', 7, 3, 12, 1 );
        
        
        create table vendas(
        nota varchar(40) primary key,
        id_func int(3),
		cpf_funcionario varchar(30),
        foreign key(id_func, cpf_funcionario) references func (id_func, cpf),
		id_cliente int(3),
        cpf_cliente varchar(30),
        foreign key (id_cliente, cpf_cliente) references cliente (id_cliente, cpf),
          data date
        );
        
        
        create table detalhes(
        id_produto int(3),
        foreign key (id_produto) references produto (id_produto),
        qtd int(4),
        nota_fiscal varchar(40),
        foreign key (nota_fiscal) references vendas (nota),
        forma_pagamento int(3),
        foreign key(forma_pagamento) references forma_Pagto001 (id_forma)
		);
        
        create table opcao_pagamento(
        cod_forma int(3) primary key,
        forma varchar(30)
        );
        
        insert into opcao_pagamento values (1, 'cartao');
        insert into opcao_pagamento values (2, 'boleto');
        insert into opcao_pagamento values (3, 'dinheiro');
        
        create table pagto_a_vista(
        id_pagto_vista int(3) primary key,
        cod_forma int(3),
        foreign key(cod_forma) references opcao_pagamento (cod_forma),
        desconto dec(3,3)
        );
        
        insert into pagto_a_vista values (2, 1, 0);
        insert into pagto_a_vista values (1, 2, 0.10);
        insert into pagto_a_vista values (3, 3, 0);
        
        create table forma_Pagto001(
        id_forma int(3) primary key, 
        id_Pagto_vista int (3),
        foreign key(id_Pagto_vista) references pagto_a_vista (id_Pagto_vista),
        id_pagto_prazo int(3),
        foreign key (id_pagto_prazo) references pagto_cartao_parcelado (id_Pagto_prazo)
        );


        insert into forma_Pagto001 values (1, 1, null);
        insert into forma_Pagto001 values (2, 2, null);
		insert into forma_Pagto001 values (3, 3, null);
		
        insert into forma_Pagto001 values (4, null, 1);
		insert into forma_Pagto001 values (5, null, 2);
        insert into forma_Pagto001 values (6, null, 3);
        insert into forma_Pagto001 values (7, null, 4);
        insert into forma_Pagto001 values (8, null, 5);
        insert into forma_Pagto001 values (9, null, 6);
        insert into forma_Pagto001 values (10, null, 7);
        insert into forma_Pagto001 values (11, null, 8);
        insert into forma_Pagto001 values (12, null, 9);
        insert into forma_Pagto001 values (13, null, 10);



	
        
        create table pagto_cartao_parcelado(
        id_pagto_prazo int(3) primary key,
        cod_forma int(3),
        foreign key(cod_forma) references opcao_pagamento (cod_forma),
        parcela int(3),
        juros dec(3,3)
        );
        

		insert into pagto_cartao_parcelado values (1, 1, 1, 0);
        insert into pagto_cartao_parcelado values (2, 1, 2, 0);
        insert into pagto_cartao_parcelado values (3, 1, 3, 0);
        insert into pagto_cartao_parcelado values (4, 1, 4, 0.02);
        insert into pagto_cartao_parcelado values (5, 1, 5, 0.03);
        insert into pagto_cartao_parcelado values (6, 1, 6, 0.04);
        insert into pagto_cartao_parcelado values (7, 1, 7, 0.05);
        insert into pagto_cartao_parcelado values (8, 1, 8, 0.06);
        insert into pagto_cartao_parcelado values (9, 1, 9, 0.07);
        insert into pagto_cartao_parcelado values (10, 1, 10, 0.08);

        