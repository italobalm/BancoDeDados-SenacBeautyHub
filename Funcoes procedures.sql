-- funcões e procedures

-- PRIMEIRA
DELIMITER $$
CREATE PROCEDURE CriarUsuario (
    IN p_cpf VARCHAR(11),
    IN p_email VARCHAR(200),
    IN p_senha VARCHAR(60),
    IN p_nome VARCHAR(200),
    IN p_dataNasc DATE,
    IN p_tipoPerfil ENUM('client', 'especialista', 'administrador')
)
BEGIN
    INSERT INTO usuario (cpf, email, senha, nome, dataNasc, tipoPerfil)
    VALUES (p_cpf, p_email, p_senha, p_nome, p_dataNasc, p_tipoPerfil);
END$$
DELIMITER ;

-- SEGUNDA
DELIMITER $$
CREATE PROCEDURE AtualizarEmailUsuario (
    IN p_idUsuario INT,
    IN p_email VARCHAR(200)
)
BEGIN
    UPDATE usuario
    SET email = p_email
    WHERE idUsuario = p_idUsuario;
END$$
DELIMITER ;

-- TERCEIRA
DELIMITER $$
CREATE FUNCTION ConsultarAgendamentosPorData(p_data DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_agendamentos INT;

    SELECT COUNT(*) INTO total_agendamentos
    FROM agendamento
    WHERE data = p_data;

    RETURN total_agendamentos;
END$$
DELIMITER ;

-- QUARTA
DELIMITER $$
CREATE PROCEDURE ExcluirServico (
    IN p_idservicos INT,
    IN p_administrador_id INT,
    IN p_administrador_usuario_id INT
)
BEGIN
    DELETE FROM servicos
    WHERE idservicos = p_idservicos
      AND administrador_idadministrador = p_administrador_id
      AND administrador_usuario_idUsuario = p_administrador_usuario_id;
END$$
DELIMITER ;

-- QUINTA
DELIMITER $$
CREATE PROCEDURE InserirTelefone (
    IN p_numero VARCHAR(15),
    IN p_usuario_id INT
)
BEGIN
    INSERT INTO telefone (numero, usuario_idUsuario)
    VALUES (p_numero, p_usuario_id);
END$$
DELIMITER ;


-- SEXTA
DELIMITER $$
CREATE FUNCTION ConsultarServicosDisponiveis()
RETURNS VARCHAR(1000)
DETERMINISTIC
BEGIN
    DECLARE servicos_disponiveis VARCHAR(1000);

    SELECT GROUP_CONCAT(nome SEPARATOR ', ') INTO servicos_disponiveis
    FROM servicos;

    RETURN servicos_disponiveis;
END$$
DELIMITER ;

-- SETIMA
DELIMITER $$

CREATE FUNCTION calcular_servicos_alterados(p_especialista_id INT) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE qtd INT;
    SELECT COUNT(*) INTO qtd
    FROM alteracao
    WHERE especialista_idespecialista = p_especialista_id;
    RETURN qtd;
END$$

DELIMITER ;


-- OITAVA
DELIMITER $$
CREATE FUNCTION ConsultarFeedbacksCliente(p_cliente_id INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE feedbacks TEXT;

    SELECT GROUP_CONCAT(mensagemFeedback SEPARATOR '; ') INTO feedbacks
    FROM feedback
    WHERE cliente_idcliente = p_cliente_id;

    RETURN feedbacks;
END$$
DELIMITER ;


-- NONA
DELIMITER $$
CREATE FUNCTION ListarEspecialistasDisponiveis(p_data DATE, p_hora TIME)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE especialistas TEXT;

    SELECT GROUP_CONCAT(DISTINCT usuario.nome SEPARATOR ', ') INTO especialistas
    FROM Disponibilidade
    INNER JOIN especialista ON Disponibilidade.especialista_idespecialista = especialista.idespecialista
    INNER JOIN usuario ON especialista.usuario_idUsuario = usuario.idUsuario
    WHERE Disponibilidade.data = p_data AND Disponibilidade.hora = p_hora;

    RETURN especialistas;
END$$
DELIMITER ;

-- DECIMA
 
 
DELIMITER $$

CREATE FUNCTION calcular_idade(cpf VARCHAR(11)) 
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE idade INT;
    SELECT TIMESTAMPDIFF(YEAR, dataNasc, CURDATE()) INTO idade
    FROM usuario
    WHERE cpf = cpf
    LIMIT 1;
    RETURN idade;
END$$

DELIMITER ;

DROP function CALCULAR_IDADE





