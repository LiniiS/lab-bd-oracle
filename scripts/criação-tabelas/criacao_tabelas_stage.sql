--stage table v1
-- tabela com dados transacionais para data warehouse

create table stage_table (
    stg_prd_id NUMBER(6), 
    stg_prd_nome VARCHAR(255), 
    stg_prd_preco NUMBER(8,2), 
    stg_vnd_id NUMBER(6),
    stg_vnd_total NUMBER(8,2),
    stg_vnd_fun_id NUMBER(6),
    stg_fun_nome VARCHAR(46),
    stg_fun_cargo VARCHAR(255),
    stg_for_uf_origem CHAR(2), 
    stg_prd_categoria VARCHAR(255), 
    stg_tipo_cliente CHAR(4),
    stg_vnd_periodo CHAR(6),
    stg_vnd_trimestre INTEGER
);

ALTER TABLE stage_table
    ADD CONSTRAINT fk_stg_prd FOREIGN KEY ( stg_prd_id )
        REFERENCES produtos ( prd_id );

ALTER TABLE stage_table
    ADD CONSTRAINT fk_stg_vnd FOREIGN KEY ( stg_vnd_id )
        REFERENCES vendas ( vnd_id );


ALTER TABLE stage_table
    ADD CONSTRAINT fk_stg_fun FOREIGN KEY ( stg_vnd_fun_id )
        REFERENCES funcionarios ( fun_id );


-- Constraints
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O1 CHECK (stg_prd_nome IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O2 CHECK (stg_prd_preco IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O3 CHECK (stg_vnd_total IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O4 CHECK (stg_fun_nome IS NOT NULL);

ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O5 CHECK (stg_fun_cargo IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O6 CHECK (stg_for_uf_origem IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O7 CHECK (stg_prd_categoria IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O8 CHECK (stg_tipo_cliente IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O9 CHECK (stg_vnd_periodo IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_10 CHECK (stg_vnd_trimestre IS NOT NULL);