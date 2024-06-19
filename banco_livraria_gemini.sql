CREATE DATABASE livraria_gemini;
USE livraria_gemini;

CREATE TABLE autores (
  id_autor INT PRIMARY KEY AUTO_INCREMENT,
  nome_autor VARCHAR(255) NOT NULL,
  nacionalidade VARCHAR(255) NOT NULL
);

CREATE TABLE editoras (
  id_editora INT PRIMARY KEY AUTO_INCREMENT,
  nome_editora VARCHAR(255) NOT NULL,
  cidade VARCHAR(255) NOT NULL
);

CREATE TABLE livros (
  id_livro INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(255) NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  id_autor INT NOT NULL,
  id_editora INT NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  data_publicacao DATE NOT NULL,
  FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
  FOREIGN KEY (id_editora) REFERENCES editoras(id_editora)
);

CREATE TABLE vendas (
  id_venda INT PRIMARY KEY AUTO_INCREMENT,
  id_livro INT NOT NULL,
  data_venda DATE NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

INSERT INTO autores (nome_autor, nacionalidade) VALUES
  ('Gabriel Garcia Marquez', 'Colômbia'),
  ('Paulo Coelho', 'Brasil'),
  ('George R.R. Martin', 'Estados Unidos'),
  ('J.K. Rowling', 'Reino Unido');

INSERT INTO editoras (nome_editora, cidade) VALUES
  ('Editora Record', 'São Paulo'),
  ('Editora Rocco', 'Rio de Janeiro'),
  ('Editora Intrínseca', 'São Paulo'),
  ('Editora Bertrand Brasil', 'Rio de Janeiro');

INSERT INTO livros (titulo, isbn, id_autor, id_editora, preco, data_publicacao) VALUES
  ('Cem Anos de Solidão', '978-85-00-06563-2', 1, 1, 39.90, '1967-06-01'),
  ('O Alquimista', '978-85-00-06562-4', 2, 1, 34.90, '1988-03-01'),
  ('As Crônicas de Gelo e Fogo', '978-85-95021-62-4', 3, 2, 49.90, '1996-08-01'),
  ('Harry Potter e a Pedra Filosofal', '978-85-75-04001-2', 4, 3, 43.90, '1998-06-26');

INSERT INTO vendas (id_livro, data_venda, quantidade) VALUES
  (1, '2024-05-20', 2),
  (2, '2024-05-22', 3),
  (3, '2024-05-25', 1),
  (4, '2024-05-27', 4);
  


#Nível Básico:

#   Consultar todos os livros da loja.
SELECT * FROM Livros;
#  Consultar o nome e nacionalidade de todos os autores.
SELECT nome_autor,nacionalidade FROM autores;
#   Consultar o nome e a cidade de todas as editoras.
SELECT nome_editora, cidade FROM editoras;
#   Consultar o título, o preço e a data de publicação de todos os livros.
SELECT titulo,preco,data_publicacao FROM livros;
#   Consultar o título, o nome do autor e o nome da editora de todos os livros.
SELECT livros.titulo, autores.nome_autor, editoras.nome_editora FROM livros 
JOIN autores ON livros.id_autor = autores.id_autor
JOIN editoras ON livros.id_editora = editoras.id_editora;

#Nível Intermediário:

#    Consultar a quantidade total de livros vendidos.
SELECT SUM(quantidade) AS total_vendidos
FROM vendas;
#    Consultar o livro mais vendido (maior quantidade vendida).
SELECT livros.titulo, SUM(vendas.quantidade) AS total_vendido
FROM livros
JOIN vendas ON livros.id_livro = vendas.id_livro
GROUP BY livros.titulo
ORDER BY total_vendido DESC
LIMIT 1;

#    Consultar o autor com mais livros publicados.
SELECT autores.nome_autor, COUNT(livros.id_livro) AS livros_publicados
FROM autores JOIN livros ON autores.id_autor = livros.id_autor
GROUP BY autores.nome_autor
ORDER BY livros_publicados
 LIMIT 1;
#    Consultar a editora com maior receita total de vendas.
SELECT editoras.nome_editora, SUM(livros.preco * vendas.quantidade) AS receita_total
FROM editoras
JOIN livros ON editoras.id_editora = livros.id_editora
JOIN vendas ON livros.id_livro = vendas.id_livro
GROUP BY editoras.nome_editora
ORDER BY receita_total DESC
LIMIT 1;

#    Consultar o preço médio dos livros por autor.
SELECT  AVG(livros.preco) AS preco_medio, autores.nome_autor  FROM livros
JOIN autores ON livros.id_autor = autores.nome_autor
GROUP BY autores.nome_autor
ORDER BY preco_medio LIMIT 1;

#
#Nível Avançado:

#    Consultar os autores que possuem livros publicados em mais de uma editora.
#    Consultar os livros que foram publicados em um determinado ano e que ainda possuem estoque (nenhuma venda registrada).
#    Consultar o lucro total da loja por mês de venda.
#    Consultar os autores que possuem livros com preço superior à média geral dos preços dos livros.
#    Consultar as editoras que publicaram livros de autores de pelo menos três nacionalidades diferentes.


