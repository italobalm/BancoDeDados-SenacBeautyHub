-- INSERTS

-- INSERINDO DADOS INICIAIS NO BANCO DE DADOS DO SALÃO DE BELEZA

-- Inserindo dados na tabela usuario
INSERT INTO `mydb`.`usuario` (`cpf`, `email`, `senha`, `nome`, `dataNasc`, `fotoPerfil`, `tipoPerfil`) VALUES
('12345678901', 'ana.silva@example.com', 'senhaSegura1', 'Ana Silva', '1990-05-10', 'perfil1.jpg', 'client'),
('23456789012', 'joao.souza@example.com', 'senhaSegura2', 'João Souza', '1985-09-12', NULL, 'especialista'),
('34567890123', 'maria.lima@example.com', 'senhaSegura3', 'Maria Lima', '1993-03-25', 'perfil2.jpg', 'administrador'),
('45678901234', 'pedro.alves@example.com', 'senhaSegura4', 'Pedro Alves', '1998-07-08', NULL, 'client'),
('56789012345', 'fernanda.oliveira@example.com', 'senhaSegura5', 'Fernanda Oliveira', '1992-01-20', 'perfil3.jpg', 'client'),
('67890123456', 'carlos.mendes@example.com', 'senhaSegura6', 'Carlos Mendes', '1987-12-11', NULL, 'especialista'),
('78901234567', 'beatriz.dias@example.com', 'senhaSegura7', 'Beatriz Dias', '1995-06-15', NULL, 'client'),
('89012345678', 'lucas.martins@example.com', 'senhaSegura8', 'Lucas Martins', '1990-08-10', 'perfil4.jpg', 'administrador'),
('90123456789', 'rafaela.santos@example.com', 'senhaSegura9', 'Rafaela Santos', '1988-04-18', NULL, 'especialista'),
('12345098765', 'thiago.costa@example.com', 'senhaSegura10', 'Thiago Costa', '1994-11-30', NULL, 'client'),
('23456098765', 'juliana.pereira@example.com', 'senhaSegura11', 'Juliana Pereira', '1993-10-15', 'perfil5.jpg', 'client'),
('34567098765', 'rodrigo.gomes@example.com', 'senhaSegura12', 'Rodrigo Gomes', '1991-02-07', NULL, 'especialista'),
('45678098765', 'priscila.nunes@example.com', 'senhaSegura13', 'Priscila Nunes', '1989-09-22', NULL, 'client'),
('56789098765', 'eduardo.campos@example.com', 'senhaSegura14', 'Eduardo Campos', '1995-05-25', 'perfil6.jpg', 'administrador'),
('67890098765', 'aline.miranda@example.com', 'senhaSegura15', 'Aline Miranda', '1992-08-19', NULL, 'client'),
('78901098765', 'danilo.freitas@example.com', 'senhaSegura16', 'Danilo Freitas', '1986-01-10', NULL, 'especialista'),
('89012098765', 'carla.rocha@example.com', 'senhaSegura17', 'Carla Rocha', '1990-06-17', NULL, 'client'),
('90123098765', 'felipe.cardoso@example.com', 'senhaSegura18', 'Felipe Cardoso', '1998-03-09', NULL, 'client'),
('12346098765', 'vanessa.lopes@example.com', 'senhaSegura19', 'Vanessa Lopes', '1987-12-22', NULL, 'especialista'),
('23457098765', 'anderson.ribeiro@example.com', 'senhaSegura20', 'Anderson Ribeiro', '1996-04-04', NULL, 'administrador');

-- Inserindo dados na tabela telefone
INSERT INTO `mydb`.`telefone` (`numero`, `usuario_idUsuario`) VALUES
('999111222', 1),
('999333444', 2),
('988555666', 3),
('977777888', 4),
('966666999', 5),
('955444333', 6),
('944333222', 7),
('933222111', 8),
('922111000', 9),
('911000999', 10),
('900888777', 11),
('899777666', 12),
('888666555', 13),
('877555444', 14),
('866444333', 15),
('855333222', 16),
('844222111', 17),
('833111000', 18),
('822000999', 19),
('811999888', 20);

-- Inserindo dados na tabela cliente
INSERT INTO `mydb`.`cliente` (`idcliente`, `usuario_idUsuario`) VALUES
(1, 1), (2, 4), (3, 5), (4, 7), (5, 10), (6, 11), (7, 13), (8, 16), 
(9, 17), (10, 18), (11, 6), (12, 14), (13, 8), (14, 12), (15, 15), 
(16, 19), (17, 9), (18, 20), (19, 2), (20, 3);

