

-- Criação da tabela de Autores
CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome_autor VARCHAR(100)
);

-- Criação da tabela de Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100),
    endereco_cliente VARCHAR(255)
);

-- Criação da tabela de Livros
CREATE TABLE livros (
    id_livro SERIAL PRIMARY KEY,
    titulo_livro VARCHAR(100),
    id_autor INT REFERENCES autores(id_autor)
);

-- Criação da tabela de Empréstimos
CREATE TABLE emprestimos (
    id_emprestimo SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_livro INT REFERENCES livros(id_livro),
    data_emprestimo DATE,
    data_devolucao DATE
);


-- Inserção na tabela Autores
INSERT INTO autores (nome_autor) VALUES
('Machado de Assis'), ('Jorge Amado'), ('Graciliano Ramos'),
('Aluísio Azevedo'), ('José de Alencar'), ('Joaquim M. de Macedo'),
('Eça de Queirós'), ('Bernardo Guimarães');

-- Inserção na tabela Clientes
INSERT INTO clientes (nome_cliente, endereco_cliente) VALUES
('Zé da Manga', 'Rua das Flores, 123'),
('Zé das Couves', 'Av. Brasil, 456'),
('Zé das Nuves', 'Praça Central, 789'),
('Maria Zinha', 'Rua do Comércio, 55'),
('Gertrude Gomes', 'Av. Atlântica, 2000'),
('Gael Gallileu', 'Rua Nova, 222'),
('Isac Newton da Silva', 'Av. das Palmeiras, 12'),
('Kennyd José da Silva', 'Rua da Praia, 88'),
('Goku da Silva José', 'Rua Principal, 300'),
('Titi da Silva José', 'Rua Principal, 300');

-- Inserção na tabela Livros
INSERT INTO livros (titulo_livro, id_autor) VALUES
('Dom Casmurro', 1), ('Capitães da Areia', 2), ('Vidas Secas', 3),
('O Cortiço', 4), ('Iracema', 5), ('A Moreninha', 6),
('Memórias Póstumas', 1), ('Senhora', 5), ('O Primo Basílio', 7),
('A Escrava Isaura', 8);

-- Inserção na tabela Empréstimos
INSERT INTO emprestimos (id_cliente, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 1, '2025-01-10', '2025-01-20'),
(2, 2, '2025-02-05', NULL),
(3, 3, '2025-01-15', '2025-01-28'),
(4, 4, '2025-03-01', '2025-03-12'),
(5, 5, '2025-02-20', '2025-03-05'),
(6, 6, '2025-01-25', '2025-02-10'),
(7, 7, '2025-02-15', NULL),
(8, 8, '2025-03-03', '2025-03-17'),
(9, 9, '2025-02-28', NULL),
(10, 10, '2025-01-18', '2025-02-01');


Deleção 

 DELETE FROM emprestimos WHERE id_emprestimo = 4;

Atualização (UPDATE)
UPDATE emprestimos SET data_devolucao = '2025-02-20' WHERE id_emprestimo = 2;


SELECT
    e.id_emprestimo,
    c.nome_cliente,
    l.titulo_livro,
    a.nome_autor,
    e.data_emprestimo,
    e.data_devolucao
FROM
    emprestimos e
JOIN
    clientes c ON e.id_cliente = c.id_cliente
JOIN
    livros l ON e.id_livro = l.id_livro
JOIN
    autores a ON l.id_autor = a.id_autor
ORDER BY
    e.id_emprestimo;


SELECT
    c.nome_cliente,
    l.titulo_livro,
    e.data_emprestimo
FROM
    emprestimos e
JOIN
    clientes c ON e.id_cliente = c.id_cliente
JOIN
    livros l ON e.id_livro = l.id_livro
WHERE
    e.data_devolucao IS NULL;