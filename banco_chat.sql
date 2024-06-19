-- Criação do banco de dados
CREATE DATABASE loja;

USE loja;

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER,
    cidade TEXT
);


CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    produto TEXT,
    quantidade INTEGER,
    preco REAL
);

-- Inserção de dados
INSERT INTO clientes (nome, idade, cidade) VALUES ('João', 30, 'São Paulo');
INSERT INTO clientes (nome, idade, cidade) VALUES ('Maria', 25, 'Rio de Janeiro');
INSERT INTO clientes (nome, idade, cidade) VALUES ('Carlos', 40, 'Salvador');
INSERT INTO clientes (nome, idade, cidade) VALUES ('Ana', 35, 'Brasília');
INSERT INTO clientes (nome, idade, cidade) VALUES ('Pedro', 28, 'Belo Horizonte');

INSERT INTO pedidos (cliente_id, produto, quantidade, preco) VALUES (1, 'Camiseta', 2, 25.50);
INSERT INTO pedidos (cliente_id, produto, quantidade, preco) VALUES (2, 'Calça Jeans', 1, 50.75);
INSERT INTO pedidos (cliente_id, produto, quantidade, preco) VALUES (3, 'Tênis', 1, 80.00);
INSERT INTO pedidos (cliente_id, produto, quantidade, preco) VALUES (4, 'Camisa Polo', 3, 35.25);
INSERT INTO pedidos (cliente_id, produto, quantidade, preco) VALUES (5, 'Shorts', 2, 20.00);

-- 1. Selecione todos os clientes.
SELECT * FROM clientes;
-- 2. Selecione todos os pedidos.
SELECT * FROM pedidos;
-- 3. Selecione o nome e a cidade de todos os clientes.
SELECT nome,cidade FROM clientes;
-- 4. Selecione o nome e a idade dos clientes com idade superior a 30 anos.
SELECT nome,idade FROM clientes WHERE idade > 30;
-- 5. Selecione todos os pedidos com um preço superior a R$ 30.00.
SELECT * FROM pedidos WHERE preco > 30.0;
-- 6. Atualize o preço do produto "Camiseta" para R$ 30.00.
UPDATE pedidos SET preco = 30.00 WHERE produto = "Camiseta";
SELECT produto FROM pedidos;
-- 7. Remova todos os pedidos com quantidade igual a 1.
DELETE FROM pedidos WHERE quantidade = 1;
-- 8. Selecione o nome do cliente e o produto que ele comprou.
SELECT clientes.nome, pedidos.produto FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;
-- 9. Selecione o nome do cliente e a quantidade de pedidos que ele fez.
SELECT clientes.nome,pedidos.quantidade FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;
-- 10. Selecione o produto mais caro.
SELECT MAX(preco) FROM pedidos;
-- 11. Selecione todos os clientes que compraram o produto "Tênis".
SELECT clientes.nome FROM clientes 
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id 
WHERE pedidos.produto = "Tênis"; 
-- 12. Selecione o nome do cliente e o total gasto por ele.
SELECT c.nome, SUM(p.preco) AS total_gasto FROM clientes c 
INNER JOIN pedidos p ON c.id = p.cliente_id GROUP BY c.nome;
-- 13. Selecione o nome do cliente e a cidade onde ele mora, apenas se ele já fez um pedido.
SELECT DISTINCT nome, cidade FROM clientes INNER JOIN pedidos 
ON cliente_id = pedidos.cliente_id WHERE pedidos.quantidade > 1;
-- 14. Selecione o nome do cliente que ainda não fez nenhum pedido.
SELECT nome FROM clientes INNER JOIN pedidos 
ON clientes.id = pedidos.cliente_id 
WHERE pedidos.quantidade = 0;
-- 15. Selecione o nome do cliente, o produto que ele comprou e a quantidade de cada produto.
SELECT clientes.nome, pedidos.produto, pedidos.quantidade 
FROM clientes INNER JOIN pedidos ON  clientes.id = pedidos.cliente_id;
