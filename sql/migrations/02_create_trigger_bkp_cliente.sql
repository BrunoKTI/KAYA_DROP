 create trigger bkp_cliente
on Clientes
after insert
as
begin
   set nocount on;

     insert into backup_Clientes (nome, email, datainsercao, usuarioinsercao)
     select i.nome, i.email, getdate(), suser_sname()
     from inserted i;
end;
go
