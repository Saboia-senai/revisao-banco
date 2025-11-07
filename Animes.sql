create database anime;
use anime;

CREATE TABLE animes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    genero VARCHAR(30)
);

CREATE TABLE personagens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    anime_id INT,
    FOREIGN KEY (anime_id) REFERENCES animes(id)
);

CREATE TABLE habilidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    personagem_id INT,
    FOREIGN KEY (personagem_id) REFERENCES personagens(id)
);

INSERT INTO animes (titulo, genero) VALUES
('Naruto', 'Ação'),
('One Piece', 'Aventura'),
('Attack on Titan', 'Drama'),
('Demon Slayer', 'Fantasia');

INSERT INTO personagens (nome, anime_id) VALUES
('Naruto Uzumaki', 1),
('Sasuke Uchiha', 1),
('Luffy', 2),
('Zoro', 2),
('Eren Yeager', 3),
('Tanjiro Kamado', 4),
('Goku', NULL), 
('Baki Hanma', NULL); 

INSERT INTO habilidades (nome, personagem_id) VALUES
('Rasengan', 1),
('Chidori', 2),
('Gomu Gomu no Pistol', 3),
('Santoryu', 4),
('Transformação Titã', 5),
('Respiração da Água', 6),
('Poder Perdido', NULL); 

-- selecionar
SELECT 
    p.nome AS Personagem,
    a.titulo AS Anime,
    a.genero AS Genero
FROM personagens p
INNER JOIN animes a ON p.anime_id = a.id;
-- selecionar

-- selecionar
SELECT 
    p.nome AS Personagem,
    a.titulo AS Anime,
    h.nome AS Habilidade
FROM personagens p
LEFT JOIN animes a ON p.anime_id = a.id
LEFT JOIN habilidades h ON p.id = h.personagem_id;
-- selecionar

-- selecionar
SELECT 
    p.nome AS Personagem,
    a.titulo AS Anime
FROM personagens p
LEFT JOIN animes a ON p.anime_id = a.id

UNION 

SELECT	
    p.nome AS Personagem,
    a.titulo AS Anime
FROM personagens p
RIGHT JOIN animes a ON p.anime_id = a.id;
-- selecionar

-- selecionar
SELECT 
    p.nome AS Personagem,
    h.nome AS Habilidade,
    a.titulo AS Anime
FROM personagens p
INNER JOIN habilidades h ON p.id = h.personagem_id
INNER JOIN animes a ON p.anime_id = a.id;
-- selecionar

-- selecionar
SELECT 
    a.titulo AS Anime,
    COUNT(p.id) AS Total_Personagens
FROM animes a
LEFT JOIN personagens p ON a.id = p.anime_id
GROUP BY a.titulo;
-- selecionar

-- selecionar
SELECT 
    p.nome AS Personagem
FROM personagens p
LEFT JOIN habilidades h ON p.id = h.personagem_id
WHERE h.id IS NULL;
-- selecionar