
create procedure SPcadastrarCliente

	@nome varchar(100),
	@telefone char(11),
	@Email varchar(100),
	@data_cadastro datetime,
	@status_cliente varchar(10)

as  
begin

	SET NOCOUNT ON;

	insert into clientes(nome, telefone, email, data_cadastro, status_cliente)
	values(@Nome, @telefone, @email, GETDATE(), @status_cliente)
end
go