/*Registro de vendas*/

create procedure SPregistrarVenda(

	@dataVenda datetime,
	@valorTotal decimal(10,2),
	@formaPagamento decimal(10,2),
	@statuVenda varchar(20),
	@nomeVendedor varchar(100)	
)
as 
	set nocount on;

	begin 
	insert into Venda(dataVenda, valorTotal,formaPagamento, statuVenda,nomeVendedor)
	values (@dataVenda, @valorTotal, @formaPagamento, @statuVenda, @nomeVendedor)
end
go

