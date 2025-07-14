
use kaya_drop;
go


CREATE TABLE Clientes (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    email VARCHAR(100),
    estilo_preferido VARCHAR(50),
    cidade VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE Produtos (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    categoria VARCHAR(50),         -- Ex: "roupa", "skate", "acessorio"
    categoria_classe VARCHAR(100), -- Ex: "skate(peças)", "acessorios_tabacaria"
    preco DECIMAL(10,2),
    estoque INT
);


CREATE TABLE Vendas (
    id INT PRIMARY KEY IDENTITY,
    cliente_id INT FOREIGN KEY REFERENCES Clientes(id),
    data_venda DATE,
    total DECIMAL(10,2)
);

CREATE TABLE ItensVenda (
    id INT PRIMARY KEY IDENTITY,
    venda_id INT FOREIGN KEY REFERENCES Vendas(id),
    produto_id INT FOREIGN KEY REFERENCES Produtos(id),
    quantidade INT,
    preco_unitario DECIMAL(10,2)
);






