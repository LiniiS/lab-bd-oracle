-- Materialized View para consultas de análises com detalhes da venda

--DROP VIEW vw_detalhe_venda;
CREATE VIEW vw_detalhe_venda AS
    SELECT prd_nome AS PRODUTO, prd_preco AS PRECO_PRODUTO, itv_quantidade AS QTD_VENDIDA, cat_nome AS CATEGORIA_PRD, fun_primeiro_nome || ' ' || fun_ultimo_nome AS FUNCIONARIO, for_estado AS ORIGEM_FORNECEDOR, 
        DECODE ( length(vend1.vnd_doc_cliente), 11, 'CPF', 'CNPJ') AS TIPO_CLIENTE,
        vnd_valor_total AS VALOR_TOTAL,
        (CASE
            WHEN to_char(vend1.vnd_dt_hr, 'HH24') < 12 THEN 'MANHÃ'
            ELSE 'TARDE'
            END
            ) AS PERIODO_VENDA,
        (CASE
            WHEN to_char(vnd_dt_hr, 'mm') IN (1,2,3) THEN 1
            WHEN to_char(vnd_dt_hr, 'mm') IN (4,5,6) THEN 2
            WHEN to_char(vnd_dt_hr, 'mm') IN (7,8,9) THEN 3
            WHEN to_char(vnd_dt_hr, 'mm') IN (10,11,12) THEN 4
            END 
            ) AS TRIMESTRE,
            to_char(vnd_dt_hr, 'DAY') AS DIA_SEMANA,
        itv_vnd_id AS IDENTIFICACAO_VND                
    FROM
        itens_venda itv1
        LEFT  JOIN produtos prod1 ON(prod1.prd_id = itv1.itv_prd_id)
        LEFT  JOIN vendas vend1 ON(vend1.vnd_id = itv1.itv_vnd_id)
        LEFT  JOIN funcionarios func1 ON(vend1.vnd_fun_id = func1.fun_id)
        LEFT  JOIN fornecedores for1 ON(for1.for_id = prod1.prd_for_id)
        LEFT  JOIN categorias cat1 ON(prod1.prd_cat_id = cat1.cat_id);
