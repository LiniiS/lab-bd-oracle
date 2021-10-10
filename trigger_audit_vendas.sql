-- Trigger para inserção em AUDIT_TABLE após eventos em VENDAS
create trigger tg_vnd_aud_tab
after INSERT OR UPDATE OR DELETE on VENDAS
for each row
begin
    if inserting then 
        insere_aud_table(systimestamp, 'I', 'VENDAS', 'PETSHOP', NULL, NULL, NULL, :new.vnd_id, busca_usuario());
    end if;
    if deleting then
        insere_aud_table(systimestamp, 'D', 'VENDAS', 'PETSHOP', NULL, NULL, NULL, :old.vnd_id, busca_usuario());
    end if;
    if updating then
        if(:old.vnd_doc_cliente <> :new.vnd_doc_cliente) then 
        insere_aud_table(systimestamp, 'U', 'VENDAS', 'PETSHOP', 'VND_DOC_CLIENTE', :old.vnd_doc_cliente, :new.vnd_doc_cliente, :new.vnd_id, busca_usuario());
        end if;
         if(:old.vnd_valor_total <> :new.vnd_valor_total) then 
        insere_aud_table(systimestamp, 'U', 'VENDAS', 'PETSHOP', 'VND_VALOR_TOTAL', :old.vnd_valor_total, :new.vnd_valor_total, :new.vnd_id, busca_usuario());
        end if;
         if(:old.vnd_fun_id <> :new.vnd_fun_id) then 
        insere_aud_table(systimestamp, 'U', 'VENDAS', 'PETSHOP', 'VND_FUN_ID', :old.vnd_fun_id, :new.vnd_fun_id, :new.vnd_id, busca_usuario());
        end if;
    end if;
end;
