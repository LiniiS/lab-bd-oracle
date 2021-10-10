-- Procedure para inserir na audit_table
create procedure INSERE_AUD_TABLE(
    p_aud_dt_hora TIMESTAMP,
    p_aud_evento CHAR,
    p_aud_tabela VARCHAR,
    p_aud_dono VARCHAR,
    p_aud_campo_alterado VARCHAR,
    p_aud_val_antigo VARCHAR,
    p_aud_val_novo VARCHAR,
    p_aud_id_linha VARCHAR,
    p_aud_usuario_bd VARCHAR
) is
begin
    insert into audit_table values(0, p_aud_dt_hora, p_aud_evento, p_aud_tabela, p_aud_dono, p_aud_campo_alterado, p_aud_val_antigo, p_aud_val_novo, p_aud_id_linha, p_aud_usuario_bd);
end INSERE_AUD_TABLE;        

-- teste da proc com bloco anônimo
    --log do oracle xe:
    -- Procedure INSERE_AUD_TABLE compilado
    -- Procedimento PL/SQL concluído com sucesso.
/* declare
    p_aud_dt_hora timestamp := systimestamp;
    p_aud_evento CHAR(1) := 'U';
    p_aud_tabela VARCHAR(30) := 'FORNECEDORES';
    p_aud_dono VARCHAR(30) := 'PETSHOP';
    p_aud_campo_alterado VARCHAR(30) := 'FOR_TELEFONE';
    p_aud_val_antigo VARCHAR(255) := '1329229140';
    p_aud_val_novo VARCHAR(255) := '1329228140';
    p_aud_id_linha VARCHAR(50) := '3';
    p_aud_usuario_bd  VARCHAR(30) := 'Usuario';

begin
     insert into audit_table values(0, p_aud_dt_hora, p_aud_evento, p_aud_tabela, p_aud_dono, p_aud_campo_alterado, p_aud_val_antigo, p_aud_val_novo, p_aud_id_linha, p_aud_usuario_bd);
end;

select * from audit_table;
*/
