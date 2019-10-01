Delimiter $$
create procedure sp_teste1(in v_city varchar(144))


Begin
	declare v_terminou integer default 0;
   
    
    declare v_city varchar(144) default ' ';
	declare v_nome varchar(144) default ' ';
	declare v_nome2 varchar(144) default ' ';
    declare v_fone varchar(144) default ' ';
	declare v_cargo varchar(144) default ' ';
	declare v_email varchar(144) default ' ';
    
	declare busca_cursor cursor for
		select e.first_name,
        e.last_name,
        e.home_phone,
        e.job_title,
        e.email_address
		from employees e;
        
         declare continue handler 
    for not found set v_terminou =1;
    
   
	open busca_cursor;
    while v_terminou != 0 do
		fetch busca_cursor into v_nome,v_nome2,v_fone,v_cargo,v_email;
	end while;
    close busca_cursor;
   
	insert into aux(nome,telefone,email,cargo) values (v_nome,v_fone,v_email,v_cargo);
	
End$$
Delimiter ;

create table aux(
nome varchar(50),
telefone varchar(50),
email varchar(50),
cargo varchar(50)
);

drop table aux;
drop procedure sp_teste1;
call sp_teste1('Denver');
select * from aux;
	
    
    
    
