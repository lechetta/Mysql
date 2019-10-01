use aula17;

Delimiter $$
create procedure cria_lista_email(inout email_list varchar(4000))
begin
	declare v_email varchar(144);
    declare v_terminou int default 0;
     declare cursor_emails cursor for 	
		select email_address from employees;
    declare continue handler 
		for not found set v_terminou = 1;
	while v_terminou != 1 do 
		fetch cursor_emails into v_email;
    set email_list = concat(v_email, ';' , email_list);
    end while;
    end$$
    Delimiter ; 
   
		