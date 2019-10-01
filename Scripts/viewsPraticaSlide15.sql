create view vwRequisicoes
as select r.reqid, 
d.deptoid,
d.depto,
i.itemid,
i.item,
r.qtd,
r.precounit,
(r.qtd * r.precounit) as total
from requisicoes r
inner join departamento d on r.deptoid = d.deptoid
inner join item i on i.itemid = r.itemid;
select * from vwRequisicoes;

create view vwdepto 
as select d.depto,
i.item,
r.qtd,
r.precounit
from requisicoes r
inner join departamento d on r.deptoid = d.deptoid
inner join item i on i.itemid = r.itemid;


select * from vwdepto;


create view wxexemplo 
as select 
d.depto,
i.item,
sum(r.qtd),
sum(r.qtd * r.precounit) as total
from requisicoes r
inner join departamento d on r.deptoid = d.deptoid
inner join item i on i.itemid = r.itemid
group by d.depto, i.item;

select * from wxexemplo