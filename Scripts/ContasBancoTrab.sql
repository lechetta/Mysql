/*1 - conta de admin*/
create user 'admin'@'%' identified by 'SenhaMassa123@';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';
/*2 - conta da Aplicacao*/
create user 'App'@'%' identified by 'App001';
GRANT SELECT,INSERT,UPDATE,DELETE ON *.* TO 'App'@'%';
/*3 - conta do desenvolvedor*/
create user 'Dev'@'%' identified by 'Dev123';
Grant SELECT,INSERT,UPDATE,DELETE,create,drop ON nova_era.* to 'Dev'@'%'; 
/*4 - Conta backup*/
create user 'backup'@'localhost';