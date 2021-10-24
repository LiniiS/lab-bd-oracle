-- Comentários da Tabela Stage v1
COMMENT ON TABLE stage_table IS 'Responsável por armazenar os dados temporários referente aos campos que serão enviados para processamento externo que dão suporte à análise de negócios.';

-- Comentários das colunas da tabela stage_table
COMMENT ON COLUMN stage_table.stg_prd_id IS 'Armazenamento do dado referente à chave primária do produto vendido.';
COMMENT ON COLUMN stage_table.stg_prd_nome IS 'Armazenamento do dado referente ao nome do produto vendido.';
COMMENT ON COLUMN stage_table.stg_prd_preco IS 'Armazenamento do dado referente ao preço unitário do produto vendido.';
COMMENT ON COLUMN stage_table.stg_vnd_id IS 'Armazenamento do dado refrente à chave primária do pedido de venda contendo este produto.';
COMMENT ON COLUMN stage_table.stg_vnd_total IS 'Armazenamento do dado ao valor total da venda na qual este produto foi vendido.';
COMMENT ON COLUMN stage_table.stg_vnd_fun_id IS 'Armazendamento do dado referente à chave estrangeira de vendas referente ao funcionário que realizou o pedido de venda';
COMMENT ON COLUMN stage_table.stg_fun_nome IS 'Armazenamento do dado referente nome do funcionário que realizou a venda';
COMMENT ON COLUMN stage_table.stg_fun_cargo IS 'Armazenamento do dado referente ao cargo do funcionário que realizou a venda.';
COMMENT ON COLUMN stage_table.stg_for_uf_origem IS 'Armazenamento do dado referente ao estado (UF) de origem do fornecedor do produto vendido.';
COMMENT ON COLUMN stage_table.stg_prd_categoria IS 'Armazenamento do dado referente à categoria do produto vendido';
COMMENT ON COLUMN stage_table.stg_tipo_cliente IS 'Armazenamento do dado referente ao tipo de cliente que efetuou a compra do produto (CPF ou CNPJ)';
COMMENT ON COLUMN stage_table.stg_vnd_periodo IS 'Armazenamento do dado referente ao período do dia em que a venda foi realizada (MANHÃ ou TARDE)';
COMMENT ON COLUMN stage_table.stg_vnd_trimestre IS 'Armazenamento do dado referente ao trimestre em que a venda foi realizada';
