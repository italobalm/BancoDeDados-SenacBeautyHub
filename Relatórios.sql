-- consultas/perguntas/relatorios usando join etc


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
order by preco ASC;

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





