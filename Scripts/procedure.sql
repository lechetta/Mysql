	use huhu;
    
    create table cliente(
    id int primary key,
	nome varchar(50),
    email varchar(50)
    );
    
    select * from cliente;
    
    delimiter $$
    create procedure Insert_Upd_cliente(
    id int,
    nome varchar(50),
    email varchar(50))
      begin
    if exists(select id from cliente) then
    update cliente set cliente.id = id, 
		cliente.nome = nome, 
        cliente.email = email
        where cliente.id = id;
		else 
			insert into cliente values (id, nome, email);
            end if;
            end
            $$
            
            
            
	call  Insert_Upd_cliente(1, 'gustavo', 'gustavooo');
    call  Insert_Upd_cliente(1, 'lechetta', 'radioativo');
    
    
    select * from cliente;