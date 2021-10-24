-- tabela de auditoria
create table audit_table(
    aud_id             NUMBER(6),
    aud_dt_hora        TIMESTAMP,
    aud_evento         CHAR(1),
    aud_tabela         VARCHAR(30),
    aud_dono           VARCHAR(30),
    aud_campo_alterado VARCHAR(30),
    aud_val_antigo     VARCHAR(255),
    aud_val_novo       VARCHAR(255),
    aud_id_linha       VARCHAR(50),
    aud_usuario_bd     VARCHAR(30)
);

-- Constraints
ALTER TABLE audit_table ADD CONSTRAINT PK_AUD PRIMARY KEY (aud_id);
ALTER TABLE audit_table ADD CONSTRAINT CK_AUD_01 CHECK (aud_evento IN ('I', 'U', 'D'));
ALTER TABLE audit_table ADD CONSTRAINT NN_AUD_O1 CHECK (aud_evento IS NOT NULL);
ALTER TABLE audit_table ADD CONSTRAINT NN_AUD_O2 CHECK (aud_dt_hora IS NOT NULL);
ALTER TABLE audit_table ADD CONSTRAINT NN_AUD_O3 CHECK (aud_tabela IS NOT NULL);
ALTER TABLE audit_table ADD CONSTRAINT NN_AUD_O4 CHECK (aud_dono IS NOT NULL);

-- campo alterado, old e new values podem ser nulos -> I/D
ALTER TABLE audit_table ADD CONSTRAINT NN_AUD_O5 CHECK (aud_id_linha IS NOT NULL);
ALTER TABLE audit_table ADD CONSTRAINT NN_AUD_O6 CHECK (aud_usuario_bd IS NOT NULL);

