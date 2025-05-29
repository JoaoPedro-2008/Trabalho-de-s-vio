CREATE DATABASE EscolaDB;
USE EscolaDB;
CREATE TABLE Professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    disciplina VARCHAR(50)
);

CREATE TABLE Turmas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professores(id)
);
-- Inserir professores
INSERT INTO Professores (nome, disciplina) VALUES
('Maria Oliveira', 'Matemática'),
('Carlos Silva', 'História'),
('Joana Souza', 'Biologia');

-- Inserir turmas
INSERT INTO Turmas (nome, professor_id) VALUES
('Turma A', 1),
('Turma B', 2),
('Turma C', 1),
('Turma D', 3);
SELECT 
    Turmas.nome AS Turma,
    Professores.nome AS Professor,
    Professores.disciplina
FROM 
    Turmas
JOIN 
    Professores ON Turmas.professor_id = Professores.id;
SELECT 
    Professores.nome AS Professor,
    COUNT(Turmas.id) AS NumeroDeTurmas
FROM 
    Professores
LEFT JOIN 
    Turmas ON Turmas.professor_id = Professores.id
GROUP BY 
    Professores.id;
SELECT * FROM Turmas WHERE professor_id IS NULL;
