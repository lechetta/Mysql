delimiter $$
create procedure prog7(in repetir int, out resultado varchar(10))
Begin
	declare cont int;
    set cont =1;
    repeat
		set cont = cont+1;
        until cont >= repetir
	end repeat;
    set resultado = concat('R',cont);
end$$
Delimiter ;

set @result = ' ';

call prog7(20,@result);
select @result;