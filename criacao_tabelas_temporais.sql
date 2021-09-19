-- Tabelas temporais

CREATE TABLE h_funcionarios ( 
    hfun_id             NUMBER(6), 
    hfun_matricula      CHAR(11), 
    hfun_primeiro_nome  VARCHAR2(15), 
    hfun_nome_meio      VARCHAR2(30), 
    hfun_ultimo_nome    VARCHAR2(15), 
    hfun_dt_contratacao DATE, 
    hfun_crg_id         NUMBER(6), 
    hfun_dt_entrada DATE 
);


CREATE TABLE h_cargos (
    hcrg_id   NUMBER(6),
    hcrg_nome VARCHAR2(255),
    hcrg_dt_entrada DATE
);

CREATE TABLE h_categorias (
    hcat_id   NUMBER(6),
    hcat_nome VARCHAR2(255),
    hcat_dt_entrada DATE
);


CREATE TABLE h_fornecedores (
    hfor_id          NUMBER(6),
    hfor_nome        VARCHAR2(255),
    hfor_telefone    CHAR(11),
    hfor_email       VARCHAR2(255),
    hfor_estado      CHAR(2),
    hfor_cidade      VARCHAR2(255),
    hfor_bairro      VARCHAR2(255),
    hfor_cep         CHAR(8),
    hfor_logradouro  VARCHAR2(255),
    hfor_numero      CHAR(6),
    hfor_complemento VARCHAR2(255),
    hfor_dt_entrada DATE
);


CREATE TABLE h_itens_venda (
    hitv_vnd_id         NUMBER(6),
    hitv_prd_id         NUMBER(6),
    hitv_quantidade INTEGER,
    hitv_dt_entrada DATE
);

CREATE TABLE h_produtos (
    hprd_id         NUMBER(6),
    hprd_nome       VARCHAR2(255),
    hprd_preco      NUMBER(8, 2),
    hprd_qtd_minima INTEGER,
    hprd_qtd_atual  INTEGER,
    hprd_for_id         NUMBER(6),
    hprd_cat_id         NUMBER(6),
    hprd_dt_entrada DATE
);

CREATE TABLE h_vendas (
    hvnd_id          NUMBER(6),
    hvnd_doc_cliente CHAR(14),
    hvnd_valor_total NUMBER(8, 2),
    hvnd_dt_hr       DATE,
    hvnd_fun_id          NUMBER(6),
    hvnd_dt_entrada DATE
);

-- PKs
ALTER TABLE h_cargos ADD CONSTRAINT pk_hcrg PRIMARY KEY ( hcrg_id );
ALTER TABLE h_categorias ADD CONSTRAINT pk_hcat PRIMARY KEY ( hcat_id );
ALTER TABLE h_fornecedores ADD CONSTRAINT pk_hfor PRIMARY KEY ( hfor_id );
ALTER TABLE h_funcionarios ADD CONSTRAINT pk_hfun PRIMARY KEY ( hfun_id );
ALTER TABLE h_itens_venda ADD CONSTRAINT pk_hitv PRIMARY KEY ( hitv_vnd_id, hitv_prd_id );
ALTER TABLE h_produtos ADD CONSTRAINT pk_hprd PRIMARY KEY ( hprd_id );
ALTER TABLE h_vendas ADD CONSTRAINT pk_hvnd PRIMARY KEY ( hvnd_id );