-- Inserindo dados na tabela administrador
INSERT INTO `mydb`.`administrador` (`usuario_idUsuario`) VALUES
(3), (8), (14), (20), (6), (11), (15), (18), (19), (2), (4), (7), (9), (10), (13), (12), (16), (17), (5), (1);

-- Inserindo dados na tabela especialista
INSERT INTO `mydb`.`especialista` (`idespecialista`, `usuario_idUsuario`) VALUES
(1, 2), (2, 6), (3, 9), (4, 12), (5, 16), (6, 19), (7, 14), 
(8, 7), (9, 13), (10, 11), (11, 4), (12, 10), (13, 3), 
(14, 8), (15, 17), (16, 5), (17, 18), (18, 15), (19, 6), (20, 1);

-- Inserindo dados na tabela agendamento
INSERT INTO `mydb`.`agendamento` (`data`, `hora`, `administrador_idadministrador`, `administrador_usuario_idUsuario`) VALUES
('2024-01-01', '10:00:00', 1, 3),
('2024-01-02', '11:00:00', 2, 8),
('2024-01-03', '14:00:00', 3, 14),
('2024-01-04', '09:00:00', 4, 20),
('2024-01-05', '15:30:00', 5, 6),
('2024-01-06', '13:00:00', 6, 11),
('2024-01-07', '08:30:00', 7, 15),
('2024-01-08', '16:00:00', 8, 18),
('2024-01-09', '17:00:00', 9, 19),
('2024-01-10', '12:00:00', 10, 2),
('2024-01-11', '10:30:00', 11, 4),
('2024-01-12', '11:45:00', 12, 7),
('2024-01-13', '09:15:00', 13, 9),
('2024-01-14', '14:45:00', 14, 10),
('2024-01-15', '08:45:00', 15, 13),
('2024-01-16', '16:15:00', 16, 12),
('2024-01-17', '18:00:00', 17, 16),
('2024-01-18', '07:30:00', 18, 17),
('2024-01-19', '15:00:00', 19, 5),
('2024-01-20', '13:30:00', 20, 1);

-- Inserindo dados na tabela feedback
INSERT INTO `mydb`.`feedback` 
(`mensagemFeedback`, `cliente_idcliente`, `cliente_usuario_idUsuario`, `agendamento_idagendamento`, `administrador_idadministrador`, `administrador_usuario_idUsuario`) 
VALUES 
('Ótimo serviço!', 1, 1, 1, 1, 3), 
('Muito satisfeito.', 2, 4, 2, 2, 8),
('Recomendo a todos.', 3, 5, 3, 3, 14), 
('Atendimento excelente.', 4, 7, 4, 4, 20), 
('Qualidade top.', 5, 10, 5, 5, 6), 
('Voltarei com certeza.', 6, 11, 6, 6, 11), 
('Muito bem atendido.', 7, 13, 7, 7, 15), 
('Nota 10.', 8, 16, 8, 8, 18), 
('Serviço rápido e eficiente.', 9, 17, 9, 9, 19), 
('Adorei o resultado.', 10, 18, 10, 10, 2);


INSERT INTO `mydb`.`servicos` (`nome`, `preco`, `administrador_idadministrador`, `administrador_usuario_idUsuario`) VALUES
('Corte de cabelo', 50.00, 1, 3),
('Manicure', 30.00, 2, 8),
('Hidratação capilar', 80.00, 3, 14),
('Pintura de unhas', 25.00, 4, 20),
('Barbearia', 40.00, 5, 6),
('Massagem', 100.00, 6, 11),
('Design de sobrancelhas', 35.00, 7, 15),
('Consultoria de estilo', 200.00, 8, 18),
('Depilação', 70.00, 9, 19),
('Tratamento facial', 150.00, 10, 2),
('Corte infantil', 45.00, 11, 4),
('Maquiagem', 90.00, 12, 7),
('Spa capilar', 120.00, 13, 9),
('Unhas de gel', 95.00, 14, 10),
('Peeling facial', 160.00, 15, 13),
('Design de unhas', 50.00, 16, 12),
('Tratamento para cabelos danificados', 85.00, 17, 16),
('Barba e cabelo', 60.00, 18, 17),
('Massagem relaxante', 110.00, 19, 5),
('Tratamento de acne', 130.00, 20, 1);
-- Inserindo dados na tabela alteracao




INSERT INTO servicos_has_agendamento (
    servicos_idservicos,
    servicos_administrador_idadministrador,
    servicos_administrador_usuario_idUsuario,
    agendamento_idagendamento,
    agendamento_administrador_idadministrador,
    agendamento_administrador_usuario_idUsuario
)
SELECT
    s.idservicos,
    s.administrador_idadministrador,
    s.administrador_usuario_idUsuario,
    a.idagendamento,
    a.administrador_idadministrador,
    a.administrador_usuario_idUsuario
