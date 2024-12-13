
-- TRIGGERS 


-- TESTE
DELIMITER $$

CREATE TRIGGER teste_trigger
AFTER INSERT ON servicos_has_agendamento
FOR EACH ROW
BEGIN
    INSERT INTO log_trigger (mensagem) VALUES ('Trigger executado com sucesso');
END$$

DELIMITER ;

-- PRIMEIRO TRIGGER 
DELIMITER $$

CREATE TRIGGER verificar_preco_servico
BEFORE UPDATE ON servicos
FOR EACH ROW
BEGIN
    IF OLD.preco <> NEW.preco THEN
        INSERT INTO log_alteracao (mensagem)
        VALUES (CONCAT('Preço do serviço ', OLD.nome, ' alterado de ', OLD.preco, ' para ', NEW.preco));
    END IF;
END$$

DELIMITER ;

-- SEGUNDO TRIGGER

DELIMITER $$

CREATE TRIGGER atualizar_servicos_dia
AFTER INSERT ON agendamento
FOR EACH ROW
BEGIN
    UPDATE servicos_dia
    SET total_servicos = total_servicos + 1
    WHERE dia = DATE(NEW.data);
END$$

DELIMITER ;

-- TERCEIRO TRIGGER
DELIMITER $$

CREATE TRIGGER cancelar_agendamento
AFTER DELETE ON agendamento
FOR EACH ROW
BEGIN
    DELETE FROM servicos_has_agendamento
    WHERE agendamento_idagendamento = OLD.idagendamento;
END$$

DELIMITER ;

-- QUARTO TRIGGER 
DELIMITER $$

CREATE TRIGGER notificar_alteracao_preco_servico
AFTER UPDATE ON servicos
FOR EACH ROW
BEGIN
    IF OLD.preco <> NEW.preco THEN
        INSERT INTO notificacoes (mensagem)
        VALUES (CONCAT('O preço do serviço "', NEW.nome, '" foi alterado para ', NEW.preco));
    END IF;
END$$

DELIMITER ;


-- QUINTO TRIGGER 
DELIMITER $$



CREATE TRIGGER registrar_historico_alteracao_servico
AFTER UPDATE ON servicos
FOR EACH ROW
BEGIN
    INSERT INTO historico_servicos (servico_id, nome_antigo, preco_antigo, nome_novo, preco_novo, data_alteracao)
    VALUES (NEW.idservicos, OLD.nome, OLD.preco, NEW.nome, NEW.preco, NOW());
END$$

DELIMITER ;

-- SEXTO TRIGGER 
DELIMITER $$

CREATE TRIGGER registrar_alteracao_data_agendamento
AFTER UPDATE ON agendamento
FOR EACH ROW
BEGIN
    INSERT INTO historico_agendamentos (agendamento_id, data_antiga, data_nova)
    VALUES (NEW.idagendamento, OLD.data, NEW.data);
END$$

DELIMITER ;

SHOW triggers;




