create database aula17;	
	use aula17;

Delimiter $$
create procedure prog1()
begin
	declare v_nome varchar(50);
    declare v_salario real;
    set v_nome = 'pedro de lara';
    set v_salario = 1000;
    select v_nome, v_salario;
    
    end$$
    Delimiter ; 
    
    call prog1;
    
    
    
Delimiter $$
create procedure prog2(reajuste real)
begin
	declare v_nome varchar(50);
    declare v_salario real;
    set v_nome = 'pedro de lara';
    set v_salario = 1000 * (1 + reajuste);
    select v_nome, v_salario;
    
    end$$
    Delimiter ;
    
    call prog2(0.5);
    
    
Delimiter $$
create procedure prog99(IN reajuste real, INOUT salario real)
begin
	declare v_nome varchar(50); #@nome
    declare v_salario real; #@salario
    set v_nome = 'pedro de lara';
    set salario = 1000 * (1 + reajuste);
    
    end$$
    Delimiter ;
    
   set  @salario = 0.0;
    call prog99(0.5, @salario);
    select @salario;
    
    
    Delimiter $$
    create procedure prog3(repetir int)
    begin
    declare contador int;
    set contador = 1;
    laco: loop
		set contador = contador + 1;
        if contador >= repetir then
			leave laco;
            end if;
    end loop;
    
    select contador;
    end$$
    Delimiter ; 
    
    call prog3(5);
    
    
Delimiter $$
create procedure prog4(repetir int)
begin 
declare contador int;
set contador = 1;
while contador < repetir do
	set contador = contador + 1;
    end while;
    select contador; 
    
    end$$
    Delimiter ; 
    
    call prog4(2);
    
    
    Delimiter $$
    create procedure prog5(repetir int)
    begin 
		declare contador int;
        set contador = 1;
        repeat
			set contador = contador + 1 ;
            until contador >= repetir
            end repeat;
            select contador ; 
            end$$
            Delimiter ; 
            
            
    
    Delimiter $$
    create procedure prog6(in repetir int, inout resultado varchar(10))
    begin 
		declare contador int;
        set contador = 1;
        repeat
			set contador = contador + 1 ;
            until contador >= repetir
            end repeat;
            set resultado  = concat('R', contador);
            end$$
            Delimiter ; 
            
            
            
            set @resultado = '';
            call prog6(20, @resultado);
            select @resultado;