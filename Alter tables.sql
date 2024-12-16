ALTER TABLE SERVICOS ADD DESCRICAO VARCHAR(100) AFTER PRECO;




UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Corte de cabelo', `preco` = 50.00, `descricao` = 'Serviço de corte de cabelo masculino ou feminino.'
WHERE `idservicos` = 1;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Manicure', `preco` = 30.00, `descricao` = 'Serviço de cuidados com as unhas das mãos.'
WHERE `idservicos` = 2;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Hidratação capilar', `preco` = 80.00, `descricao` = 'Tratamento para hidratar os fios de cabelo.'
WHERE `idservicos` = 3;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Pintura de unhas', `preco` = 25.00, `descricao` = 'Serviço de esmaltação de unhas com variedade de cores.'
WHERE `idservicos` = 4;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Barbearia', `preco` = 40.00, `descricao` = 'Serviço de corte e aparo de barba.'
WHERE `idservicos` = 5;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Massagem', `preco` = 100.00, `descricao` = 'Massagem relaxante para aliviar o estresse.'
WHERE `idservicos` = 6;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Design de sobrancelhas', `preco` = 35.00, `descricao` = 'Correção e modelagem das sobrancelhas.'
WHERE `idservicos` = 7;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Consultoria de estilo', `preco` = 200.00, `descricao` = 'Orientação sobre estilo pessoal e vestuário.'
WHERE `idservicos` = 8;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Depilação', `preco` = 70.00, `descricao` = 'Depilação corporal utilizando cera.'
WHERE `idservicos` = 9;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Tratamento facial', `preco` = 150.00, `descricao` = 'Tratamento de cuidados com a pele do rosto.'
WHERE `idservicos` = 10;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Corte infantil', `preco` = 45.00, `descricao` = 'Corte de cabelo especializado para crianças.'
WHERE `idservicos` = 11;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Maquiagem', `preco` = 90.00, `descricao` = 'Serviço de maquiagem para diversas ocasiões.'
WHERE `idservicos` = 12;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Spa capilar', `preco` = 120.00, `descricao` = 'Tratamento capilar relaxante e reparador.'
WHERE `idservicos` = 13;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Unhas de gel', `preco` = 95.00, `descricao` = 'Aplicação de unhas de gel para maior durabilidade.'
WHERE `idservicos` = 14;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Peeling facial', `preco` = 160.00, `descricao` = 'Tratamento para renovação celular da pele do rosto.'
WHERE `idservicos` = 15;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Design de unhas', `preco` = 50.00, `descricao` = 'Criação de design personalizado para as unhas.'
WHERE `idservicos` = 16;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Tratamento para cabelos danificados', `preco` = 85.00, `descricao` = 'Tratamento intensivo para cabelos danificados.'
WHERE `idservicos` = 17;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Barba e cabelo', `preco` = 60.00, `descricao` = 'Corte de cabelo e cuidado com a barba.'
WHERE `idservicos` = 18;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Massagem relaxante', `preco` = 110.00, `descricao` = 'Massagem para relaxamento e alívio de tensões.'
WHERE `idservicos` = 19;

UPDATE `mydb`.`servicos`
SET 
    `nome` = 'Tratamento de acne', `preco` = 130.00, `descricao` = 'Tratamento especializado para controle de acne.'
WHERE `idservicos` = 20;
