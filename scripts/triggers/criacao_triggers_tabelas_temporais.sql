-- Triggers das Tabelas Temporais

create trigger tg_hist_crg 
before update or delete on cargos 
for each row 
begin 
    insert into h_cargos values (:old.crg_id, :old.crg_nome, sysdate); 
end;


create trigger tg_hist_cat 
before update or delete on categorias 
for each row 
begin 
    insert into h_categorias values (:old.cat_id, :old.cat_nome, sysdate); 
end;


create trigger tg_hist_fun 
before update or delete on funcionarios 
for each row 
begin 
    insert into h_funcionarios values (:old.fun_id, :old.fun_matricula, :old.fun_primeiro_nome, :old.fun_nome_meio, :old.fun_ultimo_nome, :old.fun_dt_contratacao, :old.fun_crg_id, sysdate); 
end;

create trigger tg_hist_for 
before update or delete on fornecedores 
for each row 
begin 
    insert into h_fornecedores values (:old.for_id, :old.for_nome, :old.for_telefone, :old.for_email, :old.for_estado, :old.for_cidade, :old.for_bairro, :old.for_cep, :old.for_logradouro, :old.for_numero, :old.for_complemento, sysdate);
end;

create trigger tg_hist_itv 
before update or delete on itens_venda 
for each row 
begin 
    insert into h_itens_venda values (:old.itv_vnd_id, :old.itv_prd_id, :old.itv_quantidade, sysdate); 
end;

create trigger tg_hist_prd 
before update or delete on produtos 
for each row 
begin 
    insert into h_produtos values (:old.prd_id, :old.prd_nome, :old.prd_preco, :old.prd_qtd_minima, :old.prd_qtd_atual, :old.prd_for_id, :old.prd_cat_id, sysdate); 
end;

create trigger tg_hist_vnd
before update or delete on vendas
for each row
begin
    insert into h_vendas values(:old.vnd_id, :old.vnd_doc_cliente, :old.vnd_valor_total, :old.vnd_dt_hr, :old.vnd_fun_id, sysdate);
end;
