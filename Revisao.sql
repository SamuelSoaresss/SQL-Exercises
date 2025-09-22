CREATE TABLE autores(
	id_autor  SERIAL PRIMARY KEY,
	nome_autor VARCHAR(100)
);

CREATE TABLE livros(
	id_livro SERIAL PRIMARY KEY,
	titulo_livro VARCHAR(100),
	id_autor INT REFERENCES autores(id_autor)
);

CREATE TABLE clientes(
	id_cliente SERIAL PRIMARY KEY,
	nome_cliente VARCHAR(100),
	endereco_cliente VARCHAR(100)

);

CREATE TABLE emprestimos(
	id_emprestimo SERIAL PRIMARY KEY,
	id_cliente INT REFERENCES clientes(id_cliente),
	id_livro INT REFERENCES livros(id_livros),
	

)