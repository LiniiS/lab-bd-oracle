-- Trigger para inserção em AUDIT_TABLE após eventos em CARGOS
create trigger tg_crg_aud_tab
after INSERT OR UPDATE OR DELETE on CARGOS
for each row
begin
    if inserting then 
        insere_aud_table(systimestamp, 'I', 'CARGOS', 'PETSHOP', NULL, NULL, NULL, :new.crg_id, busca_usuario());
    end if;
    if deleting then
        insere_aud_table(systimestamp, 'D', 'CARGOS', 'PETSHOP', NULL, NULL, NULL, :old.crg_id, busca_usuario());
    end if;
    if updating then
        if(:old.crg_nome <> :new.crg_nome) then insere_aud_table(systimestamp, 'U','CARGOS', 'PETSHOP', 'CRG_NOME', :old.crg_nome, :new.crg_nome, :new.crg_id, busca_usuario()); end if;
    end if;
end;