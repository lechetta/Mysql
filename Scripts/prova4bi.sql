drop database prova4bi;
create database prova4bi;
	use prova4bi;

	CREATE USER 'admin'@'%' IDENTIFIED BY '123456';
	GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%'
	WITH GRANT OPTION;
    
    
    CREATE USER 'usuario'@'%' IDENTIFIED BY '78910';
	GRANT INSERT, SELECT, DELETE ON *.* TO 'usuario'@'%'
	WITH GRANT OPTION;


create table cliente(
id_cliente int(11) primary key,
nome varchar(50),
cpf varchar(50),
data_nascimento date,
rg varchar(50),
endereco varchar(50),
email varchar(50)
);


create table telefone(
id_cliente int(11),
foreign key (id_cliente) references cliente (id_cliente),
tipo_telefone varchar(50),
telefone varchar(50)
);

create table operador(
id_operador int primary key,
nome_op varchar(30),
setor varchar(30),
email varchar(30),
endereco varchar(30)
);


create table viagem(
id_viagem int primary key,
destino varchar(145),
tipotrans varchar(144),
data_saida date,
duracao_dia int,
duracao_noite int,
preco_viagem double,
vitrine int default 0
);


create table vitrine(
id_viagem int primary key,
destino varchar(145),
tipotrans varchar(144),
data_saida date,
duracao_dia int,
duracao_noite int,
preco_viagem double
);


create table forma_pagamento(
id_tipo int primary key,
tipo varchar(50)
);

insert into forma_pagamento values(1, 'vista_dinheiro');
insert into forma_pagamento values(2, 'vista_credito');
insert into forma_pagamento values(3, 'vista_cartao_debito');
insert into forma_pagamento values(4, 'prazo_boleto');
insert into forma_pagamento values(5, 'prazo_credito');


create table venda(
id_venda int (10) primary key,
id_cliente int(11),
id_operador int, 
tipo_pagamento int,
data_venda date,
numero_cartao int(16),
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_operador) references operador(id_operador),
foreign key(tipo_pagamento) references forma_pagamento(id_tipo)
);


create table ordem_venda(
id int primary key,
id_venda int(10), 
id_viagem int, 
quantidade int,
preco_unidade dec(6,2),
foreign key(id_venda) references venda (id_venda),
foreign key(id_viagem) references vitrine (id_viagem)
);


create table situacao_financeira(
id_ordem int,
foreign key(id_ordem) references ordem_venda (id),
pago int default 0
);




Delimiter $$


create procedure sp_vitrine()
Begin
	declare idviagem int;
    declare dest varchar(145);
    declare trans varchar(144);
    declare saida date;
    declare dia int;
    declare noite int;
    declare preco double;
    declare v_terminou int default 0;
    
    declare cursor_vitrine cursor for
		select id_viagem,
		destino,
        tipotrans,
        data_saida,
        duracao_dia,
        duracao_noite,
        preco_viagem
        from viagem
        where vitrine =1;
			declare continue handler for
			not found set v_terminou =1;
            open cursor_vitrine;
			while v_terminou!=1 do
				fetch cursor_vitrine into idviagem,dest,trans,saida,dia,noite,preco;
			end while;
        insert into vitrine values (idviagem,dest,trans,saida,dia,noite,preco);
         close cursor_vitrine;
end $$
Delimiter ;


insert into viagem values (1,'siodui','rampera','1990-05-25',5,4,1450.00,1);
insert into viagem values (2,'teste','rampera','1990-05-25',5,4,1450.00,1);

call sp_vitrine();   


CREATE TRIGGER trg_vitrine
AFTER INSERT
   ON viagem FOR EACH ROW
  call sp_vitrine();
   



create view vw4a as select 
o.id_venda,
c.cpf,
c.nome,
op.nome_op,
c.endereco,
ve.data_venda,
v.preco_viagem
from ordem_venda o
inner join venda ve on ve.id_venda = o.id_venda 
inner join cliente c on c.id_cliente = ve.id_cliente
inner join operador op on op.id_operador = ve.id_operador
inner join vitrine v on v.id_viagem = o.id_viagem;



#4b

######################TOTAL POR DIA
create table diasemana(
segunda int,
terca int ,
quarta int ,
quinta int ,
sexta int ,
sabado int ,
domingo int
);


