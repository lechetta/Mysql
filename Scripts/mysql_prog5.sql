Delimiter $$
create procedure prog5(repetir int)
begin
	declare cont int;
    set cont =1;
    while cont < repetir do
		set cont = cont+1;
	end while;
    select cont;
End $$
Delimiter ;

call prog5(20)