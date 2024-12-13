-- CONSULTAS USANDO JOINS 


--  Listar todos os serviços e seus administradores
SELECT usuario.nome AS nome_administrador, 
       servicos.nome AS nome_servico, 
       usuario.tipoPerfil 
FROM servicos 
INNER JOIN usuario ON usuario.idUsuario = servicos.administrador_usuario_idUsuario
WHERE usuario.tipoPerfil = 'administrador';

--   Buscar especialistas e os serviços que eles oferecem
select usuario.nome as nome_especiaista,
servicos.nome as nome_servico,
usuario.tipoPerfil
from servicos 
inner join usuario on usuario.idUsuario = servicos.administrador_usuario_idUsuario
where usuario.tipoPerfil = "especialista";

-- Obter agendamentos por especialista

select agendamento.data as data_agendamento,
 agendamento.hora as hora_agendamento, usuario.nome as responsavel, usuario.tipoPerfil
from agendamento
 inner join usuario on  usuario.idUsuario = agendamento.administrador_usuario_idUsuario
where usuario.tipoPerfil = "especialista";


-- Exibir os serviços oferecidos e o feedback de cada um

SELECT 
    servicos.nome AS nome_servicos, 
    IFNULL(feedback.mensagemFeedback, 'Sem Feedback') AS feedback
FROM 
    servicos
LEFT JOIN 
    servicos_has_agendamento 
    ON servicos.idservicos = servicos_has_agendamento.servicos_idservicos
LEFT JOIN 
    agendamento
    ON servicos_has_agendamento.agendamento_idagendamento = agendamento.idagendamento
LEFT JOIN 
    feedback
    ON agendamento.idagendamento = feedback.agendamento_idagendamento
ORDER BY 
    servicos.nome;



-- feedback por cliente

SELECT
    usuario.nome AS cliente,
   
    feedback.mensagemFeedback AS Feedback,
    usuario.tipoPerfil AS Perfil
FROM
    feedback
INNER JOIN
    cliente ON cliente.idcliente = feedback.cliente_idcliente
INNER JOIN
    usuario ON usuario.idUsuario = cliente.usuario_idUsuario
INNER JOIN
    agendamento ON agendamento.idagendamento = feedback.agendamento_idagendamento
LEFT JOIN
    servicos_has_agendamento ON servicos_has_agendamento.agendamento_idagendamento = agendamento.idagendamento
LEFT JOIN
    servicos ON servicos.idservicos = servicos_has_agendamento.servicos_idservicos
WHERE
    usuario.tipoPerfil = "client"
GROUP BY
    usuario.nome, feedback.mensagemfeedback;
    
-- preco total servico 

select servicos.nome as nome_servico,
SUM(servicos.preco) as total_servico
from servicos inner join servicos_has_agendamento on servicos.idservicos = servicos_has_agendamento.servicos_idservicos
group by servicos.nome
order by total_servico ASC;

-- Serviços realizados por dia 

select date(agendamento.data) as  dia,
count(servicos.idservicos) as servicos_dia
from agendamento inner join servicos_has_agendamento on agendamento.idagendamento = servicos_has_agendamento.agendamento_idagendamento
inner join servicos on servicos.idservicos = servicos_has_agendamento.servicos_idservicos
where agendamento.data between "2024-01-01" and "2024-01-20"
group by date(agendamento.data)
order by dia;


-- faturamneto por cliente 

SELECT 
    usuario.nome AS cliente_nome,
    SUM(servicos.preco) AS faturamento_total
FROM 
    cliente
INNER JOIN 
    usuario ON cliente.usuario_idUsuario = usuario.idUsuario
INNER JOIN 
    agendamento ON cliente.idcliente = agendamento.administrador_idadministrador
INNER JOIN 
    servicos_has_agendamento ON agendamento.idagendamento = servicos_has_agendamento.agendamento_idagendamento
INNER JOIN 
    servicos ON servicos.idservicos = servicos_has_agendamento.servicos_idservicos
GROUP BY 
    usuario.nome
ORDER BY 
    faturamento_total DESC;
    
    
-- servicos realizados no fim de semana 

select servicos.nome as nome_servico,
count(sha.servicos_idservicos) as total_servicos
from agendamento
inner join servicos_has_agendamento sha on agendamento.idagendamento = sha.agendamento_idagendamento
inner join servicos on servicos.idservicos = sha.servicos_idservicos
where dayofweek(agendamento.data) in (1,7)
group by servicos.nome
order by total_servicos;


-- especialistas e administradores e o numero de colaborações em agendamento

SELECT 
    e.usuario_idUsuario AS EspecialistaID,
    u1.nome AS NomeEspecialista,
    a.usuario_idUsuario AS AdministradorID,
    u2.nome AS NomeAdministrador,
    COUNT(ag.idagendamento) AS TotalColaboracoes
FROM 
    Disponibilidade AS d
INNER JOIN 
    especialista AS e ON d.especialista_idespecialista = e.idespecialista
INNER JOIN 
    usuario AS u1 ON e.usuario_idUsuario = u1.idUsuario
INNER JOIN 
    agendamento AS ag ON d.agendamento_idagendamento = ag.idagendamento
INNER JOIN 
    administrador AS a ON ag.administrador_idadministrador = a.idadministrador
