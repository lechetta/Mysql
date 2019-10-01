create database l;
use l;
drop table clientes;
create table clientes(
id int primary key,
nome varchar(50),
email varchar(50)
);
use Ricardo;

drop procedure teste1;
delimiter $$
create procedure teste1( 
	id int,
    nome varchar(50),
    email varchar(50)) 
    begin
	if exists( select id from clientes) then
		update clientes 
			set 
				clientes.id =id , 
				clientes.nome=nome,
				clientes.email = email
                where clientes.id = id;
	else
		insert into clientes values (id,nome,email);
	end if;
    end
$$



    