FROM
    agendamento a
INNER JOIN
    servicos s
    ON a.administrador_idadministrador = s.administrador_idadministrador
    AND a.administrador_usuario_idUsuario = s.administrador_usuario_idUsuario;




-- Novos agendamentos
INSERT INTO `mydb`.`agendamento` (`data`, `hora`, `administrador_idadministrador`, `administrador_usuario_idUsuario`) VALUES
('2024-01-01', '09:00:00', 2, 8),
('2024-01-01', '11:00:00', 3, 14),
('2024-01-02', '10:30:00', 4, 20),
('2024-01-02', '15:00:00', 5, 6),
('2024-01-03', '09:00:00', 6, 11),
('2024-01-04', '12:00:00', 7, 15),
('2024-01-05', '16:00:00', 8, 18),
('2024-01-06', '10:00:00', 9, 19),
('2024-01-07', '14:30:00', 10, 2),
('2024-01-08', '09:30:00', 11, 4),
('2024-01-09', '13:45:00', 12, 7),
('2024-01-10', '11:15:00', 13, 9),
('2024-01-11', '16:30:00', 14, 10),
('2024-01-12', '10:45:00', 15, 13),
('2024-01-13', '09:30:00', 16, 12),
('2024-01-14', '14:15:00', 17, 16),
('2024-01-15', '12:45:00', 18, 17),
('2024-01-16', '10:30:00', 19, 5),
('2024-01-17', '15:00:00', 20, 1);

-- Relacionando serviços a novos agendamentos
INSERT INTO `mydb`.`servicos_has_agendamento` (
    servicos_idservicos,
    servicos_administrador_idadministrador,
    servicos_administrador_usuario_idUsuario,
    agendamento_idagendamento,
    agendamento_administrador_idadministrador,
    agendamento_administrador_usuario_idUsuario
) VALUES
(1, 1, 3, 21, 2, 8), -- Corte de cabelo no agendamento 21
(2, 2, 8, 21, 2, 8), -- Manicure no agendamento 21
(3, 3, 14, 22, 3, 14), -- Hidratação capilar no agendamento 22
(4, 4, 20, 23, 4, 20), -- Pintura de unhas no agendamento 23
(5, 5, 6, 24, 5, 6), -- Barbearia no agendamento 24
(6, 6, 11, 25, 6, 11), -- Massagem no agendamento 25
(7, 7, 15, 26, 7, 15), -- Design de sobrancelhas no agendamento 26
(8, 8, 18, 27, 8, 18), -- Consultoria de estilo no agendamento 27
(9, 9, 19, 28, 9, 19), -- Depilação no agendamento 28
(10, 10, 2, 29, 10, 2), -- Tratamento facial no agendamento 29
(11, 11, 4, 30, 11, 4), -- Corte infantil no agendamento 30
(12, 12, 7, 31, 12, 7), -- Maquiagem no agendamento 31
(13, 13, 9, 32, 13, 9), -- Spa capilar no agendamento 32
(14, 14, 10, 33, 14, 10), -- Unhas de gel no agendamento 33
(15, 15, 13, 34, 15, 13); -- Peeling facial no agendamento 34


-- Feedbacks para novos agendamentos
INSERT INTO `mydb`.`feedback` (
    `mensagemFeedback`, 
    `cliente_idcliente`, 
    `cliente_usuario_idUsuario`, 
    `agendamento_idagendamento`, 
    `administrador_idadministrador`, 
    `administrador_usuario_idUsuario`
) VALUES
('Ótimo atendimento e corte!', 1, 1, 21, 2, 8),
('Adorei o serviço de manicure.', 2, 4, 21, 2, 8),
('Excelente hidratação capilar.', 3, 5, 22, 3, 14),
('Pintura de unhas perfeita.', 4, 7, 23, 4, 20),
('Barbearia super eficiente.', 5, 10, 24, 5, 6),
('Massagem muito relaxante.', 6, 11, 25, 6, 11),
('Design de sobrancelhas impecável.', 7, 13, 26, 7, 15),
('Consultoria de estilo foi incrível.', 8, 16, 27, 8, 18),
('Depilação foi rápida e eficaz.', 9, 17, 28, 9, 19),
('Tratamento facial deu ótimos resultados.', 10, 18, 29, 10, 2);