INNER JOIN 
    usuario AS u2 ON a.usuario_idUsuario = u2.idUsuario
GROUP BY 
    e.usuario_idUsuario, a.usuario_idUsuario
ORDER BY 
    TotalColaboracoes DESC;
    
    
    

-- Verificar as disponibilidades de especialistas para agendamento:    
select d.Iddisponibilidade, e.idespecialista,  u.nome as nomeEspecialista, d.data as dia_disponivel, d.hora as hora_disponivel 
from disponibilidade as d
join especialista as e  on d.especialista_idespecialista = e.idespecialista
join usuario as u on e.usuario_idUsuario = u.idUsuario;


-- Exibir especialistas que participaram de alterações de serviços:

SELECT 
    e.idespecialista, 
    u.nome AS nomeEspecialista,
    al.novoServico AS ultimaMudanca, 
    al.dataAlteracao AS dataMudanca
FROM 
    alteracao AS al
JOIN 
    especialista AS e ON al.especialista_idespecialista = e.idespecialista
JOIN 
    usuario AS u ON e.usuario_idusuario = u.idusuario
WHERE 
    al.dataAlteracao = (SELECT MAX(dataAlteracao) FROM alteracao WHERE especialista_idespecialista = e.idespecialista);
    
    
--  especialistas que não fizeram alterações no último mês:
SELECT 
    e.idespecialista, 
    u.nome AS nomeEspecialista
FROM 
    especialista AS e
JOIN 
    usuario AS u ON e.usuario_idusuario = u.idusuario
LEFT JOIN 
    alteracao AS al ON al.especialista_idespecialista = e.idespecialista
WHERE 
    al.dataAlteracao IS NULL OR al.dataAlteracao < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
    
    
-- quantiadade de feedbacks feitas de clientes
SELECT COUNT(*) AS total_feedbacks
FROM mydb.feedback f
JOIN mydb.cliente c ON f.cliente_idcliente = c.idcliente
WHERE f.mensagemFeedback IS NOT NULL;

-- Preço máximo dos serviços agendados
SELECT a.idagendamento, s.nome AS nome_servico, MAX(s.preco) AS preco_maximo
FROM mydb.servicos_has_agendamento sa
JOIN mydb.servicos s ON sa.servicos_idservicos = s.idservicos
JOIN mydb.agendamento a ON sa.agendamento_idagendamento = a.idagendamento
GROUP BY a.idagendamento, s.nome;

 -- Total de agendamentos por especialista e mês
SELECT 
    e.idespecialista, 
    u.nome AS nome_especialista,
    MONTH(a.data) AS mes, 
    COUNT(a.idagendamento) AS total_agendamentos
FROM mydb.especialista e
JOIN mydb.usuario u ON e.usuario_idUsuario = u.idUsuario
JOIN mydb.agendamento a ON e.idespecialista = a.administrador_idadministrador
GROUP BY e.idespecialista, u.nome, mes;

-- especialistas com mais agendamentos e o total de serviços realizados:
SELECT 
    e.idespecialista, 
    u.nome AS nome_especialista,
    COUNT(sa.agendamento_idagendamento) AS total_agendamentos
FROM mydb.especialista e
JOIN mydb.usuario u ON e.usuario_idUsuario = u.idUsuario
JOIN mydb.servicos_has_agendamento sa ON e.idespecialista = sa.servicos_administrador_idadministrador
GROUP BY e.idespecialista, u.nome
ORDER BY total_agendamentos DESC
LIMIT 5;


-- feedbacks por especialistas 
SELECT 
    e.idespecialista, 
    u.nome AS nome_especialista,
    COUNT(f.idfeedback) AS total_feedbacks
FROM mydb.especialista e
JOIN mydb.usuario u ON e.usuario_idUsuario = u.idUsuario
JOIN mydb.feedback f ON e.idespecialista = f.administrador_idadministrador
GROUP BY e.idespecialista, u.nome;

-- Contar o número de agendamentos realizados por especialista em um intervalo de datas '2024-01-01' e '2024-03-01'
SELECT 
    e.idespecialista, 
    u.nome AS nome_especialista,
    COUNT(a.idagendamento) AS total_agendamentos
FROM mydb.especialista e
JOIN mydb.usuario u ON e.usuario_idUsuario = u.idUsuario
JOIN mydb.agendamento a ON e.idespecialista = a.administrador_idadministrador
WHERE a.data BETWEEN '2024-01-01' AND '2024-03-01'
GROUP BY e.idespecialista, u.nome;

-- Exibir o número de serviços realizados e o faturamento total por especialista 
SELECT 
    e.idespecialista, 
    u.nome AS nome_especialista, 
    COUNT(sa.agendamento_idagendamento) AS total_servicos, 
    SUM(s.preco) AS faturamento_total
FROM mydb.especialista e
RIGHT JOIN mydb.usuario u ON e.usuario_idUsuario = u.idUsuario
RIGHT JOIN mydb.servicos_has_agendamento sa ON e.idespecialista = sa.servicos_administrador_idadministrador
RIGHT JOIN mydb.servicos s ON sa.servicos_idservicos = s.idservicos
GROUP BY e.idespecialista, u.nome;






















