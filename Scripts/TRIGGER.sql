#pergunta 3

Delimiter $$

create trigger evitaGravar
before insert on employees for each row
begin
	if new.first_name = 'Leandro' && new.last_name = 'jose' then
    signal sqlstate '45000'
    set message_text = 'nome invalido';
    end if;
    end $$
    Delimiter ;
    
    insert into employees (id, first_name, last_name) values (1900, 'Leandro', 'jose');
    
    drop trigger evitaGravar;
    
   
#pergunta 5   

Delimiter $$

create trigger atualizaCidade
before update on employees for each row
begin 
	if(old.city != 'Boston') then 
    signal sqlstate '45000'
    set message_text = 'cidade invalido';
    end if;
    end $$;
    Delimiter ; 
    
    update employees set first_name = 'Nancy' where id = 2;
    
    
    
#pergunta 6

Delimiter $$

create trigger salvaexcluido
before delete on log for each row
begin
insert into ocorrencias values (old.id, old.data_, old.hora, old.descricao);
 end $$
 Delimiter ; 

set sql_safe_updates = 0;

delete from log where id = 1;

drop trigger salvaexcluido;

create database trigger_;
	use trigger_;

create table log (
id int(3),
data_ varchar(30),
hora varchar(30),
descricao varchar(30)
);

insert into log values (1, '2018/04/25', '11:00', 'nao sei');
insert into log values (2, '2017/08/11', '15:00', 'sei');


create table ocorrencias(
id int(3),
data_ varchar(30),
hora varchar(30),
descricao varchar(30)
);

select * from ocorrencias;
    
    