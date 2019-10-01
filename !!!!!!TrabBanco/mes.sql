create table Vendas_mes(
janeiro dec(12,2),
fevereiro dec(12,2),
marco dec(12,2),
abril dec(12,2), 
maio dec(12,2), 
junho dec(12,2), 
julho dec(12,2), 
agosto dec(12,2), 
setembro dec(12,2), 
outubro dec(12,2),
novembro dec(12,2),
dezembro dec(12,2)
);



Delimiter $$
create procedure TotalMes(c_mes int)
Begin
	declare c_terminou integer default 0;
   
	declare c_id_vendas int (11) default 0;
	declare c_id_produto int (11) default 0;
	declare c_id_ordem int (11) default 0;
	declare c_quantidade int default 0;
    declare c_preco_venda double(6,2) default 0;
    declare c_data_venda datetime default 0;
    declare c_total dec(12,2) default 0;
    declare c_janeiro dec(12,2) default 0;
	declare c_fevereiro dec(12,2) default 0;
    declare c_marco dec(12,2) default 0;
    declare c_abril dec(12,2) default 0;
    declare c_maio dec(12,2)  default 0;
    declare c_junho dec(12,2)  default 0;
    declare c_julho dec(12,2) default 0;
	declare c_agosto dec(12,2) default 0;
    declare c_setembro dec(12,2) default 0;
    declare c_outubro dec(12,2) default 0;
    declare c_novembro dec(12,2) default 0;
    declare c_dezembro dec(12,2) default 0;
    

	declare busca_cursor cursor for
		select 
        o.id_vendas,
        o.id_produto,
        o.id_ordem,
        o.data_venda,
        o.quantidade,
        o.preco_venda,
        sum(quantidade * preco_venda) as total
		from ordem_vendas o
        where month(o.data_venda) = c_mes
        group by o.id_vendas, o.id_produto, o.id_ordem, o.data_venda;
        
        
         declare continue handler 
				for not found set c_terminou =1;
    
  #select c_dia;
  
	open busca_cursor;
    while c_terminou != 1 do
		fetch busca_cursor into c_id_vendas, c_id_produto, c_id_ordem, c_data_venda, c_quantidade, c_preco_venda, c_total;
		  if c_mes = 1 then
            set c_janeiro = c_total;
             end if;
				if c_mes = 2 then 
					set c_fevereiro = c_total;
                    end if;
						if c_mes = 3 then
                        set c_marco = c_total;
                         end if;
								if c_mes = 4 then
									set c_abril = c_total;
                                    end if;
											if c_mes = 5 then
                                                set c_maio = c_total;
                                                      end if;
													if c_mes = 6 then
															set c_junho = c_total; 
																end if;
																	if c_mes = 7 then
																		set c_julho = c_total; 
																			end if;
																				if c_mes = 8 then
																					set c_agosto = c_total; 
																						end if;
																							if c_mes = 9 then
																								set c_setembro = c_total; 
																									end if;
																										if c_mes = 10 then
																											set c_outubro = c_total; 
																												end if;
																													if c_mes = 11 then
																														set c_novembro = c_total; 
																															end if;
																																if c_mes = 12 then
																																	set c_dezembro = c_total; 
																																		end if;
                                                
													
			
	end while;
    		insert into  Vendas_mes(janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro) values (c_janeiro, c_fevereiro, c_marco, c_abril, c_maio, c_junho, c_julho, c_agosto, c_setembro, c_outubro, c_novembro, c_dezembro);

    select * from  Vendas_mes;
    
    close busca_cursor;
   
	
End$$
Delimiter ;

call TotalMes(11);
drop procedure TotalMes;
drop table  Vendas_mes;