CREATE DATABASE cliente3;

USE cliente3;

-- Tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    ValorTotal DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preco DECIMAL(10,2)
);

-- Tabela de Detalhes do Pedido
CREATE TABLE DetalhesPedido (
    DetalheID INT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10,2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (ClienteID, Nome, Email) VALUES
(1, 'João Silva', 'joao@example.com'),
(2, 'Maria Oliveira', 'maria@example.com'),
(3, 'Carlos Santos', 'carlos@example.com');

-- Inserindo dados na tabela Produtos
INSERT INTO Produtos (ProdutoID, Nome, Preco) VALUES
(1, 'Camiseta', 25.00),
(2, 'Calça Jeans', 50.00),
(3, 'Tênis', 80.00);

-- Inserindo dados na tabela Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido, ValorTotal) VALUES
(101, 1, '2024-03-01', 155.00),
(102, 2, '2024-03-02', 130.00),
(103, 3, '2024-03-03', 60.00);

-- Inserindo dados na tabela DetalhesPedido
INSERT INTO DetalhesPedido (DetalheID, PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 101, 1, 2, 25.00),
(2, 101, 2, 1, 50.00),
(3, 102, 1, 3, 25.00),
(4, 103, 3, 1, 80.00);

### Exercícios SQL:

# - 1. Selecione todos os clientes.
SELECT * FROM Clientes;

# - 2. Selecione todos os produtos.
SELECT * FROM Produtos;

# - 3. Selecione todos os pedidos.
SELECT * FROM Pedidos;

# - 4. Selecione todos os detalhes de pedido.
SELECT * FROM Pedidos;

# - 5. Selecione o nome e email de todos os clientes.
SELECT Nome,Email FROM Clientes;

# - 6. Selecione o nome e preço de todos os produtos.
SELECT Nome,Preco FROM Produtos;

# - 7. Selecione o ClienteID e DataPedido de todos os pedidos.
SELECT ClienteID, PedidoID FROM Pedidos;

# - 8. Selecione o PedidoID e Nome do produto de todos os detalhes de pedido.
SELECT PedidoID, P.Nome AS NomeProduto FROM DetalhesPedido dp
JOIN Produtos p ON dp.ProdutoID = p.ProdutoID;

# - 9. Selecione o PedidoID, Nome do cliente e ValorTotal de todos os pedidos.
SELECT PedidoID, C.Nome as NomeCliente, ValorTotal FROM Pedidos p
 JOIN Clientes c ON   p.ClienteID = c.ClienteID;

# - 10. Selecione o ProdutoID, Nome do produto, Quantidade e PreçoUnitario de todos os detalhes de pedido.
SELECT ProdutoID, P.Nome AS Nome,  

# - 11. Selecione todos os clientes que fizeram pedidos.
# - 12. Selecione todos os produtos que foram pedidos.
# - 13. Selecione todos os pedidos feitos por um cliente específico (por exemplo, ClienteID = 1).
# - 14. Selecione todos os detalhes de pedidos para um pedido específico (por exemplo, PedidoID = 101).
# - 15. Selecione o total de cada pedido (Quantidade * PreçoUnitario) e mostre ao lado do PedidoID.