Delimiter $$
create procedure TotalDiaSemana(c_dia int)
Begin
	declare c_terminou integer default 0;
   
	declare c_id int (11) default 0;
	declare c_id_venda int (11) default 0;
	declare c_id_viagem int (11) default 0;
	declare c_quantidade int  default 0;
    declare c_preco_venda double(6,2) default 0;
    declare c_data_venda datetime default 0;
    declare c_total dec(12,2) default 0;
    declare c_segunda dec(12,2) default 0;
	declare c_terca dec(12,2) default 0;
    declare c_quarta dec(12,2) default 0;
    declare c_quinta dec(12,2) default 0;
    declare c_sexta dec(12,2)  default 0;
    declare c_sabado dec(12,2)  default 0;
    declare c_domingo dec(12,2) default 0;
	
   
	declare busca_cursor cursor for
		select 
        o.id,
        o.id_venda,
        o.id_viagem,
        sum(quantidade * preco_venda) as total
		from ordem_vendas o
        inner join venda v
        where dayofweek(v.data_venda) = c_dia
        group by o.id, o.id_venda, o.id_viagem;
        
        
         declare continue handler 
				for not found set c_terminou =1;
    
  #select c_dia;
  
	open busca_cursor;
     select c_dia;

    while c_terminou != 1 do
		fetch busca_cursor into c_id, c_id_venda, c_id_viagem, c_data_venda, c_quantidade, c_preco_venda,  c_total;
		  if c_dia = 1 then
			#set c_total =(c_preco_venda * c_quantidade) + c_total;
            set c_domingo = c_total;
             end if;
				if c_dia = 2 then 
					#set c_total =(c_preco_venda * c_quantidade) + c_total;
					set c_segunda = c_total;
                    end if;
						if c_dia = 3 then
						#set c_total = (c_preco_venda * c_quantidade) + c_total;
                        set c_terca = c_total ;
                         end if;
								if c_dia = 4 then
                                	#set c_total = (c_preco_venda * c_quantidade) + c_total;
									set c_quarta = c_total;
                                    end if;
											if c_dia = 5 then
												#set c_total = (c_preco_venda * c_quantidade) + c_total;
                                                set c_quinta = c_total;
                                                      end if;
													if c_dia = 6 then
															#set c_total = (c_preco_venda * c_quantidade) + c_total;
															set c_sexta = c_total;  
																end if;
                                                                if c_dia = 7 then
                                                   # set c_total = (c_preco_venda * c_quantidade) + c_total;
														set c_sabado = c_total;
                                                         end if;
													
		select c_dia;	
	end while;
		insert into diasemana(segunda, terca, quarta, quinta, sexta, sabado, domingo) values (c_segunda, c_terca, c_quarta, c_quinta, c_sexta, c_sabado, c_domingo);
        
    
    close busca_cursor;
   
	
End$$
Delimiter ;

call TotalDiaSemana(4);

############################################## QUANTIDADE POR DIA

create table Diaquantidade(
segunda int,
terca int ,
quarta int ,
quinta int ,
sexta int ,
sabado int ,
domingo int
);


Delimiter $$
create procedure totalquantidade(c_dia int)
Begin
	declare c_terminou integer default 0;
   
	declare c_id int (11) default 0;
	declare c_id_venda int (11) default 0;
	declare c_id_viagem int (11) default 0;
	declare c_quantidade int  default 0;
    declare c_preco_venda double(6,2) default 0;
    declare c_data_venda datetime default 0;
    declare c_total dec(12,2) default 0;
    declare c_segunda dec(12,2) default 0;
	declare c_terca dec(12,2) default 0;
    declare c_quarta dec(12,2) default 0;
    declare c_quinta dec(12,2) default 0;
    declare c_sexta dec(12,2)  default 0;
    declare c_sabado dec(12,2)  default 0;
    declare c_domingo dec(12,2) default 0;
	
   
	declare busca_cursor cursor for
		select 
        o.id,
        o.id_venda,
        o.id_viagem,
        o.preco_venda,
        sum(quantidade) as total
		from ordem_vendas o
        inner join venda v
        where dayofweek(v.data_venda) = c_dia
        group by o.id, o.id_venda, o.id_viagem;
        
        
         declare continue handler 
				for not found set c_terminou =1;
    
  #select c_dia;
  
	open busca_cursor;
     select c_dia;

    while c_terminou != 1 do
		fetch busca_cursor into c_id, c_id_venda, c_id_viagem, c_data_venda, c_quantidade, c_preco_venda,  c_total;
		  if c_dia = 1 then
			#set c_total =(c_preco_venda * c_quantidade) + c_total;
            set c_domingo = c_total;
             end if;
				if c_dia = 2 then 
					#set c_total =(c_preco_venda * c_quantidade) + c_total;
					set c_segunda = c_total;
                    end if;
						if c_dia = 3 then
						#set c_total = (c_preco_venda * c_quantidade) + c_total;
                        set c_terca = c_total ;
                         end if;
								if c_dia = 4 then
                                	#set c_total = (c_preco_venda * c_quantidade) + c_total;
									set c_quarta = c_total;
                                    end if;
											if c_dia = 5 then
												#set c_total = (c_preco_venda * c_quantidade) + c_total;
                                                set c_quinta = c_total;
                                                      end if;
													if c_dia = 6 then
															#set c_total = (c_preco_venda * c_quantidade) + c_total;
															set c_sexta = c_total;  
																end if;
                                                                if c_dia = 7 then
                                                   # set c_total = (c_preco_venda * c_quantidade) + c_total;
														set c_sabado = c_total;
                                                         end if;
													
		select c_dia;	
	end while;
		insert into Diaquantidade(segunda, terca, quarta, quinta, sexta, sabado, domingo) values (c_segunda, c_terca, c_quarta, c_quinta, c_sexta, c_sabado, c_domingo);


    select * from Diaquantidade;
    
    close busca_cursor;
   
	
