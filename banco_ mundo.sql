CREATE TABLE Pais(
Nome VARCHAR(35) NOT NULL,
Continente VARCHAR(35) NOT NULL,
Pop REAL NOT NULL,
Expec_vida REAL NOT NULL
);

CREATE TABLE Cidade(
Nome VARCHAR(35) NOT NULL,
Pais VARCHAR(35) NOT NULL,
Pop REAL NOT NULL,
Capital VARCHAR(1) NOT NULL
);

CREATE TABLE Rio(
Nome VARCHAR(35) NOT NULL,
Nascente VARCHAR(35) NOT NULL,
Pais VARCHAR(35) NOT NULL,
Comprimento INT NOT NULL
);

ALTER TABLE Pais
ADD PIB REAL;

SELECT * FROM PAIS;
SELECT * FROM Cidade;

INSERT INTO Pais(Nome, Continente, Pop, PIB, Expec_vida) VALUES ("Canada", "Am. Norte" , 30.1, 658,77.08);
INSERT INTO Pais VALUES ("Mexico", "Am. Norte", 107.5,694,69.1);
INSERT INTO Pais VALUES ("Brasil", "Am. Sul", 183.3, 10004,65.2);
INSERT INTO Pais VALUES ("USA", "Am. Norte", 270.0, 8003,75.5);

INSERT INTO Cidade VALUES ("Washington", "USA", 3.3, "S");
INSERT INTO Cidade VALUES ("Monterrey", "Mexico", 2.0,"N");
INSERT INTO Cidade VALUES ("Brasilia", "Brasil", 1.5,"S");
INSERT INTO Cidade VALUES ("São Paulo", "Brasil", 15.0, "N");
INSERT INTO Cidade VALUES ("Ottawa", "Canada",0.8, "S");
INSERT INTO Cidade VALUES ("Cid. Mexico", "Mexico", 14.1, "S");

INSERT INTO Rio VALUES("St.Lawrence", "USA", "USA", 3.3);
INSERT INTO Rio VALUES ("Grande", "USA","Mexico", 2.0);
INSERT INTO Rio VALUES ("Parana", "Brasil", "Brasil", 1.5);
INSERT INTO Rio VALUES ("Mississipi", "USA","USA", 15.0);

#---------Exercícios--------------#

# 1 - Liste todas as cidades e os países aos quais pertencem

SELECT nome, pais FROM Cidade; 

# 2 - Liste todas as cidades que são capitais
SELECT nome FROM Cidade WHERE capital = "S"; 

# 3 - Liste todos os atributos dos países onde a expectativa de vida é menor que 70 anos
SELECT * FROM Pais WHERE Expec_vida < 70.0;

# 4 - Liste todas as capitais e as populações dos países cujo PIB é maior que 1 trilhão de dólares
SELECT Cidade.Nome, Pais.Pop FROM Pais 
JOIN Cidade ON Pais.Nome = Cidade.Pais
WHERE pais.PIB > 100000  AND cidade.Capital = "S";

# 5 - Quais são os nomes e a população da capital do país onde o rio St.Lawrence tem sua nascente.
SELECT Cidade.Nome, Cidade.Pop, Rio.Pais 
FROM Cidade 
JOIN Rio ON Cidade.Pais = Rio.Nascente 
WHERE Cidade.Capital = "S" AND Rio.Nome = "St.Lawrence";

# 6 - Qual é a média da população das cidades que não são capitais
SELECT AVG(Pop) AS "MEDIA DA POPULAÇÃO" FROM Cidade WHERE Capital = "N"; 

# 7 - Para cada continente retorne o PIB medio de seus paises.
SELECT  continente, AVG(PIB) AS "MEDIA DO PIB" FROM Pais
GROUP BY continente;

# 8 - Para cada pais onde pelo menos 2 rios tem nascente, encontre o comprimento do menor rio
SELECT Pais.Nome, MIN(R1.Comprimento) AS Comprimento_Menor_Rio
FROM Rio AS R1
JOIN Rio AS R2 ON R1.Nascente = R2.Nascente AND R1.Nome <> R2.Nome
JOIN Pais ON R1.Pais = Pais.Nome
GROUP BY Pais.Nome
HAVING COUNT(DISTINCT R1.Nome) >= 2;

# 9 - Liste os paises cujo PIB é maior que PIB do Canada
SELECT Nome FROM Pais Where PIB > (SELECT MAX(PIB)  FROM Pais WHERE Nome = 'Canada') 
GROUP BY Nome;
