Delimiter $$
Create Trigger trg_Entrada_Prod after insert on entrada_produto
for each row
begin
	call SP_AtualizaEstoque (new.id_produto, new.qtde,new.valor_unitario );
end $$
Delimiter ;

Delimiter $$
create trigger trg_Entrada_Prod_AU after update on entrada_produto
for each row
Begin
	call SP_AtualizaEstoque (new.id_produto,new.qtde - old.qtde,new.valor_unitario);
End $$
Delimiter ;

Delimiter $$
create trigger trg_Entrada_Prod_AD after delete on entrada_produto
for each row
begin
	call SP_AtualizaEstoque (old.id_produto, old.qtde *-1,old.valor_unitario);
end $$
Delimiter ;

/*Trigger para saida de produtos*/

DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AI AFTER INSERT ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto_saida, new.qtde_saida * -1, new.valor_unitario_saida);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AU AFTER UPDATE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (new.id_produto_saida, old.qtde_saida - new.qtde_saida, new.valor_unitario_saida);
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER TRG_SaidaProduto_AD AFTER DELETE ON saida_produto
FOR EACH ROW
BEGIN
      CALL SP_AtualizaEstoque (old.id_produto_saida, old.qtde_saida, old.valor_unitario_saida);
END $$
DELIMITER ;
