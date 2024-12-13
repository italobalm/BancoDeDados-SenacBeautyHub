
-- primeira view 
CREATE VIEW listar_servicos_administradores AS
SELECT 
    usuario.nome AS nome_administrador, 
    servicos.nome AS nome_servico, 
    usuario.tipoPerfil 
FROM servicos 
INNER JOIN usuario ON usuario.idUsuario = servicos.administrador_usuario_idUsuario
WHERE usuario.tipoPerfil = 'administrador';

select * from listar_servicos_administradores;

-- segunda view 
CREATE VIEW especialistas_servicos AS
SELECT 
    usuario.nome AS nome_especialista,
    servicos.nome AS nome_servico,
    usuario.tipoPerfil
FROM servicos 
INNER JOIN usuario ON usuario.idUsuario = servicos.administrador_usuario_idUsuario
WHERE usuario.tipoPerfil = 'especialista';

select * from especialistas_servicos;

-- terceira view 

CREATE VIEW agendamentos_por_especialista AS
SELECT 
    agendamento.data AS data_agendamento,
    agendamento.hora AS hora_agendamento, 
    usuario.nome AS responsavel, 
    usuario.tipoPerfil
FROM agendamento
INNER JOIN usuario ON usuario.idUsuario = agendamento.administrador_usuario_idUsuario
WHERE usuario.tipoPerfil = 'especialista';


select * from agendamentos_por_especialista;


-- quarta view 
CREATE VIEW faturamento_por_cliente AS
SELECT 
    usuario.nome AS cliente_nome,
    SUM(servicos.preco) AS faturamento_total
FROM cliente
INNER JOIN usuario ON cliente.usuario_idUsuario = usuario.idUsuario
INNER JOIN agendamento ON cliente.idcliente = agendamento.administrador_idadministrador
INNER JOIN servicos_has_agendamento ON agendamento.idagendamento = servicos_has_agendamento.agendamento_idagendamento
INNER JOIN servicos ON servicos.idservicos = servicos_has_agendamento.servicos_idservicos
GROUP BY usuario.nome
ORDER BY faturamento_total DESC;


SELECT * FROM faturamento_por_cliente;


-- QUINTA VIEW 

CREATE VIEW servicos_realizados_por_dia AS
SELECT 
    DATE(agendamento.data) AS dia,
    COUNT(servicos.idservicos) AS servicos_dia
FROM agendamento
INNER JOIN servicos_has_agendamento ON agendamento.idagendamento = servicos_has_agendamento.agendamento_idagendamento
INNER JOIN servicos ON servicos.idservicos = servicos_has_agendamento.servicos_idservicos
WHERE agendamento.data BETWEEN '2024-01-01' AND '2024-01-20'
GROUP BY DATE(agendamento.data)
ORDER BY dia;

SELECT * FROM servicos_realizados_por_dia;

-- SEXTA VIEW 
CREATE VIEW feedback_por_cliente AS
SELECT
    usuario.nome AS cliente,
    feedback.mensagemFeedback AS Feedback,
    usuario.tipoPerfil AS Perfil
FROM feedback
INNER JOIN cliente ON cliente.idcliente = feedback.cliente_idcliente
INNER JOIN usuario ON usuario.idUsuario = cliente.usuario_idUsuario
INNER JOIN agendamento ON agendamento.idagendamento = feedback.agendamento_idagendamento
LEFT JOIN servicos_has_agendamento ON servicos_has_agendamento.agendamento_idagendamento = agendamento.idagendamento
LEFT JOIN servicos ON servicos.idservicos = servicos_has_agendamento.servicos_idservicos
WHERE usuario.tipoPerfil = 'client'
GROUP BY usuario.nome, feedback.mensagemfeedback;

SELECT * FROM feedback_por_cliente;

-- SETIMA VIEW

CREATE VIEW especialistas_ultimas_mudancas AS
SELECT 
    e.idespecialista, 
    u.nome AS nomeEspecialista,
    al.novoServico AS ultimaMudanca, 
    al.dataAlteracao AS dataMudanca
FROM alteracao AS al
JOIN especialista AS e ON al.especialista_idespecialista = e.idespecialista
JOIN usuario AS u ON e.usuario_idusuario = u.idusuario
WHERE al.dataAlteracao = (SELECT MAX(dataAlteracao) FROM alteracao WHERE especialista_idespecialista = e.idespecialista);


SELECT * FROM especialistas_ultimas_mudancas;


-- OITAVA VIEW 

CREATE VIEW total_feedbacks AS
SELECT COUNT(*) AS total_feedbacks
FROM feedback f
JOIN cliente c ON f.cliente_idcliente = c.idcliente
WHERE f.mensagemFeedback IS NOT NULL;

SELECT * FROM TOTAL_FEEDBACKS;


-- NONA VIEW

CREATE VIEW especialistas_mais_agendamentos AS
SELECT 
    e.idespecialista, 
    u.nome AS nome_especialista,
    COUNT(sa.agendamento_idagendamento) AS total_agendamentos
FROM especialista e
JOIN usuario u ON e.usuario_idUsuario = u.idUsuario
JOIN servicos_has_agendamento sa ON e.idespecialista = sa.servicos_administrador_idadministrador
GROUP BY e.idespecialista, u.nome
ORDER BY total_agendamentos DESC
LIMIT 5;

SELECT * FROM especialistas_mais_agendamentos;

-- DECIMA VIEW

CREATE VIEW servicos_realizados_faturamento_especialista AS
SELECT 
    e.idespecialista, 
    u.nome AS nome_especialista, 
    COUNT(sa.agendamento_idagendamento) AS total_servicos, 
    SUM(s.preco) AS faturamento_total
FROM especialista e
RIGHT JOIN usuario u ON e.usuario_idUsuario = u.idUsuario
RIGHT JOIN servicos_has_agendamento sa ON e.idespecialista = sa.servicos_administrador_idadministrador
RIGHT JOIN servicos s ON sa.servicos_idservicos = s.idservicos
GROUP BY e.idespecialista, u.nome;


SELECT * FROM servicos_realizados_faturamento_especialista;













