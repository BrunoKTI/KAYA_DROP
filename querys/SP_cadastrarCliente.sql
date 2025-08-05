
create procedure SPcadastrarCliente
/*cadastramento de clientes*/
	@Nome varchar(100),
	@DataNascimento DATE,
	@cidade varchar(50),
	@Email varchar(50)
as  
begin
	insert into Clientes(nome, email, cidade, data_cadastro)
	values(@Nome, @Email, @Cidade, GETDATE())
end
go