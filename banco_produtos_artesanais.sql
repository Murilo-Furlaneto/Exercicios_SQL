USE banco_produtos_artesanais;

-- Populando a tabela Artistas
INSERT INTO Artistas (nome, pais_origem, email, biografia) VALUES
('João Silva', 'Brasil', 'joao.silva@email.com', 'Artista plástico brasileiro com obras em exposição em diversos museus.'),
('Maria González', 'Espanha', 'maria.gonzalez@email.com', 'Escultora espanhola especializada em arte contemporânea.'),
('John Smith', 'Estados Unidos', 'john.smith@email.com', 'Pintor americano conhecido por suas paisagens detalhadas.');

-- Populando a tabela Produtos
INSERT INTO Produtos (nome, descricao, preco, quantidade_estoque, idArtistas) VALUES
('Colar de Prata', 'Colar artesanal feito de prata 925', 150.00, 20, 1),
('Vaso de Cerâmica', 'Vaso de cerâmica decorativo feito à mão', 80.00, 15, 2),
('Pintura a Óleo', 'Pintura a óleo em tela, tamanho 50x70cm', 300.00, 10, 3);

-- Populando a tabela Endereco
INSERT INTO Endereco (logradouro, bairro, cidade, cep) VALUES
('Rua das Flores, 123', 'Centro', 'São Paulo', 01234),
('Calle Principal, 456', 'Barrio Norte', 'Madri', 28001),
('Main Street, 789', 'Downtown', 'New York', 10001);

-- Populando a tabela Forma_Pagamento
INSERT INTO Forma_Pagamento (tipo_pagamento, numero_cartao, data_validade, nome_titular) VALUES
('Cartão de Crédito', 1234567890123456, '2026-12-31', 'João Silva'),
('Cartão de Crédito', 9876543210987654, '2027-05-31', 'Maria González'),
('PayPal', 1234567889675437, '2025-07-13', 'John Smith');

-- Populando a tabela Clientes
INSERT INTO Clientes (nome, email, idEndereco, idForma_Pagamento) VALUES
('Ana Santos', 'ana.santos@email.com', 1, 4),
('Pedro Lima', 'pedro.lima@email.com', 2, 5),
('Carla Pereira', 'carla.pereira@email.com', 3, 6);

-- Populando a tabela Pedidos
INSERT INTO Pedidos (data_pedido, status_pedido, total_pedido, idClientes) VALUES
('2024-06-10', 'Processando', 230.00, 4),
('2024-06-11', 'Enviado', 80.00, 5),
('2024-06-12', 'Entregue', 300.00, 6);


#Exercícios:

#    SQL básico:
# Escreva uma consulta para listar todos os produtos disponíveis no banco de dados, mostrando o nome do produto, o nome do artista que o criou e o preço.
SELECT * FROM produtos;

# Escreva uma consulta para encontrar os cinco artistas com mais produtos em estoque.
SELECT A.nome AS nome_artista, COUNT(P.idProdutos) AS total_produtos_em_estoque
FROM Artistas A
JOIN Produtos P ON A.idArtistas = P.idArtistas
GROUP BY A.idArtistas
ORDER BY total_produtos_em_estoque DESC
LIMIT 5;

# Escreva uma consulta para calcular o valor total de todos os pedidos feitos no último mês.
SELECT SUM(pedidos.total_pedido) AS valor_total FROM pedidos
WHERE pedidos.data_pedido >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
AND data_pedido <= CURRENT_DATE();

# avançado:

#    Escreva uma consulta para encontrar o cliente que fez o maior número de pedidos.
SELECT C.nome AS nome_cliente, COUNT(P.idPedidos) AS total_pedidos
FROM Clientes C
JOIN Pedidos P ON C.idClientes = P.idClientes
GROUP BY C.idClientes
ORDER BY total_pedidos DESC
LIMIT 1;

# Escreva uma consulta para calcular o valor médio dos produtos em estoque para cada país de origem dos artistas.
SELECT artistas.pais_origem, AVG(produtos.preco) AS media_preco
FROM produtos 
JOIN artistas ON produtos.idArtistas = artistas.idArtistas 
WHERE produtos.quantidade_estoque > 0 
GROUP BY artistas.pais_origem;

# Escreva uma consulta para listar os produtos que não foram vendidos nos últimos três meses.
SELECT *
FROM Produtos
WHERE idProdutos NOT IN (
    SELECT DISTINCT idProdutos
    FROM Pedidos
    WHERE data_pedido >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH)
);
