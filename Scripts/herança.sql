create database heranca;
	use heranca;
    
    create table produtos(
    nome varchar(50),
    cod int (50) primary key,
    validade int,
    tipo varchar(50),
    preco double
    );
    describe produtos;
    
    insert into produtos values ('coxinha', 1, 2, 'salgado', 4.00);
    insert into produtos values ('kibe', 2, 2, 'salgado', 4.00); 
    insert into produtos values ('pastel', 3, 1, 'salgado', 3.00);
    insert into produtos values ('refrigerante', 4, 30, 'bebida', 4.50);
    insert into produtos values ('cha', 5, 30, 'bebida', 4.00);
    insert into produtos values ('suco', 6, 30, 'bebida', 4.50);
    insert into produtos values ('doce', 7, 5, 'bomboniere', 2.00);
    insert into produtos values ('bala', 8, 10, 'bomboniere', 1.00);
    insert into produtos values ('chicletes', 12, 30, 'bomboniere', 2.00);
	insert into produtos values ('x-salada', 13, 1, 'sandwich', 6.00);
	insert into produtos values ('x-bacon', 14, 1, 'sandwich', 7.00);
	insert into produtos values ('x-tudo', 15, 1, 'sandwich', 13.00);
          
  SELECT * FROM PRODUTOS where tipo = 'salgado';
    