-- Comentários da Tabela Stage v2

COMMENT ON TABLE stage_table IS 'Responsável por armazenar os dados temporários referente aos campos que serão enviados para processamento externo que dão suporte à análise de negócios.';

-- Comentários das colunas da tabela stage_table
COMMENT ON COLUMN stage_table.stg_prd_id IS 'Armazenamento do dado referente à chave primária do produto vendido.';
COMMENT ON COLUMN stage_table.stg_prd_nome IS 'Armazenamento do dado referente ao nome do produto vendido.';
COMMENT ON COLUMN stage_table.stg_prd_preco IS 'Armazenamento do dado referente ao preço unitário do produto vendido.';
COMMENT ON COLUMN stage_table.stg_prd_qtd_vendida IS 'Armazenamento do dado referente ao total de itens vendidos neste pedido';
COMMENT ON COLUMN stage_table.stg_prd_categoria IS 'Armazenamento do dado referente à categoria do produto vendido';

COMMENT ON COLUMN stage_table.stg_fun_nome IS 'Armazenamento do dado referente nome do funcionário que realizou a venda';
COMMENT ON COLUMN stage_table.stg_for_uf_origem IS 'Armazenamento do dado referente ao estado (UF) de origem do fornecedor do produto vendido.';
COMMENT ON COLUMN stage_table.stg_tipo_cliente IS 'Armazenamento do dado referente ao tipo de cliente que efetuou a compra do produto (CPF ou CNPJ)';

COMMENT ON COLUMN stage_table.stg_vnd_total IS 'Armazenamento do dado ao valor total da venda na qual este produto foi vendido.';
COMMENT ON COLUMN stage_table.stg_vnd_periodo IS 'Armazenamento do dado referente ao período do dia em que a venda foi realizada (MANHÃ ou TARDE)';
COMMENT ON COLUMN stage_table.stg_vnd_trimestre IS 'Armazenamento do dado referente ao trimestre em que a venda foi realizada';
COMMENT ON COLUMN stage_table.stg_vnd_dia_semana IS 'Armazenamento do dado referente ao dia da semana que a venda foi realizada';

