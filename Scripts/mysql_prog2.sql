DELIMITER $$
create procedure prog2(reajuste real)
	Begin 
		declare v_nome varchar(50);
        declare v_salario real;
        Set v_nome = 'Pedro de Lara';
        Set v_salario = 1000 * (1+reajuste);
        select v_nome,v_salario;
	End $$
Delimiter ;

call prog2(1)