-- Novos agendamentos com datas variadas
INSERT INTO `mydb`.`agendamento` (`data`, `hora`, `administrador_idadministrador`, `administrador_usuario_idUsuario`) VALUES
('2024-02-01', '10:30:00', 1, 3),
('2024-02-02', '14:00:00', 2, 8),
('2024-02-03', '09:00:00', 3, 14),
('2024-02-05', '16:30:00', 4, 20),
('2024-02-07', '11:00:00', 5, 6),
('2024-02-08', '08:30:00', 6, 11),
('2024-02-10', '13:15:00', 7, 15),
('2024-02-11', '17:00:00', 8, 18),
('2024-02-12', '12:30:00', 9, 19),
('2024-02-14', '14:45:00', 10, 2),
('2024-02-16', '09:30:00', 11, 4),
('2024-02-17', '10:15:00', 12, 7),
('2024-02-19', '13:30:00', 13, 9),
('2024-02-20', '11:45:00', 14, 10),
('2024-02-22', '15:30:00', 15, 13),
('2024-02-24', '10:00:00', 16, 12),
('2024-02-25', '16:15:00', 17, 16),
('2024-02-27', '18:00:00', 18, 17),
('2024-02-28', '12:00:00', 19, 5),
('2024-03-01', '14:30:00', 20, 1);





-- Relacionando serviços aos agendamentos
INSERT INTO `mydb`.`servicos_has_agendamento` (
    servicos_idservicos,
    servicos_administrador_idadministrador,
    servicos_administrador_usuario_idUsuario,
    agendamento_idagendamento,
    agendamento_administrador_idadministrador,
    agendamento_administrador_usuario_idUsuario
) VALUES
(1, 1, 3, 21, 1, 3), -- Corte de cabelo no agendamento 21
(3, 2, 8, 22, 2, 8), -- Hidratação capilar no agendamento 22
(2, 3, 14, 23, 3, 14), -- Manicure no agendamento 23
(4, 4, 20, 24, 4, 20), -- Pintura de unhas no agendamento 24
(6, 5, 6, 25, 5, 6), -- Massagem no agendamento 25
(7, 6, 11, 26, 6, 11), -- Design de sobrancelhas no agendamento 26
(8, 7, 15, 27, 7, 15), -- Consultoria de estilo no agendamento 27
(9, 8, 18, 28, 8, 18), -- Depilação no agendamento 28
(10, 9, 19, 29, 9, 19), -- Tratamento facial no agendamento 29
(11, 10, 2, 30, 10, 2), -- Corte infantil no agendamento 30
(13, 11, 4, 31, 11, 4), -- Spa capilar no agendamento 31
(14, 12, 7, 32, 12, 7), -- Unhas de gel no agendamento 32
(5, 13, 9, 33, 13, 9), -- Barbearia no agendamento 33
(16, 14, 10, 34, 14, 10), -- Design de unhas no agendamento 34
(12, 15, 13, 35, 15, 13), -- Maquiagem no agendamento 35
(15, 16, 12, 36, 16, 12), -- Peeling facial no agendamento 36
(17, 17, 5, 37, 17, 5), -- Tratamento para cabelos danificados no agendamento 37
(18, 18, 17, 38, 18, 17), -- Barba e cabelo no agendamento 38
(19, 19, 1, 39, 19, 1), -- Massagem relaxante no agendamento 39
(20, 20, 2, 40, 20, 2); -- Tratamento de acne no agendamento 40







-- Novos feedbacks diversificados
INSERT INTO `mydb`.`feedback` 
(`mensagemFeedback`, `cliente_idcliente`, `cliente_usuario_idUsuario`, `agendamento_idagendamento`, `administrador_idadministrador`, `administrador_usuario_idUsuario`) 
VALUES 
('Adorei o atendimento, muito cordial e atencioso.', 1, 1, 21, 1, 3),
('Serviço excelente, a manicure ficou maravilhosa!', 2, 4, 22, 2, 8),
('O corte de cabelo ficou perfeito, voltarei mais vezes.', 3, 5, 23, 3, 14),
('Ambiente muito agradável e profissional. Recomendo!', 4, 7, 24, 4, 20),
('A massagem foi relaxante e de ótima qualidade. Gostei muito!', 5, 10, 25, 5, 6),
('Profissionalismo impecável, o design de sobrancelhas ficou incrível.', 6, 11, 26, 6, 11),
('Consultoria de estilo muito útil, adorei as dicas.', 7, 13, 27, 7, 15),
('Serviço de depilação foi rápido e sem dor, super recomendo.', 8, 16, 28, 8, 18),
('A limpeza e o cuidado com o rosto foi excelente, estou muito satisfeita.', 9, 17, 29, 9, 19),
('Corte infantil super bem feito, meu filho adorou!', 10, 18, 30, 10, 2),
('Fui atendida rapidamente e adorei o resultado da maquiagem.', 11, 6, 31, 11, 4),
('Spa capilar fez maravilhas para o meu cabelo, super indico.', 12, 7, 32, 12, 7),
('Unhas de gel perfeitas, adorei o acabamento!', 13, 8, 33, 13, 9),
('Fiz o tratamento capilar e meu cabelo ficou bem mais saudável!', 14, 9, 34, 14, 10),
('A limpeza facial foi maravilhosa, minha pele está outra.', 15, 10, 35, 15, 13),
('A massagem relaxante me ajudou muito, saí leve e revigorada.', 16, 11, 36, 16, 12),
('Adorei o corte e a barba, ficou ótimo!', 17, 12, 37, 17, 5),
('Tratamento de acne realmente trouxe resultados positivos.', 18, 13, 38, 18, 17),
('Muito bom, estou mais tranquilo depois da massagem relaxante.', 19, 14, 39, 19, 1),
('A limpeza foi feita com muito cuidado, adorei o tratamento!', 20, 15, 40, 20, 2);


