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

-- Comentários da Tabela de Auditoria
COMMENT ON TABLE audit_table IS 'Responsável por armazenar os dados referentes aos campos auditáveis após as ações de Insert, Delete e Update.';

-- Comentários das colunas da tabela audit_table
COMMENT ON COLUMN aud_id IS 'Armazenamento da chave primária da tabela de auditoria.';
COMMENT ON COLUMN aud_dt_hora IS 'Armazenamento da data e hora da entrada dos dados na tabela de auditoria.';
COMMENT ON COLUMN aud_evento IS 'Armazenamento do tipo de evento realizado (I, insert; U, update; D, delete).';
COMMENT ON COLUMN aud_tabela IS 'Armazenamento do dado referente ao nome da tabela cujo evento foi realizado';
COMMENT ON COLUMN aud_dono IS 'Armazenamento do dado referente ao dono do schema (owner).';
COMMENT ON COLUMN aud_campo_alterado IS 'Armazendamento do dado referente ao nome do campo alterado pelo evento.';
COMMENT ON COLUMN aud_val_antigo IS 'Armazenamento do dado referente ao valor antigo do campo alterado.';
COMMENT ON COLUMN aud_val_novo IS 'Armazenamento do dado referente ao novo valor do campo alterado.';
COMMENT ON COLUMN aud_id_linha IS 'Armazenamento do dado referente ao identificador (id) da linha cujo dado foi alterado.';
COMMENT ON COLUMN aud_usuario_bd IS 'Armazenamento do dado referente ao usuário do banco de dados que realizou o evento.';

-- Sequence
create sequence seq_aud_tab nocache;

-- Trigger
create trigger tg_seq_aud_tab
before insert on audit_table
for each row
begin
    :new.aud_id := seq_aud_tab.nextval;
end;
