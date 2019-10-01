Delimiter $$
create procedure SP_AtualizaEstoque(id_prod int,qtde_comprada int,valor_unit decimal(9,2))
begin
	declare contador int(11);
    select count(*) into contador from estoque where id_estoque = id_prod;
    if contador > 0 then
		update estoque set qtde=qtde+qtde_comprada, valor_unitario=valor_unit
        where id_produto = id_prod;
	else
		insert into estoque(id_estoque,qtde_estoque,valor_unitario) values (id_prod,qtde_comprada,valor_unit);
	end if;
end $$
Delimiter ;
drop procedure SP_AtualizaEstoque;