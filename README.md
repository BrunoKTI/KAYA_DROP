

📊 Projeto KAYA_DROP

Sistema fictício de loja online, desenvolvido como projeto de portfólio, para praticar SQL Server, Python e Power BI aplicados a um fluxo de dados realista.

O objetivo é simular operações de um e-commerce e aplicar boas práticas em modelagem de dados, queries, procedures, triggers e análise de dados.

📂 Estrutura do Projeto
KAYADROP/
│
├── sql/            # scripts SQL (tabelas, procedures, triggers)
│   ├── tabelas.sql
│   ├── procedures.sql
│   ├── triggers.sql
│
├── python/         # scripts Python para simulação de transações e ETL
├── querys/         # consultas SQL utilizadas em relatórios e análises
├── dashboard/      # arquivos do Power BI
├── data/           # arquivos de dados exportados e tratados
└── README.md

🗄️ Modelagem de Dados

O banco de dados é composto pelas principais tabelas:

clientes → informações dos clientes cadastrados.

produtos → catálogo da loja, com controle de estoque.

vendas → registros das vendas realizadas.

itensvenda → detalhamento dos produtos em cada venda.

⚙️ Procedures

Foram criadas procedures para automatizar operações comuns, como:

Inserção de clientes.

Registro de novas vendas.

Atualização de estoque.

Essas procedures centralizam a lógica e garantem consistência no banco.

🛡️ Trigger de Controle de Estoque

Foi criada a trigger trg_bloqueia_venda_sem_estoque para impedir vendas sem produto em estoque.

🔎 Como funciona

Executada no momento da tentativa de inserir itens em uma venda.

Se o estoque for menor que a quantidade pedida → a venda é bloqueada.

Caso contrário:

O item da venda é inserido.

O estoque do produto é atualizado automaticamente.

📝 Script
create trigger trg_bloqueia_venda_sem_estoque
on itensvenda
instead of insert
as
begin
    set nocount on;

    if exists (
        select 1
        from inserted i
        join produtos p on p.id_produto = i.produto_id
        where p.estoque < i.quantidade
    )
    begin
        raiserror('venda bloqueada: produto sem estoque suficiente!', 16, 1);
        rollback transaction;
        return;
    end

    insert into itensvenda (venda_id, produto_id, quantidade, preco_unitario)
    select i.venda_id, i.produto_id, i.quantidade, i.preco_unitario
    from inserted i;

    update p
    set p.estoque = p.estoque - i.quantidade
    from produtos p
    join inserted i on p.id_produto = i.produto_id;
end;
go

📊 Análises e Dashboard

Os dados tratados são exportados e consumidos no Power BI, permitindo criar relatórios sobre:

Produtos mais vendidos.

Clientes mais ativos.

Estoque disponível.

Faturamento acumulado.

🚀 Tecnologias Utilizadas

SQL Server → modelagem, procedures, triggers e queries.

Python → geração de dados fictícios e ETL.

Power BI → visualização e análise de dados.

Git/GitHub → versionamento e portfólio.
