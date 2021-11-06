-- Proc para inserção na Tabela Stage v2
-- Procedure pra popular a stage
 -- drop procedure proc_stage;
  create procedure proc_stage as
    begin
        -- truncate table stage_table;
        delete from stage_table; -- preferencialmente usar o truncate se o oracleXE deixar
        insert into stage_table
        
        select prd_nome as PRODUTO, prd_preco as PRECO_PRODUTO, itv_quantidade as QTD_VENDIDA, cat_nome as CATEGORIA_PRD, fun_primeiro_nome || ' ' || fun_ultimo_nome as FUNCIONARIO, for_estado as ORIGEM_FORNECEDOR, 
    
     -- decode(coluna, valor 1, retorno 1, valor 2, retorno 2...default)   
        decode ( length(vend1.vnd_doc_cliente), 11, 'CPF', 'CNPJ') as TIPO_CLIENTE,

        vnd_valor_total as VALOR_TOTAL,
        
        (case
            when to_char(vend1.vnd_dt_hr, 'HH24') < 12 then 'MANHÃ'
            else 'TARDE'
            end
            ) as PERIODO_VENDA,
           
        (case
            when to_char(vnd_dt_hr, 'mm') in (1,2,3) then 1
            when to_char(vnd_dt_hr, 'mm') in (4,5,6) then 2
            when to_char(vnd_dt_hr, 'mm') in (7,8,9) then 3
            when to_char(vnd_dt_hr, 'mm') in (10,11,12) then 4
            end 
            ) as TRIMESTRE,
            to_char(vnd_dt_hr, 'DAY') as DIA_SEMANA
            
        
    from
        itens_venda
        left  join produtos prod1 on(prod1.prd_id = itv_prd_id)
        left  join vendas vend1 on(vend1.vnd_id = itv_vnd_id)
        left  join funcionarios func1 on(vend1.vnd_fun_id = func1.fun_id)
        left  join fornecedores for1 on(for1.for_id = prod1.prd_for_id)
        left  join categorias cat1 on(prod1.prd_cat_id = cat1.cat_id)
    end;


         
-- rotina Tabela Stage
-- execute proc_stage();