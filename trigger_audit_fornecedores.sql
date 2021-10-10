-- Trigger para inserção em AUDIT_TABLE após eventos em FORNECEDORES
create trigger tg_for_aud_tab
after INSERT OR UPDATE OR DELETE on FORNECEDORES
for each row
begin
    if inserting then 
        --                  dt_hr    evento     tabela        dono    campo  old   new  identificador  usuario_db
        insere_aud_table(systimestamp, 'I', 'FORNECEDORES', 'PETSHOP', NULL, NULL, NULL, :new.for_id, busca_usuario());
    end if;
    if deleting then
        insere_aud_table(systimestamp, 'D', 'FORNECEDORES', 'PETSHOP', NULL, NULL, NULL, :old.for_id, busca_usuario());
    end if;
    if updating then
        if(:old.for_nome <> :new.for_nome) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_NOME', :old.for_nome, :new.for_nome, :new.for_id, busca_usuario());
        end if;
        if(:old.for_telefone <> :new.for_telefone) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_TELEFONE', :old.for_telefone, :new.for_telefone, :new.for_id, busca_usuario());
        end if;
          if(:old.for_email <> :new.for_email) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_EMAIL', :old.for_email, :new.for_email, :new.for_id, busca_usuario());
        end if;
        if(:old.for_estado <> :new.for_estado) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_ESTADO', :old.for_estado, :new.for_estado, :new.for_id, busca_usuario());
        end if;
        if(:old.for_cidade <> :new.for_cidade) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_CIDADE', :old.for_cidade, :new.for_cidade, :new.for_id, busca_usuario());
        end if;
        if(:old.for_bairro <> :new.for_bairro) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_BAIRRO', :old.for_bairro, :new.for_bairro, :new.for_id, busca_usuario());
        end if;
        if(:old.for_cep <> :new.for_cep) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_CEP', :old.for_cep, :new.for_cep, :new.for_id, busca_usuario());
        end if;
        if(:old.for_logradouro <> :new.for_logradouro) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_LOGRADOURO', :old.for_logradouro, :new.for_logradouro, :new.for_id, busca_usuario());
        end if;
        if(:old.for_numero <> :new.for_numero) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_NUMERO', :old.for_numero, :new.for_numero, :new.for_id, busca_usuario());
        end if;
        if((:old.for_complemento is null and :new.for_complemento is not null) or (:old.for_complemento is not null and :new.for_complemento is null) or (:old.for_complemento <> :new.for_complemento)) then
        insere_aud_table(systimestamp, 'U', 'FORNECEDORES', 'PETSHOP', 'FOR_COMPLEMENTO', :old.for_complemento, :new.for_complemento, :new.for_id, busca_usuario());
        end if;
    end if;
end;