End$$
Delimiter ;

call totalquantidade(4);



################################################# MEDIA POR DIA

create table Diamedia(
segunda int,
terca int ,
quarta int ,
quinta int ,
sexta int ,
sabado int ,
domingo int
);


Delimiter $$
create procedure mediaSemana(c_dia int)
Begin
	declare c_terminou integer default 0;
   
	declare c_id int (11) default 0;
	declare c_id_venda int (11) default 0;
	declare c_id_viagem int (11) default 0;
	declare c_quantidade int  default 0;
    declare c_preco_venda double(6,2) default 0;
    declare c_data_venda datetime default 0;
    declare c_total dec(12,2) default 0;
    declare c_segunda dec(12,2) default 0;
	declare c_terca dec(12,2) default 0;
    declare c_quarta dec(12,2) default 0;
    declare c_quinta dec(12,2) default 0;
    declare c_sexta dec(12,2)  default 0;
    declare c_sabado dec(12,2)  default 0;
    declare c_domingo dec(12,2) default 0;
	
   
	declare busca_cursor cursor for
		select 
        o.id,
        o.id_venda,
        o.id_viagem,
        o.preco_venda,
        avg(valor/quantidade) as total
		from ordem_vendas o
        inner join venda v
        where dayofweek(v.data_venda) = c_dia
        group by o.id, o.id_venda, o.id_viagem;
        
        
         declare continue handler 
				for not found set c_terminou =1;
    
  #select c_dia;
  
	open busca_cursor;
     select c_dia;

    while c_terminou != 1 do
		fetch busca_cursor into c_id, c_id_venda, c_id_viagem, c_data_venda, c_quantidade, c_preco_venda,  c_total;
		  if c_dia = 1 then
			#set c_total =(c_preco_venda * c_quantidade) + c_total;
            set c_domingo = c_total;
             end if;
				if c_dia = 2 then 
					#set c_total =(c_preco_venda * c_quantidade) + c_total;
					set c_segunda = c_total;
                    end if;
						if c_dia = 3 then
						#set c_total = (c_preco_venda * c_quantidade) + c_total;
                        set c_terca = c_total ;
                         end if;
								if c_dia = 4 then
                                	#set c_total = (c_preco_venda * c_quantidade) + c_total;
									set c_quarta = c_total;
                                    end if;
											if c_dia = 5 then
												#set c_total = (c_preco_venda * c_quantidade) + c_total;
                                                set c_quinta = c_total;
                                                      end if;
													if c_dia = 6 then
															#set c_total = (c_preco_venda * c_quantidade) + c_total;
															set c_sexta = c_total;  
																end if;
                                                                if c_dia = 7 then
                                                   # set c_total = (c_preco_venda * c_quantidade) + c_total;
														set c_sabado = c_total;
                                                         end if;
													
		select c_dia;	
	end while;
		insert into Diamedia(segunda, terca, quarta, quinta, sexta, sabado, domingo) values (c_segunda, c_terca, c_quarta, c_quinta, c_sexta, c_sabado, c_domingo);


    select * from Diamedia;
    
    close busca_cursor;
   
	
End$$
Delimiter ;

call mediaSemana(4);

##############################################################4C

create view vw_opdestino as
select
o.id_operador,
o.nome_op,
ve.id_venda,
ov.id,
v.id_viagem,
v.destino
from operador o
inner join venda ve on ve.id_operador = o.id_operador
inner join ordem_venda ov on ov.id_venda = ve.id_venda
inner join viagem v on v.id_viagem = ov.id_venda;


