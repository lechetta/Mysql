Delimiter $$
create procedure prog6(repetir int)
begin
	declare cont int;
    set cont =1;
    repeat
		set cont = cont +1;
        until cont >= repetir
	end repeat;
    select cont;
end$$
delimiter ;

call prog6(6)