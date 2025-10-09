##Armazena informações dos clientes da loja##

create table cliente(
	id_cliente int primary key identity,
	nome varchar(100)not null,
	telefone char(11)not null,
	email varchar(100)not null,
	data_cadastro datetime,
	status_cliente varchar(20)
);
go

##Registra os produtos disponíveis para venda##

create table produto(
	id_produto int primary key identity,
	nomeProduto varchar,
	preco decimal(10,2),
	qtd_estoque int,
	id_categoria int not null, 
    constraint fk_produto_categoria foreign key
    (id_categoria) references categoria(id_categoria)
);
go

##Registra os usuarios do sistema##

create table usuario(
	id_usuario int primary key identity,
	nomeUsuario varchar(100) not null,
	userName varchar(20) not null,
	senha varchar(20) not null,
	perfilUser varchar(20)

);
go

##Registra as transações de vendas##

create table venda(
	id_venda int primary key identity,
	dataVenda datetime,
	valorTotal decimal(10,2)not null,
	formaPagamento varchar(20)not null,
	statuVenda varchar(20),
	nomeVendedor varchar(100),
	id_cliente int not null,
	constraint fk_id_cliente foreign key
	(id_cliente) references cliente(id_cliente)
);
go


##Registra os produtos que compõem cada venda##


create table itensVenda(
	id_itensVenda int primary key identity,
	quantidade int,
	precoUnitario decimal(10,2),
	subtotal decimal(10,2),
	id_venda int not null,				
	constraint fk_id_venda foreign key
    (id_venda) references venda(id_venda),
    id_produto int not null
    constraint fk_id_produto foreign key
    (id_produto) references produto(id_produto)

);
go


##Classifica os produtos vendidos##


create table categoria(
	id_categoria int primary key identity,
	nomeCategoria varchar(50)not null,
	descricao varchar(500)
); 
go

##Controla os pagamentos realizados pelos clientes##

create table pagamento(
	id_pagamento int primary key identity,
	dataPagamento datetime,
	valorPago decimal(10,2),
	formaPagamento varchar(20),
	statusPagamento varchar(20),
	id_venda int not null,
	constraint fk_id_venda_pg foreign key
	(id_venda) references venda(id_venda)
);
go


--Relacionamentos:
/*Cliente (1) ───< (N) Venda
Venda (1) ───< (N) ItensVenda >───(N) Produto (1)
Produto (N) ───< (1) Categoria
Venda (1) ───< (N) Pagamento ###*/








