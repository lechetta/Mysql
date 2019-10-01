
Delimiter $$
create procedure prog4(repetir int)
Begin 
	Declare contador int;
    Set contador =1;
    laco:loop
		set contador = contador+1;
			if contador >= repetir then
				leave laco;
			end if;
	End loop laco;
    Select contador;
End $$
Delimiter ;

call prog4(5)

    