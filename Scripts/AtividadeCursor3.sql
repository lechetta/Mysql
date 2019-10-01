use northwind;

	describe orders;
	describe  order_details;
    describe products;
    describe order_details_status;
    select * from order_details_status;
    
    create table procedure_status(
    produto_name varchar(50),
    Nonee int (11),
    Allocated int (11),
    Invoiced int (11),
    Shipped int (11),
    On_Order int (11),
    No_Stock int (11)
    );
    
    drop procedure Cursor3;
   drop table procedure_status;
    
Delimiter $$
create procedure Cursor3()
Begin
	declare c_terminou integer default 0;
   
   
	declare c_status varchar (50) default ' ';
    declare c_vendedor_id int (11) default ' ';
	declare c_cliente_id int(11) default ' ';
	declare c_produto_nome varchar(50) default ' ';
    declare c_None decimal (19,4) default ' ';
    declare c_Allocated decimal (19,4) default ' ';
    declare c_Invoiced decimal (19,4) default ' ';
    declare c_Shipped decimal (19,4) default ' ';
    declare c_On_order decimal (19,4) default ' ';
    declare c_No_stock decimal (19,4) default ' ';
    declare c_total decimal (19,4) default ' ';
    declare c_quantidade decimal (18,4) default ' ';
    declare c_unit_price decimal (19,4) default ' ';
    declare c_desconto double default ' ';
   
    #declare c_status_id int(11) default ' ';
    
    
	declare busca_cursor cursor for
		select
        #st.id,
		st.status_name,
        o.employee_id,
        o.customer_id,
        p.product_name,
        od.product_id,
        od.quantity,
        od.unit_price,
        od.discount,
        sum((quantity * unit_price) - discount) as total
		from orders o
        inner join order_details od on o.id = od.order_id
		right join order_details_status st on st.id = od.status_id
        left join products p on p.id = od.product_id
        group by st.status_name
        order by st.status_name;
      
        
         declare continue handler 
				for not found set c_terminou =1;
    
	open busca_cursor;
    while c_terminou != 1 do
		fetch busca_cursor into c_status, c_vendedor_id, c_cliente_id, c_produto_nome, c_quantidade, c_unit_price, c_desconto, c_total; 
        if c_status = 'None' then
			set c_total = ((c_quantidade * c_unit_price) - c_desconto ) + c_total;
            set c_None = c_total;
             end if;
				if c_status = 'Allocated' then 
					set c_total = ((c_quantidade * c_unit_price) - c_desconto ) + c_total;
                    set c_Allocated = c_total;
						if c_Allocated = 'null' then 
						set c_Allocated = null;
                        end if;
                    end if;
						if c_status = 'Invoiced' then
						set c_total = ((c_quantidade * c_unit_price) - c_desconto ) + c_total;
                        set c_Invoiced = c_total;
							if c_Invoiced = 'null' then 
							set c_Invoiced = null;
							end if;
                         end if;
								if c_status = 'Shipped' then
                                	set c_total = ((c_quantidade * c_unit_price) - c_desconto ) + c_total;
									set c_Shipped = c_total;
										if c_Shipped = 'null' then 
										set c_Shipped = null;
										end if;
                                    end if;
											if c_status = 'On Order' then
												set c_total = ((c_quantidade * c_unit_price) - c_desconto ) + c_total;
                                                set c_On_order = c_total;
														if c_On_order = 'null' then 
														set c_On_order = null;
															end if;
                                                         end if;
																if c_status = 'No Stock' then
																		set c_total = ((c_quantidade * c_unit_price) - c_desconto ) + c_total;
																		set c_No_stock = c_total;
																					if c_No_stock = 'null' then 
																					set c_No_stock = null;
																					end if;
																				end if;
													
			
		insert into procedure_status(produto_name, Nonee, Allocated, Invoiced, Shipped, On_Order, No_Stock) values (c_produto_nome, c_None, c_Allocated, c_Invoiced, c_Shipped, c_On_order, c_No_stock);
        

	end while;
    close busca_cursor;
    
	
End$$
Delimiter ;
select * from procedure_status;