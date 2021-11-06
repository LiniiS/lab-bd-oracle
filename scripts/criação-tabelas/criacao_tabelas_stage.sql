--stage table v2
-- tabela com dados transacionais para data warehouse

create table stage_table (
    stg_prd_nome VARCHAR2(255), 
    stg_prd_preco NUMBER(8,2),
    stg_prd_qtd_vendida INTEGER, 
    stg_prd_categoria VARCHAR2(255), 
    stg_fun_nome VARCHAR2(46),
    stg_for_uf_origem CHAR(2),    
    stg_tipo_cliente VARCHAR2(4),
    stg_vnd_total NUMBER(8,2),
    stg_vnd_periodo VARCHAR2(6),
    stg_vnd_trimestre INTEGER,   
    stg_vnd_dia_semana VARCHAR2(30) 
);


-- Constraints
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O1 CHECK (stg_prd_nome IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O2 CHECK (stg_prd_preco IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O3 CHECK (stg_prd_qtd_vendida IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O4 CHECK (stg_prd_categoria IS NOT NULL);

ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O5 CHECK (stg_fun_nome IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O6 CHECK (stg_for_uf_origem IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O7 CHECK (stg_tipo_cliente IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O8 CHECK (stg_vnd_total IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_O9 CHECK (stg_vnd_periodo IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_10 CHECK (stg_vnd_trimestre IS NOT NULL);
ALTER TABLE stage_table ADD CONSTRAINT NN_STG_11 CHECK (stg_vnd_dia_semana IS NOT NULL);