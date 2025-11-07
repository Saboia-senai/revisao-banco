CREATE DATABASE pedido_lanche;
USE pedido_lanche;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    preco DECIMAL(10,2)
);

CREATE TABLE itens_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome) VALUES
('João'),
('Maria'),
('Carlos'),
('Ana'),
('Beatriz');  

INSERT INTO produtos (nome, preco) VALUES
('Hambúrguer', 25.00),
('Batata Frita', 8.50),
('Refrigerante', 6.00),
('Milkshake', 12.00),
('Sorvete', 10.00),
('Salada', 9.00);  

INSERT INTO pedidos (cliente_id, data) VALUES
(1, '2025-10-30'),
(2, '2025-10-30'),
(3, '2025-10-31');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2), 
(1, 3, 1), 
(2, 1, 1), 
(2, 2, 1), 
(3, 4, 2); 

-- selecionar
SELECT 
    c.nome AS Cliente,
    p.id AS Pedido_ID,
    p.data AS Data_Pedido
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id;
-- selecionar

-- selecionar
SELECT 
    c.nome AS Cliente,
    p.id AS Pedido_ID,
    p.data AS Data_Pedido
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;
-- selecionar

-- selecionar
SELECT 
    pr.nome AS Produto,
    pr.preco AS Preço,
    ip.quantidade AS Quantidade,
    p.id AS Pedido_ID
FROM itens_pedido ip
RIGHT JOIN produtos pr ON ip.produto_id = pr.id
LEFT JOIN pedidos p ON ip.pedido_id = p.id;
-- selecionar

-- selecionar
SELECT 
    c.nome AS Cliente,
    pr.nome AS Produto,
    ip.quantidade AS Quantidade,
    p.data AS Data_Pedido
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN itens_pedido ip ON p.id = ip.pedido_id
INNER JOIN produtos pr ON ip.produto_id = pr.id;
-- selecionar

-- selecionar
SELECT 
    c.nome AS Cliente,
    COUNT(p.id) AS Total_Pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome;
-- selecionar