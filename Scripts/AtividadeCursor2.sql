create table OrdersProcedure(
 vendedor_id int (11),#vendedor
 cliente_id int (11), #customer
 PortLand int(11),
 LasVegas int (11),
 Denver int (11),
 LosAngeles int (11),
 NewYork int (11),
 OutrasCidades int (11)
 );
 
 
Delimiter $$
create procedure Cursor2()
Begin
	declare c_terminou integer default 0;
   
	declare c_vendedor_id int (11) default ' ';
	declare c_cliente_id int(11) default ' ';
    declare c_PortLand decimal (19,4) default ' ';
    declare c_LasVegas decimal (19,4) default ' ';
    declare c_Denver decimal (19,4) default ' ';
    declare c_LosAngeles decimal (19,4) default ' ';
    declare c_NewYork decimal (19,4) default ' ';
    declare c_OutrasCidades decimal (19,4) default ' ';
    declare c_cidade varchar (50) default ' ';
    declare c_total int (11) default ' ';
    declare c_quantidade decimal (18,4) default ' ';
    declare c_unit_price decimal (19,4) default ' ';
    
	declare busca_cursor cursor for
		select
        o.employee_id,
        o.customer_id,
        o.ship_city,
        od.quantity,
        od.unit_price,
        sum(quantity * unit_price)
		from orders o
        inner join order_details od on o.id = od.order_id
        group by o.ship_city
        order by o.ship_city;
        
         declare continue handler 
				for not found set c_terminou =1;
    
	open busca_cursor;
    while c_terminou != 1 do
		fetch busca_cursor into c_vendedor_id, c_cliente_id, c_cidade, c_quantidade, c_unit_price, c_total; #quantidade e unitprice;
        if c_cidade = 'Portland' then
			set c_total = (c_quantidade * c_unit_price) + c_total;
            set c_PortLand = c_total;
             end if;
				if c_cidade = 'Las Vegas' then 
					set c_total = (c_quantidade * c_unit_price) + c_total;
                    set c_LasVegas = c_total;
                    end if;
						if c_cidade = 'Denver' then
						set c_total = (c_quantidade * c_unit_price) + c_total;
                        set c_Denver = c_total;
                         end if;
								if c_cidade = 'Los Angelas' then
                                	set c_total = (c_quantidade * c_unit_price) + c_total;
									set c_LosAngeles = c_total;
                                    end if;
											if c_cidade = 'New York' then
												set c_total = (c_quantidade * c_unit_price) + c_total;
                                                set c_NewYork = c_total;
													else 
                                                    set c_total = (c_quantidade * c_unit_price) + c_total;
														set c_OutrasCidades = c_total;
                                                         end if;
													
			
		insert into OrdersProcedure(vendedor_id, cliente_id, PortLand, LasVegas, Denver, LosAngeles, NewYork, OutrasCidades) values ( c_vendedor_id, c_cliente_id, c_PortLand, c_LasVegas, c_Denver, c_LosAngeles, c_NewYork, c_OutrasCidades);
        

	end while;
    close busca_cursor;
    
	
End$$
Delimiter ;

call Cursor2;

#drop procedure Cursor2;
#drop table OrdersProcedure;


select * from OrdersProcedure;


select * from orders;