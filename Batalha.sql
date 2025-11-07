CREATE DATABASE jogo_batalha;
USE jogo_batalha;

CREATE TABLE personagens (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    classe_id INT,
    nivel INT
    );
    
CREATE TABLE classes (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
	tipo_ataque VARCHAR(50)
    );
    
CREATE TABLE batalhas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    personagem1_id INT,
    personagem2_id INT,
    vencedor_id int
    );
    
INSERT INTO classes (id, nome, tipo_ataque) VALUES
(1, 'Guerreiro', 'contato'),
(2, 'Mago', 'magia'),
(3, 'Arqueiro', 'longo alcance'),
(4, 'Assassino', 'roubo'),
(5, 'Curandeiro', 'Cura');

INSERT INTO personagens (id, nome, classe_id, nivel) VALUES
(1, 'Arthur', 1, 15),
(2, 'Joao', 2, 20),
(3, 'Simon', 3, 12),
(4, 'Kaua', 4, 18),
(5, 'Samuel', 5, 10),
(6, 'Saboia', 1, 8);  

INSERT INTO batalhas (id, personagem1_id, personagem2_id, vencedor_id) VALUES
(1, 1, 2, 2),  
(2, 3, 4, 4), 
(3, 2, 5, 2);  

-- selecionar
SELECT
    p.nome AS Personagem,
    c.nome AS Classe,
    c.tipo_ataque AS Tipo_Ataque,
    p.nivel AS Nível
FROM personagens p
INNER JOIN classes c ON p.classe_id = c.id;
-- selecionar

-- selecionar
SELECT
    p.nome AS Personagem,
    b.id AS Batalha_ID,
    b.vencedor_id AS Vencedor_ID
FROM personagens p
LEFT JOIN batalhas b 
    ON p.id = b.personagem1_id OR p.id = b.personagem2_id;
-- selecionar

-- selecionar
SELECT
    c.nome AS Classe,
    c.tipo_ataque AS Tipo_Ataque,
    p.nome AS Personagem
FROM personagens p
RIGHT JOIN classes c ON p.classe_id = c.id;
-- selecionar

-- selecionar
SELECT
    p.nome AS Personagem,
    c.nome AS Classe,
    c.tipo_ataque AS Tipo_Ataque
FROM personagens p
LEFT JOIN classes c ON p.classe_id = c.id

UNION

SELECT
    p.nome AS Personagem,
    c.nome AS Classe,
    c.tipo_ataque AS Tipo_Ataque
FROM personagens p
RIGHT JOIN classes c ON p.classe_id = c.id;
-- selecionar

-- selecionar
SELECT
    p1.nome AS Personagem_1,
    p2.nome AS Personagem_2,
    v.nome AS Vencedor
FROM batalhas b
INNER JOIN personagens p1 ON b.personagem1_id = p1.id
INNER JOIN personagens p2 ON b.personagem2_id = p2.id
INNER JOIN personagens v ON b.vencedor_id = v.id;
-- selecionar

-- selecionar
SELECT
    p.nome AS Personagem,
    COUNT(b.id) AS Total_Batalhas
FROM personagens p
LEFT JOIN batalhas b 
    ON p.id = b.personagem1_id OR p.id = b.personagem2_id
GROUP BY p.nome;
-- selecionar

-- selecionar
SELECT
    c.nome AS Classe,
    COUNT(p.id) AS Total_Personagens
FROM personagens p
RIGHT JOIN classes c ON p.classe_id = c.id
GROUP BY c.nome;
-- selecionar

