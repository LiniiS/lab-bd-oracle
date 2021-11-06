CREATE TABLE cargos (
    crg_id   NUMBER(6),
    crg_nome VARCHAR2(255)
);

CREATE TABLE categorias (
    cat_id   NUMBER(6),
    cat_nome VARCHAR2(255)
);


CREATE TABLE fornecedores (
    for_id          NUMBER(6),
    for_nome        VARCHAR2(255),
    for_telefone    CHAR(11),
    for_email       VARCHAR2(255),
    for_estado      CHAR(2),
    for_cidade      VARCHAR2(255),
    for_bairro      VARCHAR2(255),
    for_cep         CHAR(8),
    for_logradouro  VARCHAR2(255),
    for_numero      CHAR(6),
    for_complemento VARCHAR2(255)
);

CREATE TABLE funcionarios (
    fun_id             NUMBER(6),
    fun_matricula      CHAR(11),
    fun_primeiro_nome  VARCHAR2(15),
    fun_nome_meio      VARCHAR2(30),
    fun_ultimo_nome    VARCHAR2(15),
    fun_dt_contratacao DATE,
    fun_crg_id         NUMBER(6)
);

CREATE TABLE itens_venda (
    itv_vnd_id     NUMBER(6),
    itv_prd_id     NUMBER(6),
    itv_quantidade INTEGER
);

CREATE TABLE produtos (
    prd_id         NUMBER(6),
    prd_nome       VARCHAR2(255),
    prd_preco      NUMBER(8, 2),
    prd_qtd_minima INTEGER,
    prd_qtd_atual  INTEGER,
    prd_for_id     NUMBER(6),
    prd_cat_id     NUMBER(6)
);

CREATE TABLE vendas (
    vnd_id          NUMBER(6),
    vnd_doc_cliente VARCHAR2(14),
    vnd_valor_total NUMBER(8, 2),
    vnd_dt_hr       DATE,
    vnd_fun_id      NUMBER(6)
);


-- CONSTRAINTS
-- Constraint PK
ALTER TABLE cargos ADD CONSTRAINT pk_crg PRIMARY KEY ( crg_id );
ALTER TABLE categorias ADD CONSTRAINT pk_cat PRIMARY KEY ( cat_id );
ALTER TABLE fornecedores ADD CONSTRAINT pk_for PRIMARY KEY ( for_id );
ALTER TABLE funcionarios ADD CONSTRAINT pk_fun PRIMARY KEY ( fun_id );
ALTER TABLE itens_venda ADD CONSTRAINT pk_itv PRIMARY KEY ( itv_vnd_id, itv_prd_id );
ALTER TABLE produtos ADD CONSTRAINT pk_prd PRIMARY KEY ( prd_id );
ALTER TABLE vendas ADD CONSTRAINT pk_vnd PRIMARY KEY ( vnd_id );

-- Constraint FK
ALTER TABLE funcionarios
    ADD CONSTRAINT fk_fun_crg FOREIGN KEY ( fun_crg_id )
        REFERENCES cargos ( crg_id );

ALTER TABLE itens_venda
    ADD CONSTRAINT fk_itv_prd FOREIGN KEY ( itv_prd_id )
        REFERENCES produtos ( prd_id );

ALTER TABLE itens_venda
    ADD CONSTRAINT fk_itv_vnd FOREIGN KEY ( itv_vnd_id )
        REFERENCES vendas ( vnd_id );

ALTER TABLE produtos
    ADD CONSTRAINT fk_prd_cat FOREIGN KEY ( prd_cat_id )
        REFERENCES categorias ( cat_id );

ALTER TABLE produtos
    ADD CONSTRAINT fk_prd_for FOREIGN KEY ( prd_for_id )
        REFERENCES fornecedores ( for_id );

ALTER TABLE vendas
    ADD CONSTRAINT fk_vnd_fun FOREIGN KEY ( vnd_fun_id )
        REFERENCES funcionarios ( fun_id );

-- Constraint NN
ALTER TABLE cargos ADD CONSTRAINT NN_CRG_01 CHECK ( crg_nome IS NOT NULL );

ALTER TABLE categorias ADD CONSTRAINT NN_CAT_01 CHECK ( cat_nome IS NOT NULL );

ALTER TABLE itens_venda ADD CONSTRAINT NN_ITV_01 CHECK ( itv_quantidade IS NOT NULL );

ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_01 CHECK ( for_nome IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_02 CHECK ( for_telefone IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_03 CHECK ( for_email IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_04 CHECK ( for_estado IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_05 CHECK ( for_cidade IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_06 CHECK ( for_bairro IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_07 CHECK ( for_cep IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_08 CHECK ( for_logradouro IS NOT NULL );
ALTER TABLE fornecedores ADD CONSTRAINT NN_FOR_09 CHECK ( for_numero IS NOT NULL );

ALTER TABLE funcionarios ADD CONSTRAINT NN_FUN_01 CHECK ( fun_matricula IS NOT NULL );
ALTER TABLE funcionarios ADD CONSTRAINT NN_FUN_02 CHECK ( fun_primeiro_nome IS NOT NULL );
ALTER TABLE funcionarios ADD CONSTRAINT NN_FUN_03 CHECK ( fun_ultimo_nome IS NOT NULL );
ALTER TABLE funcionarios ADD CONSTRAINT NN_FUN_04 CHECK ( fun_dt_contratacao IS NOT NULL );

ALTER TABLE produtos ADD CONSTRAINT NN_PRD_01 CHECK ( prd_nome IS NOT NULL );
ALTER TABLE produtos ADD CONSTRAINT NN_PRD_02 CHECK ( prd_preco IS NOT NULL );
ALTER TABLE produtos ADD CONSTRAINT NN_PRD_03 CHECK ( prd_qtd_minima IS NOT NULL );
ALTER TABLE produtos ADD CONSTRAINT NN_PRD_04 CHECK ( prd_qtd_atual IS NOT NULL );

ALTER TABLE vendas ADD CONSTRAINT NN_VND_01 CHECK ( vnd_doc_cliente IS NOT NULL );
ALTER TABLE vendas ADD CONSTRAINT NN_VND_02 CHECK ( vnd_valor_total IS NOT NULL );
ALTER TABLE vendas ADD CONSTRAINT NN_VND_03 CHECK ( vnd_dt_hr IS NOT NULL );
