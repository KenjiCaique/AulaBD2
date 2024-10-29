-- Criar banco de dados
CREATE DATABASE anxiety;
USE anxiety;
 
-- Tabela de Usuários
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    instituicao VARCHAR(100),
    contato_emergencia VARCHAR(15),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
 
-- Tabela de Humores
CREATE TABLE humores (
    id_humor INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_registro DATE NOT NULL,
    humor ENUM('feliz', 'triste', 'ansioso', 'calmo', 'neutro', 'estressado') NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
 
-- Tabela de Relatórios
CREATE TABLE relatorios (
    id_relatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_inicial DATE NOT NULL,
    data_final DATE NOT NULL,
    tempo_tela_minutos INT DEFAULT 0,
    humor_medio ENUM('feliz', 'triste', 'ansioso', 'calmo', 'neutro', 'estressado'),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
 
-- Tabela de Trilhas de Assistência
CREATE TABLE trilhas_assistencia (
    id_trilha INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_inicial DATE NOT NULL,
    status ENUM('em andamento', 'concluida') NOT NULL,
    tipo_trilha VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
 
-- Tabela de Assistente de Respiração
CREATE TABLE assistente_respiracao (
    id_respiracao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_sessao DATETIME NOT NULL,
    duracao_minutos INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
 
-- Tabela de Modo Foco
CREATE TABLE modos_foco (
    id_foco INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_inicio DATETIME NOT NULL,
    duracao_minutos INT NOT NULL,
    tipo_som ENUM('agua', 'floresta', 'musica', 'branco') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
 
-- Tabela de Emergências
CREATE TABLE emergencias (
    id_emergencia INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    data_emergencia DATETIME NOT NULL,
    mensagem_enviada BOOLEAN DEFAULT FALSE,
    localizacao VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- Inserir 30 Usuários
INSERT INTO usuarios (nome_completo, email, senha, instituicao, contato_emergencia) VALUES
('Ana Silva', 'ana.silva@email.com', 'senha1', 'Universidade A', '99999-9999'),
('Bruno Santos', 'bruno.santos@email.com', 'senha2', 'Universidade B', '88888-8888'),
('Carlos Oliveira', 'carlos.oliveira@email.com', 'senha3', 'Universidade C', '77777-7777'),
('Diana Costa', 'diana.costa@email.com', 'senha4', 'Universidade D', '66666-6666'),
('Eduardo Lima', 'eduardo.lima@email.com', 'senha5', 'Universidade E', '55555-5555'),
('Fernanda Rocha', 'fernanda.rocha@email.com', 'senha6', 'Universidade F', '44444-4444'),
('Gustavo Almeida', 'gustavo.almeida@email.com', 'senha7', 'Universidade G', '33333-3333'),
('Heloísa Martins', 'heloisa.martins@email.com', 'senha8', 'Universidade H', '22222-2222'),
('Igor Pereira', 'igor.pereira@email.com', 'senha9', 'Universidade I', '11111-1111'),
('Juliana Ferreira', 'juliana.ferreira@email.com', 'senha10', 'Universidade J', '00000-0000'),
('Karla Mendes', 'karla.mendes@email.com', 'senha11', 'Universidade K', '10101-0101'),
('Lucas Santos', 'lucas.santos@email.com', 'senha12', 'Universidade L', '20202-0202'),
('Mariana Nunes', 'mariana.nunes@email.com', 'senha13', 'Universidade M', '30303-0303'),
('Nicolas Rocha', 'nicolas.rocha@email.com', 'senha14', 'Universidade N', '40404-0404'),
('Olivia Teixeira', 'olivia.teixeira@email.com', 'senha15', 'Universidade O', '50505-0505'),
('Paulo Souza', 'paulo.souza@email.com', 'senha16', 'Universidade P', '60606-0606'),
('Quésia Lima', 'quesia.lima@email.com', 'senha17', 'Universidade Q', '70707-0707'),
('Rafael Dias', 'rafael.dias@email.com', 'senha18', 'Universidade R', '80808-0808'),
('Sofia Martins', 'sofia.martins@email.com', 'senha19', 'Universidade S', '90909-0909'),
('Tiago Santos', 'tiago.santos@email.com', 'senha20', 'Universidade T', '10101-0101'),
('Ursula Alves', 'ursula.alves@email.com', 'senha21', 'Universidade U', '21212-1212'),
('Vitor Costa', 'vitor.costa@email.com', 'senha22', 'Universidade V', '32323-2323'),
('Wanda Lima', 'wanda.lima@email.com', 'senha23', 'Universidade W', '43434-3434'),
('Xuxa Rocha', 'xuxa.rocha@email.com', 'senha24', 'Universidade X', '54545-4545'),
('Yasmin Silva', 'yasmin.silva@email.com', 'senha25', 'Universidade Y', '65656-5656'),
('Zeca Pereira', 'zecapereira@email.com', 'senha26', 'Universidade Z', '76767-6767'),
('André Martins', 'andre.martins@email.com', 'senha27', 'Universidade A', '87878-7878'),
('Beatriz Nunes', 'beatriz.nunes@email.com', 'senha28', 'Universidade B', '98989-8989'),
('Claudio Alves', 'claudio.alves@email.com', 'senha29', 'Universidade C', '00000-0001'),
('Daniela Costa', 'daniela.costa@email.com', 'senha30', 'Universidade D', '00000-0002');

-- Inserir 30 Humores (5 para cada usuário)
INSERT INTO humores (id_usuario, data_registro, humor, descricao) VALUES
(1, '2024-10-20', 'ansioso', 'Senti muita pressão para os exames.'),
(1, '2024-10-21', 'calmo', 'Tive um dia tranquilo.'),
(1, '2024-10-22', 'feliz', 'Concluí um projeto importante.'),
(1, '2024-10-23', 'triste', 'Senti falta de casa.'),
(1, '2024-10-24', 'estressado', 'Tive uma semana cheia.'),
(2, '2024-10-20', 'triste', 'Não consegui me concentrar.'),
(2, '2024-10-21', 'feliz', 'Dia divertido com amigos.'),
(2, '2024-10-22', 'ansioso', 'Prova se aproximando.'),
(2, '2024-10-23', 'calmo', 'Pratiquei meditação.'),
(2, '2024-10-24', 'estressado', 'Muitos trabalhos acumulados.'),
(3, '2024-10-20', 'feliz', 'Passei em uma prova difícil.'),
(3, '2024-10-21', 'neutro', 'Dia comum na faculdade.'),
(3, '2024-10-22', 'triste', 'Recebi uma notícia ruim.'),
(3, '2024-10-23', 'calmo', 'Aproveitei a natureza.'),
(3, '2024-10-24', 'ansioso', 'Desafio se aproximando.'),
(4, '2024-10-20', 'feliz', 'Dia de comemoração.'),
(4, '2024-10-21', 'triste', 'Saudades da família.'),
(4, '2024-10-22', 'ansioso', 'Estudos intensos.'),
(4, '2024-10-23', 'calmo', 'Caminhada relaxante.'),
(4, '2024-10-24', 'estressado', 'Pronto para os exames.'),
(5, '2024-10-20', 'feliz', 'Consegui um estágio.'),
(5, '2024-10-21', 'calmo', 'Dia tranquilo.'),
(5, '2024-10-22', 'ansioso', 'Provas se aproximando.'),
(5, '2024-10-23', 'triste', 'Senti falta de casa.'),
(5, '2024-10-24', 'estressado', 'Muitos trabalhos acumulados.'),
(6, '2024-10-20', 'ansioso', 'Preocupação com as notas.'),
(6, '2024-10-21', 'calmo', 'Concluí as tarefas.'),
(6, '2024-10-22', 'feliz', 'Recebi elogios.'),
(6, '2024-10-23', 'triste', 'Sentimentos de solidão.'),
(6, '2024-10-24', 'estressado', 'Sobrecarregado com os estudos.'),
(7, '2024-10-20', 'feliz', 'Dia ensolarado.'),
(7, '2024-10-21', 'neutro', 'Nada de especial.'),
(7, '2024-10-22', 'triste', 'Desentendimento com um amigo.'),
(7, '2024-10-23', 'calmo', 'Tive um momento de paz.'),
(7, '2024-10-24', 'ansioso', 'Amanhã é dia de prova.'),
(8, '2024-10-20', 'feliz', 'Fiz novas amizades.'),
(8, '2024-10-21', 'triste', 'Lembrei de um amigo que se foi.'),
(8, '2024-10-22', 'ansioso', 'Sem saber o que esperar.'),
(8, '2024-10-23', 'calmo', 'Pratiquei yoga.'),
(8, '2024-10-24', 'estressado', 'Falta de tempo.'),
(9, '2024-10-20', 'feliz', 'Completar um projeto.'),
(9, '2024-10-21', 'calmo', 'Dia sem estresse.'),
(9, '2024-10-22', 'ansioso', 'Preparando-se para entrevistas.'),
(9, '2024-10-23', 'triste', 'Fiquei doente.'),
(9, '2024-10-24', 'estressado', 'Carga de trabalho alta.'),
(10, '2024-10-20', 'feliz', 'Dia produtivo.'),
(10, '2024-10-21', 'triste', 'Senti cansaço.'),
(10, '2024-10-22', 'ansioso', 'Preparação para a apresentação.'),
(10, '2024-10-23', 'calmo', 'Momento de reflexão.'),
(10, '2024-10-24', 'estressado', 'Falta de sono.'),
(11, '2024-10-20', 'ansioso', 'Provas se aproximando.'),
(11, '2024-10-21', 'calmo', 'Tive um dia relaxante.'),
(11, '2024-10-22', 'feliz', 'Um dia incrível.'),
(11, '2024-10-23', 'triste', 'Desentendimento familiar.'),
(11, '2024-10-24', 'estressado', 'Sobrecarga de trabalhos.'),
(12, '2024-10-20', 'feliz', 'Encontrei velhos amigos.'),
(12, '2024-10-21', 'triste', 'Me sinto cansado.'),
(12, '2024-10-22', 'ansioso', 'Provas se aproximando.'),
(12, '2024-10-23', 'calmo', 'Momento de paz.'),
(12, '2024-10-24', 'estressado', 'Falta de descanso.'),
(13, '2024-10-20', 'feliz', 'Conquistei uma meta.'),
(13, '2024-10-21', 'neutro', 'Dia normal.'),
(13, '2024-10-22', 'triste', 'Desapontamento.'),
(13, '2024-10-23', 'calmo', 'Fiz uma pausa.'),
(13, '2024-10-24', 'ansioso', 'Cansado de estudar.'),
(14, '2024-10-20', 'feliz', 'Dia de sol.'),
(14, '2024-10-21', 'triste', 'Senti solidão.'),
(14, '2024-10-22', 'ansioso', 'Preocupações com notas.'),
(14, '2024-10-23', 'calmo', 'Meditei hoje.'),
(14, '2024-10-24', 'estressado', 'Muitos trabalhos acumulados.'),
(15, '2024-10-20', 'feliz', 'Completar tarefas.'),
(15, '2024-10-21', 'triste', 'Falta de motivação.'),
(15, '2024-10-22', 'ansioso', 'Preparação para provas.'),
(15, '2024-10-23', 'calmo', 'Dia produtivo.'),
(15, '2024-10-24', 'estressado', 'Muitos prazos.'),
(16, '2024-10-20', 'feliz', 'Passei na prova.'),
(16, '2024-10-21', 'triste', 'Recebi uma crítica.'),
(16, '2024-10-22', 'ansioso', 'Faltam poucos dias para a prova.'),
(16, '2024-10-23', 'calmo', 'Fiz exercícios físicos.'),
(16, '2024-10-24', 'estressado', 'Muitos trabalhos acumulados.'),
(17, '2024-10-20', 'feliz', 'Um dia de sucesso.'),
(17, '2024-10-21', 'triste', 'Lembrei de algo triste.'),
(17, '2024-10-22', 'ansioso', 'Preparativos para a apresentação.'),
(17, '2024-10-23', 'calmo', 'Momento de tranquilidade.'),
(17, '2024-10-24', 'estressado', 'Excesso de atividades.'),
(18, '2024-10-20', 'feliz', 'Reunião produtiva.'),
(18, '2024-10-21', 'triste', 'Cansaço acumulado.'),
(18, '2024-10-22', 'ansioso', 'Preocupação com a prova.'),
(18, '2024-10-23', 'calmo', 'Momento relaxante.'),
(18, '2024-10-24', 'estressado', 'Desafios na faculdade.'),
(19, '2024-10-20', 'feliz', 'Dia de conquistas.'),
(19, '2024-10-21', 'triste', 'Senti saudade.'),
(19, '2024-10-22', 'ansioso', 'Expectativas altas.'),
(19, '2024-10-23', 'calmo', 'Relaxei com música.'),
(19, '2024-10-24', 'estressado', 'Carga intensa de trabalho.'),
(20, '2024-10-20', 'feliz', 'Experiência positiva.'),
(20, '2024-10-21', 'triste', 'Senti solidão.'),
(20, '2024-10-22', 'ansioso', 'Tensão para as provas.'),
(20, '2024-10-23', 'calmo', 'Pratiquei mindfulness.'),
(20, '2024-10-24', 'estressado', 'Sem tempo para relaxar.'),
(21, '2024-10-20', 'feliz', 'Encontrei um amigo.'),
(21, '2024-10-21', 'triste', 'Dia chuvoso.'),
(21, '2024-10-22', 'ansioso', 'Expectativa alta para a apresentação.'),
(21, '2024-10-23', 'calmo', 'Pratiquei a respiração profunda.'),
(21, '2024-10-24', 'estressado', 'Sobrecarga de estudos.'),
(22, '2024-10-20', 'feliz', 'Boa performance na prova.'),
(22, '2024-10-21', 'triste', 'Senti falta dos amigos.'),
(22, '2024-10-22', 'ansioso', 'Preparativos para o evento.'),
(22, '2024-10-23', 'calmo', 'Momento de descontração.'),
(22, '2024-10-24', 'estressado', 'Estudos em excesso.'),
(23, '2024-10-20', 'feliz', 'Dia divertido.'),
(23, '2024-10-21', 'triste', 'Reflexão sobre o passado.'),
(23, '2024-10-22', 'ansioso', 'Preocupação com o futuro.'),
(23, '2024-10-23', 'calmo', 'Dia relaxante.'),
(23, '2024-10-24', 'estressado', 'Carga excessiva de trabalho.'),
(24, '2024-10-20', 'feliz', 'Concluí tarefas.'),
(24, '2024-10-21', 'triste', 'Senti pressão.'),
(24, '2024-10-22', 'ansioso', 'Expectativa para provas.'),
(24, '2024-10-23', 'calmo', 'Refletindo sobre o dia.'),
(24, '2024-10-24', 'estressado', 'Muitos prazos.'),
(25, '2024-10-20', 'feliz', 'Ótima conversa.'),
(25, '2024-10-21', 'triste', 'Pensando no futuro.'),
(25, '2024-10-22', 'ansioso', 'Preparação para o evento.'),
(25, '2024-10-23', 'calmo', 'Fiz uma pausa.'),
(25, '2024-10-24', 'estressado', 'Trabalhos acumulados.'),
(26, '2024-10-20', 'feliz', 'Bom feedback.'),
(26, '2024-10-21', 'triste', 'Lembrei de um momento difícil.'),
(26, '2024-10-22', 'ansioso', 'Faltam poucos dias para a prova.'),
(26, '2024-10-23', 'calmo', 'Relaxei ouvindo música.'),
(26, '2024-10-24', 'estressado', 'Estudos em excesso.'),
(27, '2024-10-20', 'feliz', 'Dia de alegrias.'),
(27, '2024-10-21', 'triste', 'Relembrando momentos tristes.'),
(27, '2024-10-22', 'ansioso', 'Expectativas altas.'),
(27, '2024-10-23', 'calmo', 'Meditei durante o dia.'),
(27, '2024-10-24', 'estressado', 'Muitos compromissos.'),
(28, '2024-10-20', 'feliz', 'Bom dia.'),
(28, '2024-10-21', 'triste', 'Pensamentos negativos.'),
(28, '2024-10-22', 'ansioso', 'Aproxima-se a prova.'),
(28, '2024-10-23', 'calmo', 'Tive um momento de paz.'),
(28, '2024-10-24', 'estressado', 'Trabalhos acumulados.'),
(29, '2024-10-20', 'feliz', 'Conquistei algo novo.'),
(29, '2024-10-21', 'triste', 'Dia melancólico.'),
(29, '2024-10-22', 'ansioso', 'Aproximando-se do prazo.'),
(29, '2024-10-23', 'calmo', 'Descansei bem.'),
(29, '2024-10-24', 'estressado', 'Estudos em excesso.'),
(30, '2024-10-20', 'feliz', 'Dia de alegrias.'),
(30, '2024-10-21', 'triste', 'Refletindo sobre o passado.'),
(30, '2024-10-22', 'ansioso', 'Preparação para a apresentação.'),
(30, '2024-10-23', 'calmo', 'Momento de descontração.'),
(30, '2024-10-24', 'estressado', 'Sobrecarregado com estudos.');

-- Inserir 60 Relatórios (2 para cada usuário)
INSERT INTO relatorios (id_usuario, data_inicial, data_final, tempo_tela_minutos, humor_medio) VALUES
(1, '2024-10-20', '2024-10-21', 120, 'ansioso'),
(1, '2024-10-22', '2024-10-23', 90, 'calmo'),
(2, '2024-10-20', '2024-10-21', 150, 'triste'),
(2, '2024-10-22', '2024-10-23', 100, 'feliz'),
(3, '2024-10-20', '2024-10-21', 200, 'feliz'),
(3, '2024-10-22', '2024-10-23', 80, 'triste'),
(4, '2024-10-20', '2024-10-21', 110, 'calmo'),
(4, '2024-10-22', '2024-10-23', 140, 'ansioso'),
(5, '2024-10-20', '2024-10-21', 130, 'feliz'),
(5, '2024-10-22', '2024-10-23', 95, 'estressado'),
(6, '2024-10-20', '2024-10-21', 160, 'ansioso'),
(6, '2024-10-22', '2024-10-23', 110, 'calmo'),
(7, '2024-10-20', '2024-10-21', 120, 'feliz'),
(7, '2024-10-22', '2024-10-23', 140, 'triste'),
(8, '2024-10-20', '2024-10-21', 170, 'feliz'),
(8, '2024-10-22', '2024-10-23', 80, 'ansioso'),
(9, '2024-10-20', '2024-10-21', 90, 'calmo'),
(9, '2024-10-22', '2024-10-23', 130, 'estressado'),
(10, '2024-10-20', '2024-10-21', 150, 'feliz'),
(10, '2024-10-22', '2024-10-23', 100, 'triste'),
(11, '2024-10-20', '2024-10-21', 140, 'ansioso'),
(11, '2024-10-22', '2024-10-23', 110, 'calmo'),
(12, '2024-10-20', '2024-10-21', 120, 'feliz'),
(12, '2024-10-22', '2024-10-23', 150, 'triste'),
(13, '2024-10-20', '2024-10-21', 130, 'feliz'),
(13, '2024-10-22', '2024-10-23', 80, 'ansioso'),
(14, '2024-10-20', '2024-10-21', 160, 'calmo'),
(14, '2024-10-22', '2024-10-23', 90, 'estressado'),
(15, '2024-10-20', '2024-10-21', 170, 'feliz'),
(15, '2024-10-22', '2024-10-23', 110, 'triste'),
(16, '2024-10-20', '2024-10-21', 120, 'ansioso'),
(16, '2024-10-22', '2024-10-23', 140, 'calmo'),
(17, '2024-10-20', '2024-10-21', 150, 'feliz'),
(17, '2024-10-22', '2024-10-23', 95, 'triste'),
(18, '2024-10-20', '2024-10-21', 180, 'ansioso'),
(18, '2024-10-22', '2024-10-23', 130, 'calmo'),
(19, '2024-10-20', '2024-10-21', 140, 'feliz'),
(19, '2024-10-22', '2024-10-23', 100, 'estressado'),
(20, '2024-10-20', '2024-10-21', 150, 'feliz'),
(20, '2024-10-22', '2024-10-23', 110, 'triste'),
(21, '2024-10-20', '2024-10-21', 120, 'ansioso'),
(21, '2024-10-22', '2024-10-23', 140, 'calmo'),
(22, '2024-10-20', '2024-10-21', 130, 'feliz'),
(22, '2024-10-22', '2024-10-23', 95, 'triste'),
(23, '2024-10-20', '2024-10-21', 110, 'ansioso'),
(23, '2024-10-22', '2024-10-23', 80, 'calmo'),
(24, '2024-10-20', '2024-10-21', 150, 'feliz'),
(24, '2024-10-22', '2024-10-23', 120, 'estressado'),
(25, '2024-10-20', '2024-10-21', 140, 'feliz'),
(25, '2024-10-22', '2024-10-23', 130, 'triste'),
(26, '2024-10-20', '2024-10-21', 160, 'ansioso'),
(26, '2024-10-22', '2024-10-23', 110, 'calmo'),
(27, '2024-10-20', '2024-10-21', 170, 'feliz'),
(27, '2024-10-22', '2024-10-23', 90, 'triste'),
(28, '2024-10-20', '2024-10-21', 130, 'feliz'),
(28, '2024-10-22', '2024-10-23', 140, 'ansioso'),
(29, '2024-10-20', '2024-10-21', 150, 'calmo'),
(29, '2024-10-22', '2024-10-23', 100, 'estressado'),
(30, '2024-10-20', '2024-10-21', 120, 'feliz'),
(30, '2024-10-22', '2024-10-23', 130, 'triste');

-- Inserir 60 Trilhas de Assistência (2 para cada usuário)
INSERT INTO trilhas_assistencia (id_usuario, data_inicial, status, tipo_trilha) VALUES
(1, '2024-10-20', 'em andamento', 'Relaxamento'),
(1, '2024-10-22', 'concluida', 'Concentração'),
(2, '2024-10-20', 'concluida', 'Meditação'),
(2, '2024-10-21', 'em andamento', 'Estudo Eficiente'),
(3, '2024-10-20', 'em andamento', 'Mindfulness'),
(3, '2024-10-22', 'concluida', 'Foco Total'),
(4, '2024-10-20', 'concluida', 'Gerenciamento de Estresse'),
(4, '2024-10-21', 'em andamento', 'Criatividade'),
(5, '2024-10-20', 'em andamento', 'Relaxamento'),
(5, '2024-10-22', 'concluida', 'Concentração'),
(6, '2024-10-20', 'concluida', 'Meditação'),
(6, '2024-10-21', 'em andamento', 'Estudo Eficiente'),
(7, '2024-10-20', 'em andamento', 'Mindfulness'),
(7, '2024-10-22', 'concluida', 'Foco Total'),
(8, '2024-10-20', 'concluida', 'Gerenciamento de Estresse'),
(8, '2024-10-21', 'em andamento', 'Criatividade'),
(9, '2024-10-20', 'em andamento', 'Relaxamento'),
(9, '2024-10-22', 'concluida', 'Concentração'),
(10, '2024-10-20', 'concluida', 'Meditação'),
(10, '2024-10-21', 'em andamento', 'Estudo Eficiente'),
(11, '2024-10-20', 'em andamento', 'Mindfulness'),
(11, '2024-10-22', 'concluida', 'Foco Total'),
(12, '2024-10-20', 'concluida', 'Gerenciamento de Estresse'),
(12, '2024-10-21', 'em andamento', 'Criatividade'),
(13, '2024-10-20', 'em andamento', 'Relaxamento'),
(13, '2024-10-22', 'concluida', 'Concentração'),
(14, '2024-10-20', 'concluida', 'Meditação'),
(14, '2024-10-21', 'em andamento', 'Estudo Eficiente'),
(15, '2024-10-20', 'em andamento', 'Mindfulness'),
(15, '2024-10-22', 'concluida', 'Foco Total'),
(16, '2024-10-20', 'concluida', 'Gerenciamento de Estresse'),
(16, '2024-10-21', 'em andamento', 'Criatividade'),
(17, '2024-10-20', 'em andamento', 'Relaxamento'),
(17, '2024-10-22', 'concluida', 'Concentração'),
(18, '2024-10-20', 'concluida', 'Meditação'),
(18, '2024-10-21', 'em andamento', 'Estudo Eficiente'),
(19, '2024-10-20', 'em andamento', 'Mindfulness'),
(19, '2024-10-22', 'concluida', 'Foco Total'),
(20, '2024-10-20', 'concluida', 'Gerenciamento de Estresse'),
(20, '2024-10-21', 'em andamento', 'Criatividade'),
(21, '2024-10-20', 'em andamento', 'Relaxamento'),
(21, '2024-10-22', 'concluida', 'Concentração'),
(22, '2024-10-20', 'concluida', 'Meditação'),
(22, '2024-10-21', 'em andamento', 'Estudo Eficiente'),
(23, '2024-10-20', 'em andamento', 'Mindfulness'),
(23, '2024-10-22', 'concluida', 'Foco Total'),
(24, '2024-10-20', 'concluida', 'Gerenciamento de Estresse'),
(24, '2024-10-21', 'em andamento', 'Criatividade'),
(25, '2024-10-20', 'em andamento', 'Relaxamento'),
(25, '2024-10-22', 'concluida', 'Concentração'),
(26, '2024-10-20', 'concluida', 'Meditação'),
(26, '2024-10-21', 'em andamento', 'Estudo Eficiente'),
(27, '2024-10-20', 'em andamento', 'Mindfulness'),
(27, '2024-10-22', 'concluida', 'Foco Total'),
(28, '2024-10-20', 'concluida', 'Gerenciamento de Estresse'),
(28, '2024-10-21', 'em andamento', 'Criatividade'),
(29, '2024-10-20', 'em andamento', 'Relaxamento'),
(29, '2024-10-22', 'concluida', 'Concentração'),
(30, '2024-10-20', 'concluida', 'Meditação'),
(30, '2024-10-21', 'em andamento', 'Estudo Eficiente');

-- Inserir 60 Sessões de Assistente de Respiração (2 para cada usuário)
INSERT INTO assistente_respiracao (id_usuario, data_sessao, duracao_minutos) VALUES
(1, '2024-10-20 10:00:00', 15),
(1, '2024-10-22 15:00:00', 20),
(2, '2024-10-20 11:00:00', 10),
(2, '2024-10-21 16:30:00', 25),
(3, '2024-10-20 12:00:00', 20),
(3, '2024-10-22 14:00:00', 30),
(4, '2024-10-20 09:30:00', 15),
(4, '2024-10-22 18:00:00', 20),
(5, '2024-10-20 13:00:00', 25),
(5, '2024-10-22 17:30:00', 15),
(6, '2024-10-20 10:15:00', 20),
(6, '2024-10-22 16:00:00', 30),
(7, '2024-10-20 09:45:00', 15),
(7, '2024-10-22 19:00:00', 25),
(8, '2024-10-20 10:30:00', 20),
(8, '2024-10-22 14:45:00', 30),
(9, '2024-10-20 11:15:00', 15),
(9, '2024-10-22 18:30:00', 20),
(10, '2024-10-20 12:45:00', 25),
(10, '2024-10-22 17:15:00', 15),
(11, '2024-10-20 10:00:00', 20),
(11, '2024-10-22 15:30:00', 30),
(12, '2024-10-20 11:30:00', 15),
(12, '2024-10-22 16:15:00', 25),
(13, '2024-10-20 09:00:00', 20),
(13, '2024-10-22 19:15:00', 30),
(14, '2024-10-20 10:15:00', 25),
(14, '2024-10-22 14:30:00', 20),
(15, '2024-10-20 11:00:00', 15),
(15, '2024-10-22 18:00:00', 25),
(16, '2024-10-20 09:45:00', 20),
(16, '2024-10-22 16:30:00', 30),
(17, '2024-10-20 10:30:00', 15),
(17, '2024-10-22 17:00:00', 20),
(18, '2024-10-20 11:15:00', 25),
(18, '2024-10-22 15:45:00', 15),
(19, '2024-10-20 10:00:00', 20),
(19, '2024-10-22 14:00:00', 30),
(20, '2024-10-20 12:00:00', 15),
(20, '2024-10-22 19:30:00', 25),
(21, '2024-10-20 10:45:00', 20),
(21, '2024-10-22 18:15:00', 30),
(22, '2024-10-20 11:30:00', 15),
(22, '2024-10-22 17:00:00', 25),
(23, '2024-10-20 09:00:00', 20),
(23, '2024-10-22 15:30:00', 30),
(24, '2024-10-20 10:15:00', 25),
(24, '2024-10-22 16:45:00', 20),
(25, '2024-10-20 11:00:00', 15),
(25, '2024-10-22 14:30:00', 30),
(26, '2024-10-20 09:45:00', 20),
(26, '2024-10-22 19:00:00', 25),
(27, '2024-10-20 10:30:00', 15),
(27, '2024-10-22 18:15:00', 20),
(28, '2024-10-20 11:15:00', 25),
(28, '2024-10-22 15:00:00', 30),
(29, '2024-10-20 09:30:00', 15),
(29, '2024-10-22 14:00:00', 20),
(30, '2024-10-20 10:00:00', 20),
(30, '2024-10-22 18:30:00', 25);

-- Inserir 60 Modos de Foco (2 para cada usuário)
INSERT INTO modos_foco (id_usuario, data_inicio, duracao_minutos, tipo_som) VALUES
(1, '2024-10-20 08:00:00', 30, 'musica'),
(1, '2024-10-22 09:00:00', 45, 'agua'),
(2, '2024-10-20 09:00:00', 25, 'floresta'),
(2, '2024-10-21 10:30:00', 60, 'branco'),
(3, '2024-10-20 10:00:00', 35, 'musica'),
(3, '2024-10-22 11:15:00', 50, 'agua'),
(4, '2024-10-20 08:30:00', 40, 'floresta'),
(4, '2024-10-22 14:00:00', 30, 'branco'),
(5, '2024-10-20 07:45:00', 55, 'musica'),
(5, '2024-10-22 15:30:00', 45, 'agua'),
(6, '2024-10-20 09:30:00', 20, 'floresta'),
(6, '2024-10-22 16:45:00', 35, 'branco'),
(7, '2024-10-20 10:15:00', 25, 'musica'),
(7, '2024-10-22 08:15:00', 40, 'agua'),
(8, '2024-10-20 11:00:00', 30, 'floresta'),
(8, '2024-10-22 09:45:00', 50, 'branco'),
(9, '2024-10-20 08:00:00', 45, 'musica'),
(9, '2024-10-22 10:30:00', 30, 'agua'),
(10, '2024-10-20 09:15:00', 20, 'floresta'),
(10, '2024-10-22 11:45:00', 25, 'branco'),
(11, '2024-10-20 08:30:00', 30, 'musica'),
(11, '2024-10-22 12:00:00', 50, 'agua'),
(12, '2024-10-20 10:00:00', 35, 'floresta'),
(12, '2024-10-22 13:30:00', 40, 'branco'),
(13, '2024-10-20 09:00:00', 25, 'musica'),
(13, '2024-10-22 14:15:00', 60, 'agua'),
(14, '2024-10-20 07:30:00', 45, 'floresta'),
(14, '2024-10-22 15:00:00', 30, 'branco'),
(15, '2024-10-20 08:15:00', 50, 'musica'),
(15, '2024-10-22 16:45:00', 35, 'agua'),
(16, '2024-10-20 09:45:00', 30, 'floresta'),
(16, '2024-10-22 08:30:00', 25, 'branco'),
(17, '2024-10-20 10:30:00', 40, 'musica'),
(17, '2024-10-22 09:15:00', 50, 'agua'),
(18, '2024-10-20 11:15:00', 25, 'floresta'),
(18, '2024-10-22 10:00:00', 30, 'branco'),
(19, '2024-10-20 08:45:00', 55, 'musica'),
(19, '2024-10-22 11:30:00', 20, 'agua'),
(20, '2024-10-20 09:15:00', 45, 'floresta'),
(20, '2024-10-22 12:15:00', 35, 'branco'),
(21, '2024-10-20 10:00:00', 30, 'musica'),
(21, '2024-10-22 13:00:00', 50, 'agua'),
(22, '2024-10-20 08:30:00', 25, 'floresta'),
(22, '2024-10-22 14:30:00', 40, 'branco'),
(23, '2024-10-20 09:00:00', 20, 'musica'),
(23, '2024-10-22 15:15:00', 60, 'agua'),
(24, '2024-10-20 10:30:00', 35, 'floresta'),
(24, '2024-10-22 16:00:00', 50, 'branco'),
(25, '2024-10-20 11:00:00', 30, 'musica'),
(25, '2024-10-22 08:45:00', 25, 'agua'),
(26, '2024-10-20 09:15:00', 45, 'floresta'),
(26, '2024-10-22 09:30:00', 35, 'branco'),
(27, '2024-10-20 10:00:00', 50, 'musica'),
(27, '2024-10-22 10:15:00', 20, 'agua'),
(28, '2024-10-20 11:30:00', 25, 'floresta'),
(28, '2024-10-22 11:00:00', 60, 'branco'),
(29, '2024-10-20 08:00:00', 30, 'musica'),
(29, '2024-10-22 12:30:00', 40, 'agua'),
(30, '2024-10-20 09:45:00', 35, 'floresta'),
(30, '2024-10-22 13:15:00', 50, 'branco');

-- Inserir 60 Registros de Emergências (2 para cada usuário)
INSERT INTO emergencias (id_usuario, data_emergencia, mensagem_enviada, localizacao) VALUES
(1, '2024-10-20 12:00:00', FALSE, 'Rua A, nº 10'),
(1, '2024-10-22 14:00:00', TRUE, 'Rua B, nº 20'),
(2, '2024-10-20 13:30:00', FALSE, 'Rua C, nº 30'),
(2, '2024-10-21 15:45:00', TRUE, 'Rua D, nº 40'),
(3, '2024-10-20 14:00:00', TRUE, 'Rua E, nº 50'),
(3, '2024-10-22 16:15:00', FALSE, 'Rua F, nº 60'),
(4, '2024-10-20 11:00:00', FALSE, 'Rua G, nº 70'),
(4, '2024-10-22 18:30:00', TRUE, 'Rua H, nº 80'),
(5, '2024-10-20 09:45:00', TRUE, 'Rua I, nº 90'),
(5, '2024-10-22 10:15:00', FALSE, 'Rua J, nº 100'),
(6, '2024-10-20 10:30:00', FALSE, 'Rua K, nº 110'),
(6, '2024-10-22 11:00:00', TRUE, 'Rua L, nº 120'),
(7, '2024-10-20 12:15:00', TRUE, 'Rua M, nº 130'),
(7, '2024-10-22 14:45:00', FALSE, 'Rua N, nº 140'),
(8, '2024-10-20 11:30:00', FALSE, 'Rua O, nº 150'),
(8, '2024-10-22 15:15:00', TRUE, 'Rua P, nº 160'),
(9, '2024-10-20 10:00:00', TRUE, 'Rua Q, nº 170'),
(9, '2024-10-22 16:00:00', FALSE, 'Rua R, nº 180'),
(10, '2024-10-20 09:30:00', FALSE, 'Rua S, nº 190'),
(10, '2024-10-22 12:30:00', TRUE, 'Rua T, nº 200'),
(11, '2024-10-20 14:00:00', TRUE, 'Rua U, nº 210'),
(11, '2024-10-22 10:45:00', FALSE, 'Rua V, nº 220'),
(12, '2024-10-20 13:15:00', FALSE, 'Rua W, nº 230'),
(12, '2024-10-22 15:30:00', TRUE, 'Rua X, nº 240'),
(13, '2024-10-20 11:45:00', TRUE, 'Rua Y, nº 250'),
(13, '2024-10-22 13:00:00', FALSE, 'Rua Z, nº 260'),
(14, '2024-10-20 12:30:00', FALSE, 'Rua AA, nº 270'),
(14, '2024-10-22 14:00:00', TRUE, 'Rua BB, nº 280'),
(15, '2024-10-20 09:00:00', TRUE, 'Rua CC, nº 290'),
(15, '2024-10-22 16:30:00', FALSE, 'Rua DD, nº 300'),
(16, '2024-10-20 10:45:00', FALSE, 'Rua EE, nº 310'),
(16, '2024-10-22 11:15:00', TRUE, 'Rua FF, nº 320'),
(17, '2024-10-20 11:15:00', TRUE, 'Rua GG, nº 330'),
(17, '2024-10-22 12:00:00', FALSE, 'Rua HH, nº 340'),
(18, '2024-10-20 09:30:00', FALSE, 'Rua II, nº 350'),
(18, '2024-10-22 15:45:00', TRUE, 'Rua JJ, nº 360'),
(19, '2024-10-20 14:15:00', TRUE, 'Rua KK, nº 370'),
(19, '2024-10-22 16:30:00', FALSE, 'Rua LL, nº 380'),
(20, '2024-10-20 10:30:00', FALSE, 'Rua MM, nº 390'),
(20, '2024-10-22 13:15:00', TRUE, 'Rua NN, nº 400'),
(21, '2024-10-20 08:45:00', TRUE, 'Rua OO, nº 410'),
(21, '2024-10-22 11:45:00', FALSE, 'Rua PP, nº 420'),
(22, '2024-10-20 12:00:00', FALSE, 'Rua QQ, nº 430'),
(22, '2024-10-22 15:00:00', TRUE, 'Rua RR, nº 440'),
(23, '2024-10-20 09:15:00', TRUE, 'Rua SS, nº 450'),
(23, '2024-10-22 10:00:00', FALSE, 'Rua TT, nº 460'),
(24, '2024-10-20 11:30:00', FALSE, 'Rua UU, nº 470'),
(24, '2024-10-22 13:45:00', TRUE, 'Rua VV, nº 480'),
(25, '2024-10-20 14:00:00', TRUE, 'Rua WW, nº 490'),
(25, '2024-10-22 09:30:00', FALSE, 'Rua XX, nº 500'),
(26, '2024-10-20 10:15:00', FALSE, 'Rua YY, nº 510'),
(26, '2024-10-22 12:15:00', TRUE, 'Rua ZZ, nº 520'),
(27, '2024-10-20 11:00:00', TRUE, 'Rua AAA, nº 530'),
(27, '2024-10-22 14:30:00', FALSE, 'Rua BBB, nº 540'),
(28, '2024-10-20 09:45:00', FALSE, 'Rua CCC, nº 550'),
(28, '2024-10-22 10:30:00', TRUE, 'Rua DDD, nº 560'),
(29, '2024-10-20 12:15:00', TRUE, 'Rua EEE, nº 570'),
(29, '2024-10-22 13:00:00', FALSE, 'Rua FFF, nº 580'),
(30, '2024-10-20 08:30:00', FALSE, 'Rua GGG, nº 590'),
(30, '2024-10-22 09:15:00', TRUE, 'Rua HHH, nº 600');

set autocommit = 0;
select * from emergencias;
INSERT INTO emergencias (id_usuario, data_emergencia, mensagem_enviada, localizacao) VALUES
(1, '2024-11-20 17:00:00', FALSE, 'Rua HH, nº 101');
commit;
INSERT INTO emergencias (id_usuario, data_emergencia, mensagem_enviada, localizacao) VALUES
(1, '2024-11-20 19:00:00', FALSE, 'Rua HH, nº 101');
DELETE FROM emergencias WHERE id_emergencia = '64';
rollback;