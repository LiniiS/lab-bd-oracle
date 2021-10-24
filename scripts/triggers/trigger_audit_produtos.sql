-- Trigger para inserção em AUDIT_TABLE após eventos em PRODUTOS
create trigger tg_prd_aud_tab
after INSERT, UPDATE OR DELETE on PRODUTOS
for each row
begin

    if inserting then 
        insere_aud_table(systimestamp, 'I', 'PRODUTOS', 'PETSHOP', NULL, NULL, NULL, :new.prd_id, busca_usuario());
    end if;
    if deleting then
        insere_aud_table(systimestamp, 'D', 'PRODUTOS', 'PETSHOP', NULL, NULL, NULL, :old.prd_id, busca_usuario());
    end if;
    if updating then
        if(:old.prd_nome <> :new.prd_nome) then insere_aud_table(systimestamp, 'U', 'PRODUTOS', 'PETSHOP', 'PRD_NOME', :old.prd_nome, :new.prd_nome, :new.prd_id, busca_usuario());
        if(:old.prd_preco <> :new.prd_preco) then insere_aud_table(systimestamp, 'U', 'PRODUTOS', 'PETSHOP', 'PRD_PRECO', :old.prd_preco, :new.prd_preco, :new.prd_id, busca_usuario());
        if(:old.prd_qtd_minima <> :new.prd_qtd_minima) then insere_aud_table(systimestamp, 'U', 'PRODUTOS', 'PETSHOP', 'PRD_QTD_MINIMA', :old.prd_qtd_minima, :new.prd_qtd_minima, :new.prd_id, busca_usuario());
        if(:old.prd_qtd_atual <> :new.prd_qtd_atual) then insere_aud_table(systimestamp, 'U', 'PRODUTOS', 'PETSHOP', 'PRD_QTD_ATUAL', :old.prd_qtd_atual, :new.prd_qtd_atual, :new.prd_id, busca_usuario());
        -- o fornecedor e a categoria não serão auditados (verificar se deseja auditar)
    end if;
end;
