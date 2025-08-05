create procedure SPregistrarVenda
/*Registro de vendas*/
	
	@ClienteId int,
	@Total decimal(10,2)
as 
	begin 
	insert into Vendas(cliente_id, data_venda, total)
	values (@ClienteId, getdate(), @total)
end
go
