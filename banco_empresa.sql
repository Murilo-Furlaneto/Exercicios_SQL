USE empresa;

CREATE TABLE Funcionarios (
    Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Primeiro_Nome VARCHAR(35) NOT NULL,
    Segundo_Nome VARCHAR(30) NOT NULL,
    Terceiro_Nome VARCHAR(30) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    CPF INT NOT NULL,
    RG INT NOT NULL,
    Endereco VARCHAR(55) NOT NULL,
    CEP INT NOT NULL,
    Cidade VARCHAR(30) NOT NULL,
    Fone INT NOT NULL,
    Funcao VARCHAR(40) NOT NULL,
    Salario DOUBLE NOT NULL,
    Codigo_Departamento INT
);

CREATE TABLE Departamentos (
    Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(40) NOT NULL,
    Localizacao VARCHAR(50),
    CodigoFuncionarioGerente INT
);

ALTER TABLE Funcionarios
ADD CONSTRAINT fk_Departamento
FOREIGN KEY (Codigo_Departamento) REFERENCES Departamentos(Codigo);

ALTER TABLE Departamentos
ADD CONSTRAINT fk_Funcionario
FOREIGN KEY (CodigoFuncionarioGerente) REFERENCES Funcionarios(Codigo);

ALTER TABLE Funcionarios MODIFY COLUMN CPF VARCHAR(11);


#----------POVOANDO AS TABELAS--------------------
INSERT INTO Departamentos (Nome, Localizacao) VALUES
('Departamento Pessoal', 'Prédio Principal'),
('Departamento Financeiro', 'Prédio Principal'),
('Departamento de Marketing', 'Prédio Principal'),
('Departamento de Vendas', 'Prédio Principal'),
('Departamento de TI', 'Prédio Anexo'),
('Departamento de Produção', 'Fábrica'),
('Departamento de RH', 'Prédio Principal');

INSERT INTO Funcionarios (Primeiro_Nome, Segundo_Nome, Ultimo_Nome, Data_Nascimento, CPF, RG, Endereco, CEP, Cidade, Fone, Funcao, Salario, Codigo_Departamento) VALUES
('Ana', 'Clara', 'Silva', '1980-01-01', 12345678901, 123456789, 'Rua A, 123', 12345, 'Araraquara', 123456789, 'Gerente', 10000.00, 1),
('Ana', 'Clara', 'Silva', '1980-01-01', 12345678901, 123456789, 'Rua A, 123', 12345, 'Araraquara', 123456789, 'Gerente', 10000.00, 1),
('João', 'Pedro', 'Souza', '1985-02-02', 23456789012, 234567890, 'Rua B, 234', 23456, 'São Paulo', 234567890, 'Vendedor', 5000.00, 4),
('Maria', 'Fernanda', 'Oliveira', '1990-03-03', 34567890123, 345678901, 'Rua C, 345', 34567, 'Rio de Janeiro', 345678901, 'Secretária', 3000.00, 1),
('José', 'Carlos', 'Santos', '1995-04-04', 45678901234, 456789012, 'Rua D, 456', 45678, 'Brasília', 456789012, 'Analista de TI', 4000.00, 5),
('Eduardo', 'Henrique', 'Barbosa', '2005-05-05', 98765432109, 987654321, 'Rua E, 543', 54321, 'Salvador', 987654321, 'Estagiário', 1500.00, 6),
('Ana', 'Clara', 'Silva', '1980-01-01', 12345678901, 123456789, 'Rua A, 123', 12345, 'Araraquara', 123456789, 'Gerente', 10000.00, 1),
('Ana', 'Clara', 'Silva', '1980-01-01', 12345678901, 123456789, 'Rua A, 123', 12345, 'Araraquara', 123456789, 'Gerente', 10000.00, 1),
('João', 'Pedro', 'Souza', '1985-02-02', 23456789012, 234567890, 'Rua B, 234', 23456, 'São Paulo', 234567890, 'Vendedor', 5000.00, 4),
('Maria', 'Fernanda', 'Oliveira', '1990-03-03', 34567890123, 345678901, 'Rua C, 345', 34567, 'Rio de Janeiro', 345678901, 'Secretária', 3000.00, 1),
('José', 'Carlos', 'Santos', '1995-04-04', 45678901234, 456789012, 'Rua D, 456', 45678, 'Brasília', 456789012, 'Analista de TI', 4000.00, 5),
('Eduardo', 'Henrique', 'Barbosa', '2005-05-05', 98765432109, 987654321, 'Rua E, 543', 54321, 'Salvador', 987654321, 'Estagiário', 1500.00, 6),
('Ana', 'Clara', 'Silva', '1980-01-01', 12345678901, 123456789, 'Rua A, 123', 12345, 'Araraquara', 123456789, 'Gerente', 10000.00, 1),
('João', 'Pedro', 'Souza', '1985-02-02', 23456789012, 234567890, 'Rua B, 234', 23456, 'São Paulo', 234567890, 'Vendedor', 5000.00, 4),
('Maria', 'Fernanda', 'Oliveira', '1990-03-03', 34567890123, 345678901, 'Rua C, 345', 34567, 'Rio de Janeiro', 345678901, 'Secretária', 3000.00, 1);


#1 - LISTAR NOME E SOBRENOME ORDADO POR SOBRENOME
SELECT Primeiro_Nome, Segundo_Nome FROM Funcionarios
ORDER BY Ultimo_Nome;

#2 - LISTAR TODOS OS CAMPOS DE FUNCIONARIOS ORDENADOS POR CIDADE
SELECT * FROM Funcionarios ORDER BY Cidade;

#3 - LISTE TODOS OS FUNCIONARIOS QUE TEM SALARIO SUPERIOR A MIL REAIS ORDENADOS PELO NOME COMPLETO
SELECT * FROM Funcionarios WHERE Salario > 1000.00 
ORDER BY  Primeiro_Nome, Segundo_Nome,Ultimo_Nome;

#  4 - liste a data de nascimento e o primeiro nome dos funcionarios ordenados do mais novo para o mais velho
SELECT Data_Nascimento, Primeiro_Nome FROM Funcionarios
ORDER BY Data_Nascimento DESC,Primeiro_Nome; 

# 5 - Liste os funcionários como uma listagem telefonica
SELECT Ultimo_Nome, Primeiro_Nome,Segundo_Nome,Fone,Endereco,Cidade	
FROM Funcionarios ORDER BY Ultimo_Nome,Primeiro_Nome,Segundo_Nome;

# 6 - Liste o total da folha de pagamento 
SELECT SUM(Salario) AS "TOTAL DA FOLHA DE PAGAMENTO" FROM Funcionarios;

# 7 - lISTE O NOME, NOME DO DEPARTMENTO EA FUNÇÃO DE TODOS OS FUNCIONARIOS;
SELECT F.Primeiro_Nome,D.Nome , F.Funcao
FROM Funcionarios F 
JOIN Departamentos D ON F.Codigo_D