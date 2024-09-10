Create database Livraria;
use Livraria;
create TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    senha VARCHAR(100),
    data_criacao_conta VARCHAR(11)
);
CREATE TABLE Livros (
    LivroID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(100),
    Editora VARCHAR(100),
    AnoPublicacao INT,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pendente',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE ItensPedido (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    LivroID INT,
    Quantidade INT NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);

INSERT INTO Clientes (Nome, Endereco, Telefone, Email, senha, data_criacao_conta) VALUES
('João Silva', 'Rua A, 123', '1111-1111', 'joao.silva@email.com', 'senha123', '2024-01-01'),
('Maria Oliveira', 'Rua B, 456', '2222-2222', 'maria.oliveira@email.com', 'senha456', '2024-01-05'),
('Pedro Santos', 'Rua C, 789', '3333-3333', 'pedro.santos@email.com', 'senha789', '2024-01-10'),
('Ana Costa', 'Rua D, 101', '4444-4444', 'ana.costa@email.com', 'senha101', '2024-01-15'),
('Carlos Pereira', 'Rua E, 202', '5555-5555', 'carlos.pereira@email.com', 'senha202', '2024-01-20'),
('Fernanda Almeida', 'Rua F, 303', '6666-6666', 'fernanda.almeida@email.com', 'senha303', '2024-01-25'),
('Roberto Souza', 'Rua G, 404', '7777-7777', 'roberto.souza@email.com', 'senha404', '2024-02-01'),
('Juliana Lima', 'Rua H, 505', '8888-8888', 'juliana.lima@email.com', 'senha505', '2024-02-05'),
('Ricardo Martins', 'Rua I, 606', '9999-9999', 'ricardo.martins@email.com', 'senha606', '2024-02-10'),
('Patrícia Rocha', 'Rua J, 707', '0000-0000', 'patricia.rocha@email.com', 'senha707', '2024-02-15'),
('Eduardo Silva', 'Rua K, 808', '1111-1112', 'eduardo.silva@email.com', 'senha808', '2024-02-20'),
('Luana Freitas', 'Rua L, 909', '2222-2223', 'luana.freitas@email.com', 'senha909', '2024-02-25'),
('Marcelo Costa', 'Rua M, 1010', '3333-3334', 'marcelo.costa@email.com', 'senha1010', '2024-03-01'),
('Tatiane Fernandes', 'Rua N, 1212', '4444-4445', 'tatiane.fernandes@email.com', 'senha1212', '2024-03-05'),
('Gustavo Rocha', 'Rua O, 1313', '5555-5556', 'gustavo.rocha@email.com', 'senha1313', '2024-03-10'),
('Bruna Lima', 'Rua P, 1414', '6666-6667', 'bruna.lima@email.com', 'senha1414', '2024-03-15'),
('André Santos', 'Rua Q, 1515', '7777-7778', 'andre.santos@email.com', 'senha1515', '2024-03-20'),
('Cláudia Lima', 'Rua R, 1616', '8888-8889', 'claudia.lima@email.com', 'senha1616', '2024-03-25'),
('Marcos Oliveira', 'Rua S, 1717', '9999-10000', 'marcos.oliveira@email.com', 'senha1717', '2024-04-01'),
('Patrícia Silva', 'Rua T, 1818', '1111-1113', 'patricia.silva@email.com', 'senha1818', '2024-04-05');

INSERT INTO Livros (Titulo, Autor, Editora, AnoPublicacao, Preco, Estoque) VALUES
('O Alquimista', 'Paulo Coelho', 'Rocco', 1988, 29.90, 10),
('Dom Casmurro', 'Machado de Assis', 'Editora Record', 1899, 39.90, 5),
('A Moreninha', 'Joaquim Manuel de Macedo', 'Martin Claret', 1844, 19.90, 8),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Agir', 1943, 25.00, 15),
('1984', 'George Orwell', 'Companhia das Letras', 1949, 35.00, 12),
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', 1954, 50.00, 7),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, 45.00, 20),
('A Cabana', 'William P. Young', 'Sextante', 2007, 30.00, 10),
('O Código Da Vinci', 'Dan Brown', 'Arqueiro', 2003, 40.00, 18),
('A Garota no Trem', 'Paula Hawkins', 'Record', 2015, 42.00, 11),
('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'Letramento', 2011, 55.00, 6),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', 1937, 40.00, 14),
('O Caçador de Pipas', 'Khaled Hosseini', 'Nova Fronteira', 2003, 37.00, 9),
('Cem Anos de Solidão', 'Gabriel García Márquez', 'Editora Record', 1967, 48.00, 13),
('O Sol é para Todos', 'Harper Lee', 'Jaboticaba', 1960, 34.00, 12),
('Os 7 Hábitos das Pessoas Altamente Eficazes', 'Stephen R. Covey', 'Campus', 1989, 42.00, 7),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Agir', 1943, 25.00, 15),
('A História Sem Fim', 'Michael Ende', 'Rocco', 1979, 33.00, 10),
('O Diário de Anne Frank', 'Anne Frank', 'Record', 1947, 28.00, 11),
('Quem Mexeu no Meu Queijo?', 'Spencer Johnson', 'Sextante', 1998, 25.00, 16);

