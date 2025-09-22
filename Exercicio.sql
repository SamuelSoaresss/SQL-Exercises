CREATE TABLE Cursos(
	CursoID SERIAL PRIMARY KEY,
	CursoNome VARCHAR(100),
	ProfessorNome VARCHAR(100)
);

INSERT INTO Cursos(CursoNome,ProfessorNome) VALUES
	('Logica de programação', 'Gioliano'),
	('POO','Diego');

CREATE TABLE Alunos(
	AlunoID INT PRIMARY KEY,
	AlunoNome VARCHAR(100),
	CursoID INT REFERENCES Cursos(CursoID)
);

INSERT INTO Alunos(AlunoID, AlunoNome, CursoID) VALUES
	(1, 'Bia',1),
	(2, 'Jorge',1),
	(3,'Sam',2),
	(4,'Hugo',2);

SELECT
	Alunos.AlunoNome,
	Cursos.CursoNome,
	Cursos.ProfessorNome
FROM
	Alunos
JOIN
	Cursos ON Alunos.CursoID = Cursos.CursoID;


