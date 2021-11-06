-- Trigger para inserção em AUDIT_TABLE após eventos em ITENS_VENDA
create trigger tg_itv_aud_tab
after INSERT OR UPDATE OR DELETE on ITENS_VENDA
for each row
begin
    if inserting then 
        insere_aud_table(systimestamp, 'I', 'ITENS_VENDA', 'PETSHOP', NULL, NULL, NULL, concat(:new.itv_vnd_id, :new.itv_prd_id), busca_usuario());
    end if;
    if deleting then
         insere_aud_table(systimestamp, 'D', 'ITENS_VENDA', 'PETSHOP', NULL, NULL, NULL, concat(:old.itv_vnd_id, :old.itv_prd_id), busca_usuario());
    end if;
    if updating then
       if(:old.itv_quantidade <> :new.itv_quantidade) then
       insere_aud_table(systimestamp, 'U', 'ITENS_VENDA', 'PETSHOP', 'ITV_QUANTIDADE', :old.itv_quantidade, :new.itv_quantidade, concat(:new.itv_prd_id, :new.itv_vnd_id), busca_usuario());
       end if;
    end if;
end;