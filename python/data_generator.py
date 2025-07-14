from faker import Faker
import random
from db_connect import get_connection

fake = Faker('pt_BR')

conn = get_connection()
cursor = conn.cursor()

# Inserir clientes
for _ in range(10):
    nome = fake.name()
    email = fake.email()
    estilo = random.choice(['skate', 'street', 'underground', 'tabacaria'])
    cidade = fake.city()
    data_cadastro = fake.date_this_year()
    
    cursor.execute("""
        INSERT INTO Clientes (nome, email, estilo_preferido, cidade, data_cadastro)
        VALUES (?, ?, ?, ?, ?)
    """, (nome, email, estilo, cidade, data_cadastro))

# Inserir produtos
produtos = [
    ("Camiseta Drop 001", "vestuario", "vestuario(roupas)", 79.90, 20),
    ("Shape Profissional", "skate", "skate(peças)", 249.90, 10),
    ("Boné 5Panel", "acessorios", "acessorios(bonés, bags...)", 89.90, 15),
    ("Seda OCB King Size", "tabacaria", "acessorios_tabacaria", 7.90, 100),
    ("Nike SB Bruin", "tenis", "tenis", 399.90, 5),
]

for nome, categoria, classe, preco, estoque in produtos:
    cursor.execute("""
        INSERT INTO Produtos (nome, categoria, categoria_classe, preco, estoque)
        VALUES (?, ?, ?, ?, ?)
    """, (nome, categoria, classe, preco, estoque))

conn.commit()
print("Dados inseridos com sucesso!")
conn.close()
