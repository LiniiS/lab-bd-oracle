-- Trigger para inserção em AUDIT_TABLE após eventos em CATEGORIAS
create trigger tg_cat_aud_tab
after INSERT OR UPDATE OR DELETE on CATEGORIAS
for each row
begin
    if inserting then 
        insere_aud_table(systimestamp, 'I', 'CATEGORIAS', 'PETSHOP', NULL, NULL, NULL, :new.cat_id, busca_usuario());
    end if;
    if deleting then
        insere_aud_table(systimestamp, 'D', 'CATEGORIAS', 'PETSHOP', NULL, NULL, NULL, :old.cat_id, busca_usuario());
    end if;
    if updating then
        if(:old.cat_nome <> :new.cat_nome) then insere_aud_table(systimestamp, 'U', 'CATEGORIAS', 'PETSHOP','CAT_NOME', :old.cat_nome, :new.cat_nome, :new.cat_id, busca_usuario());
        end if;
    end if;
end;