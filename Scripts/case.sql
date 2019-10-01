use northwind;
	select 
		products.product_code
		product_name,
        list_price,
		Case 
			when list_price = 7 then 'muito barato'
            when list_price between 7 and 20 then 'barato'
            when list_price >20 then 'caro '
            else 
				'impossivel determinar'
                end as interpretação
	
		from products;
	