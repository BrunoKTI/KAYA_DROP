create procedure SPcadastrarProduto
/*Cadastro de Produtos*/

	@nome varchar(100),
	@categoria varchar(50),
	@preco decimal(10,2)
as 
	begin 
	insert into Produtos(nome, categoria,preco)
	values (@nome, @categoria, @preco)
end
go