INSERT INTO `mydb`.`alteracao` (novoServico, dataAlteracao, especialista_idespecialista, especialista_usuario_idUsuario)
VALUES 
('Corte de cabelo masculino', '2024-12-10 09:30:00', 1, 101),
('Manicure e pedicure', '2024-12-11 10:00:00', 2, 102),
('Depilação facial', '2024-12-12 11:15:00', 3, 103),
('Penteado para festa', '2024-12-13 14:45:00', 4, 104),
('Barba e cabelo', '2024-12-14 15:30:00', 1, 105),
('Escova progressiva', '2024-12-15 16:00:00', 2, 106),
('Hidratação capilar', '2024-12-16 08:30:00', 5, 107),
('Corte feminino', '2024-12-17 10:15:00', 6, 108),
('Alisamento', '2024-12-18 11:00:00', 7, 109),
('Corte e escova', '2024-12-19 13:45:00', 8, 110),
('Alongamento de unhas', '2024-12-20 14:30:00', 9, 111),
('Tintura de cabelo', '2024-12-21 10:00:00', 10, 112),
('Escova e hidratação', '2024-12-22 11:30:00', 1, 113),
('Manicure', '2024-12-23 12:00:00', 2, 114),
('Barbearia completa', '2024-12-24 13:00:00', 3, 115),
('Corte e sobrancelha', '2024-12-25 14:30:00', 4, 116),
('Escova e corte', '2024-12-26 15:00:00', 5, 117),
('Depilação corporal', '2024-12-27 16:15:00', 6, 118),
('Escova e manicure', '2024-12-28 10:30:00', 7, 119),
('Hidratação e tintura', '2024-12-29 11:45:00', 8, 120);

INSERT INTO `mydb`.`Disponibilidade` (data, hora, especialista_idespecialista, especialista_usuario_idUsuario, agendamento_idagendamento, agendamento_administrador_idadministrador, agendamento_administrador_usuario_idUsuario)
VALUES
('2024-01-01', '08:00:00', 1, 101, 1, 1, 101),
('2024-01-01', '10:00:00', 2, 102, 2, 2, 102),
('2024-01-02', '09:00:00', 3, 103, 3, 3, 103),
('2024-01-02', '14:00:00', 4, 104, 4, 4, 104),
('2024-01-03', '08:30:00', 5, 105, 5, 5, 105),
('2024-01-03', '11:30:00', 6, 106, 6, 6, 106),
('2024-01-04', '09:30:00', 7, 107, 7, 7, 107),
('2024-01-04', '14:45:00', 8, 108, 8, 8, 108),
('2024-01-05', '15:15:00', 9, 109, 9, 9, 109),
('2024-01-06', '13:15:00', 10, 110, 10, 10, 110),
('2024-01-07', '08:30:00', 11, 111, 11, 11, 111),
('2024-01-07', '13:15:00', 12, 112, 12, 12, 112),
('2024-01-08', '11:45:00', 13, 113, 13, 13, 113),
('2024-01-09', '10:15:00', 14, 114, 14, 14, 114),
('2024-01-10', '15:30:00', 15, 115, 15, 15, 115),
('2024-01-11', '12:00:00', 16, 116, 16, 16, 116),
('2024-01-12', '13:30:00', 17, 117, 17, 17, 117),
('2024-01-13', '10:00:00', 18, 118, 18, 18, 118),
('2024-01-14', '11:30:00', 19, 119, 19, 19, 119),
('2024-01-15', '14:00:00', 20, 120, 20, 20, 120);

SHOW WARNINGS;






