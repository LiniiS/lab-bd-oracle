-- SEQUENCES e TRIGGERS
-- obrigatório para todas as tabelas que possuem 'id própio', mas não para tabela de relacionamentos
CREATE SEQUENCE seq_cat nocache;
CREATE SEQUENCE seq_crg nocache;
CREATE SEQUENCE seq_for nocache;
CREATE SEQUENCE seq_fun nocache;
CREATE SEQUENCE seq_prd nocache;
CREATE SEQUENCE seq_vnd nocache;


CREATE TRIGGER tg_seq_cat
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN
    :NEW.cat_id := seq_cat.nextval;
END;


CREATE TRIGGER tg_seq_crg
BEFORE INSERT ON cargos
FOR EACH ROW
BEGIN
    :NEW.crg_id := seq_crg.nextval;
END;


CREATE TRIGGER tg_seq_for
BEFORE INSERT ON fornecedores
FOR EACH ROW
BEGIN
    :NEW.for_id := seq_for.nextval;
END;

CREATE TRIGGER tg_seq_fun
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    :NEW.fun_id := seq_fun.nextval;
END;


CREATE TRIGGER tg_seq_vnd
BEFORE INSERT ON vendas
FOR EACH ROW
BEGIN
    :NEW.vnd_id := seq_vnd.nextval;
END;

CREATE TRIGGER tg_seq_prd
BEFORE INSERT ON produtos
FOR EACH ROW
BEGIN
    :NEW.prd_id := seq_prd.nextval;
END;