INSERT INTO Pedidos (ClienteID, DataPedido, Status) VALUES
(1, '2024-09-01', 'Pendente'),
(2, '2024-09-02', 'Concluído'),
(3, '2024-09-03', 'Cancelado'),
(4, '2024-09-04', 'Pendente'),
(5, '2024-09-05', 'Concluído'),
(6, '2024-09-06', 'Pendente'),
(7, '2024-09-07', 'Concluído'),
(8, '2024-09-08', 'Cancelado'),
(9, '2024-09-09', 'Pendente'),
(10, '2024-09-10', 'Concluído'),
(11, '2024-09-11', 'Pendente'),
(12, '2024-09-12', 'Concluído'),
(13, '2024-09-13', 'Cancelado'),
(14, '2024-09-14', 'Pendente'),
(15, '2024-09-15', 'Concluído'),
(16, '2024-09-16', 'Cancelado'),
(17, '2024-09-17', 'Pendente'),
(18, '2024-09-18', 'Concluído'),
(19, '2024-09-19', 'Pendente'),
(20, '2024-09-20', 'Concluído');

INSERT INTO ItensPedido (PedidoID, LivroID, Quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(2, 4, 1),
(3, 5, 2),
(3, 6, 1),
(4, 7, 1),
(4, 8, 2),
(5, 9, 3),
(5, 10, 1),
(6, 11, 2),
(6, 12, 1),
(7, 13, 2),
(7, 14, 1),
(8, 15, 1),
(8, 16, 3),
(9, 17, 2),
(9, 18, 1),
(10, 19, 1),
(10, 20, 2),
(11, 1, 2),
(11, 5, 1),
(12, 6, 1),
(12, 9, 2),
(13, 10, 1),
(13, 12, 3),
(14, 13, 2),
(14, 15, 1),
(15, 16, 2),
(15, 18, 1),
(16, 19, 3),
(16, 20, 2),
(17, 1, 1),
(17, 4, 2),
(18, 5, 1),
(18, 7, 2),
(19, 8, 3),
(19, 9, 1),
(20, 10, 2),
(20, 11, 1);

-- Listar os Usuarios cadastrados no Banco
select * from clientes
order by nome asc;

-- Quantos Usuarios foram cadastrados no ultimo mês?
SELECT Nome, data_criacao_conta
FROM Clientes
WHERE MONTH(data_criacao_conta) = 4;

-- Criar script restaurar informações de login de 1 usuário!
UPDATE Clientes
SET 
    senha = 'nova_senha_segura', 
    Telefone = '0000-0000', 
    Email = 'novo.email@dominio.com', 
    data_criacao_conta = '2024-09-01' 
WHERE ClienteID = 1;

select * from Clientes;


-- Criar script selecão de Livros cadastrados?
select * from livros
order by Titulo asc;

-- Criar script de livros emprestados por cliente?
SELECT c.Nome NomeCliente, l.Titulo TituloLivro, ip.Quantidade Quantidade
FROM Clientes c
JOIN Pedidos p ON c.ClienteID = p.ClienteID
JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
JOIN Livros l ON ip.LivroID = l.LivroID
WHERE c.ClienteID = 1;

-- Elaborar 3 perguntas utilizando as clausulas: Distinct, Not , Top

-- Distinct
SELECT DISTINCT Autor
FROM Livros;

-- Not
SELECT Titulo, Autor, Editora, AnoPublicacao, Preco
FROM Livros
WHERE Editora NOT LIKE 'Rocco';


-- Top
SELECT TOP 5 Titulo, Autor, AnoPublicacao
FROM Livros
ORDER BY AnoPublicacao DESC;
-- O top não funciona no mysql entao usamos o Limit 
SELECT Titulo, Autor, AnoPublicacao
FROM Livros
ORDER BY AnoPublicacao DESC
LIMIT 5;








