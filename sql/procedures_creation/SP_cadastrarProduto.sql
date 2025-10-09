create procedure SPcadastrarProduto(

	@nomeProduto varchar(100),
	@preco decimal(10,2),
	@qtd_estoque int,
	@nomeCategoria varchar(50),
	@descricao varchar(500)
)
as 
	set nocount on;

	begin transaction;	
	begin try


	insert into Produto(nomeProduto, preco, qtd_estoque)	
	values (@nomeProduto, @preco, @qtd_estoque);
	
	insert into categoria(nomeCategoria, descricao)
	values (@nomeCategoria, @descricao);

	commit transaction;

	end try

begin catch

begin 

rollback

end

end catch
go
	

	-- Procedure: SPcadastrarProduto
-- Descrição: Realiza o cadastro de um novo produto e sua respectiva categoria.
-- Utiliza transação para garantir integridade dos dados:
-- Se tudo ocorrer bem, executa COMMIT; caso contrário, realiza ROLLBACK.
-- Parâmetros:
--   @nomeProduto     -> Nome do produto
--   @preco           -> Valor do produto
--   @qtd_estoque     -> Quantidade em estoque
--   @nomeCategoria   -> Nome da categoria
--   @descricao       -> Descrição da categoria
