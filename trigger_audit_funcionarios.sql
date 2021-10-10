-- Trigger para inserção em AUDIT_TABLE após eventos em FUNCIONARIOS
create trigger tg_fun_aud_tab
after INSERT OR UPDATE OR DELETE on FUNCIONARIOS
for each row
begin
    if inserting then 
        insere_aud_table(systimestamp, 'I', 'FUNCIONARIOS', 'PETSHOP', NULL, NULL, NULL, :new.fun_id, busca_usuario());
    end if;
    if deleting then
        insere_aud_table(systimestamp, 'D', 'FUNCIONARIOS', 'PETSHOP', NULL, NULL, NULL, :old.fun_id, busca_usuario());
    end if;
    if updating then
        if(:old.fun_matricula <> :new.fun_matricula) then
        insere_aud_table(systimestamp, 'U', 'FUNCIONARIOS', 'PETSHOP', 'FUN_MATRICULA', :old.fun_matricula, :new.fun_matricula, :new.fun_id, busca_usuario());
        end if;
         if(:old.fun_primeiro_nome <> :new.fun_primeiro_nome) then
        insere_aud_table(systimestamp, 'U', 'FUNCIONARIOS', 'PETSHOP', 'FUN_PRIMEIRO_NOME', :old.fun_primeiro_nome, :new.fun_primeiro_nome, :new.fun_id, busca_usuario());
        end if;
         if((:old.fun_nome_meio is null and :new.fun_matricula is not null) or (:old.fun_nome_meio is not null and :new.fun_nome_meio is null) or (:old.fun_nome_meio <> :new.fun_nome_meio))then
        insere_aud_table(systimestamp, 'U', 'FUNCIONARIOS', 'PETSHOP', 'FUN_NOME_MEIO', :old.fun_nome_meio, :new.fun_nome_meio, :new.fun_id, busca_usuario());
        end if;
         if(:old.fun_ultimo_nome <> :new.fun_ultimo_nome) then
        insere_aud_table(systimestamp, 'U', 'FUNCIONARIOS', 'PETSHOP', 'FUN_ULTIMO_NOME', :old.fun_ultimo_nome, :new.fun_ultimo_nome, :new.fun_id, busca_usuario());
        end if;
         if(:old.fun_dt_contratacao <> :new.fun_dt_contratacao) then
        insere_aud_table(systimestamp, 'U', 'FUNCIONARIOS', 'PETSHOP', 'FUN_DT_CONTRATACAO', to_char(:old.fun_dt_contratacao), to_char(:new.fun_dt_contratacao), :new.fun_id, busca_usuario());
        end if;
         if(:old.fun_crg_id <> :new.fun_crg_id) then
        insere_aud_table(systimestamp, 'U', 'FUNCIONARIOS', 'PETSHOP', 'FUN_CRG_ID', :old.fun_crg_id, :new.fun_crg_id, :new.fun_id, busca_usuario());
        end if;
    end if;
end;
