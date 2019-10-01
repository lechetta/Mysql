DELIMITER $$
create procedure prog99(in reajuste real, inout salario real)
	Begin 
		declare v_nome varchar(50);
        declare v_salario real;
        Set v_nome = 'Pedro de Lara';
        Set salario = 1000 * (1+reajuste);
        
	End $$
Delimiter ;


drop procedure prog99;
Set @salario = 0.0;
call prog99(0.5,@salario);
select @salario;