-- Comentários da Tabela de Auditoria
COMMENT ON TABLE audit_table IS 'Responsável por armazenar os dados referentes aos campos auditáveis após as ações de Insert, Delete e Update.';

-- Comentários das colunas da tabela audit_table
COMMENT ON COLUMN audit_table.aud_id IS 'Armazenamento da chave primária da tabela de auditoria.';
COMMENT ON COLUMN audit_table.aud_dt_hora IS 'Armazenamento da data e hora da entrada dos dados na tabela de auditoria.';
COMMENT ON COLUMN audit_table.aud_evento IS 'Armazenamento do tipo de evento realizado (I, insert; U, update; D, delete).';
COMMENT ON COLUMN audit_table.aud_tabela IS 'Armazenamento do dado referente ao nome da tabela cujo evento foi realizado';
COMMENT ON COLUMN audit_table.aud_dono IS 'Armazenamento do dado referente ao dono do schema (owner).';
COMMENT ON COLUMN audit_table.aud_campo_alterado IS 'Armazendamento do dado referente ao nome do campo alterado pelo evento.';
COMMENT ON COLUMN audit_table.aud_val_antigo IS 'Armazenamento do dado referente ao valor antigo do campo alterado.';
COMMENT ON COLUMN audit_table.aud_val_novo IS 'Armazenamento do dado referente ao novo valor do campo alterado.';
COMMENT ON COLUMN audit_table.aud_id_linha IS 'Armazenamento do dado referente ao identificador (id) da linha cujo dado foi alterado.';
COMMENT ON COLUMN audit_table.aud_usuario_bd IS 'Armazenamento do dado referente ao usuário do banco de dados que realizou o evento.';

