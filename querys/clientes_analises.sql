-- Clientes com tempo de fidelidade
select
    nome,
    email,
    cidade,
    telefone,
    datediff(day, data_cadastro, getdate()) as dias_fidelidade
from dbo.Clientes
order by dias_fidelidade desc;

-- Essa consulta mostra há quanto tempo o cliente está na base
