create database jogo_futebol;
use jogo_futebol;

create table times (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cidade VARCHAR(50)
);

create table posicoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

create table jogadores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    posicao_id INT,
    time_id INT,
    FOREIGN KEY (posicao_id) REFERENCES posicoes(id),
    FOREIGN KEY (time_id) REFERENCES times(id)
);

INSERT INTO times (nome, cidade) VALUES
('Flamengo', 'Rio de Janeiro'),
('Corinthians', 'São Paulo'),
('Grêmio', 'Porto Alegre'),
('Bahia', 'Salvador');

INSERT INTO posicoes (nome) VALUES
('Goleiro'),
('Zagueiro'),
('Meia'),
('Atacante');

INSERT INTO jogadores (nome, posicao_id, time_id) VALUES
('Yuri', 4, 2),
('Memphis', 3, 1),
('Hugo', 1, 2),
('Romero', 4, 3),
('Breno', 1, NULL),  
('gustavo', 3, NULL); 

-- selecionar
SELECT 
    j.nome AS Jogador,
    t.nome AS Time,
    p.nome AS Posicao
FROM jogadores j
INNER JOIN times t ON j.time_id = t.id
INNER JOIN posicoes p ON j.posicao_id = p.id;
-- selecionar

-- selecionar
SELECT 
    j.nome AS Jogador,
    t.nome AS Time,
    p.nome AS Posicao
FROM jogadores j
LEFT JOIN times t ON j.time_id = t.id
LEFT JOIN posicoes p ON j.posicao_id = p.id;
-- selecionar

-- selecionar
SELECT 
    j.nome AS Jogador,
    t.nome AS Time,
    p.nome AS Posicao
FROM jogadores j
RIGHT JOIN times t ON j.time_id = t.id
LEFT JOIN posicoes p ON j.posicao_id = p.id;
-- selecionar 

-- selecionar
SELECT 
    j.nome AS Jogador,
    t.nome AS Time,
    p.nome AS Posicao
FROM jogadores j
RIGHT JOIN times t ON j.time_id = t.id

UNION

SELECT 
    j.nome AS Jogador,
    t.nome AS Time,
    p.nome AS Posicao
FROM jogadores j
LEFT JOIN posicoes p ON j.posicao_id = p.id;
-- selecionar 