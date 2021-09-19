-- COMMENTS -
COMMENT ON TABLE h_cargos IS 'Responsável por armazenar o histórico dos dados referentes aos cargos dos funcionários do Petshop. ';
COMMENT ON TABLE h_categorias IS 'Responsável por armazenar o histórico dos dados referentes às categorias dos produtos comercializados.';
COMMENT ON TABLE h_itens_venda IS 'Responsável por armazenar o histórico dos dados referentes aos itens vendidos.';
COMMENT ON TABLE h_fornecedores IS 'Responsável por armazenar o histórico dos dados referentes aos fornecedores dos produtos comercializados no Petshop.';
COMMENT ON TABLE h_funcionarios IS 'Responsável por armazenar o histórico dos dados referentes a todos os funcionários do Petshop.';
COMMENT ON TABLE h_produtos IS 'Responsável por armazenar o histórico dos dados referentes aos produtos comercializados no Petshop.';
COMMENT ON TABLE h_vendas IS 'Responsável por armazenar o histórico dos dados referentes às vendas realizadas pelo funcionário no Petshop.';

-- Comentários das colunas da tabela H_CARGOS
COMMENT ON COLUMN h_cargos.hcrg_id IS 'Armazenamento do histórico da pk (chave primária) da relação cargos.';
COMMENT ON COLUMN h_cargos.hcrg_nome IS 'Armazenamento do histórico do nome do cargo de um funcionário.';
COMMENT ON COLUMN h_cargos.hcrg_dt_entrada IS 'Armazenamento do histórico da data da alteração dos dados';

-- Comentários das colunas da tabela H_CATEGORIAS
COMMENT ON COLUMN h_categorias.hcat_id IS 'Armazenamento do histórico da pk (chave primária) da relação categorias dos produtos.';
COMMENT ON COLUMN h_categorias.hcat_nome IS 'Armazenamento do histórico do nome da categoria do produto.';
COMMENT ON COLUMN h_categorias.hcat_dt_entrada IS 'Armazenamento do histórico da data da alteração dos dados';

-- Comentários das colunas da tabela H_ITENS_VENDA
COMMENT ON COLUMN h_itens_venda.hitv_vnd_id IS 'Armazenamento do histórico da chave estrangeira da relação dos itens vendidos e as vendas.';
COMMENT ON COLUMN h_itens_venda.hitv_prd_id IS 'Armazenamento do histórico da chave estrangeira da relação dos itens vendidos e os produtos.';
COMMENT ON COLUMN h_itens_venda.hitv_quantidade IS 'Armazenamento do histórico dos dados referente à quantidade de itens vendidos.';
COMMENT ON COLUMN h_itens_venda.hitv_dt_entrada IS 'Armazenamento do histórico da data da alteração dos dados';

-- Comentários das colunas da tabela H_FORNECEDORES
COMMENT ON COLUMN h_fornecedores.hfor_id IS 'Armazenamento do hisórico da pk (chave primária) da relação de fornecedores.';
COMMENT ON COLUMN h_fornecedores.hfor_nome IS 'Armazenamento do histórico dos dados de nome do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_telefone IS 'Armazenamento do histórico dos dados de telefone do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_email IS 'Armazenamento do histórico dos dados  de email do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_estado IS 'Armazenamento do histórico dos dados da sigla do estado do endereço do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_cidade IS 'Armazenamento do histórico dos dados da cidade do endereço do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_bairro IS 'Armazenamento do histórico dos dados do bairro do endereço do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_cep IS 'Armazenamento do histórico dos dados do código de endereçamento postal do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_logradouro IS 'Armazenamento do histórico dos dados do logradouro do endereço do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_numero IS 'Armazenamento do histórico dos dados número do endereço dos fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_complemento IS 'Armazenamento do histórico dos dados de complemento do endereço do fornecedor.';
COMMENT ON COLUMN h_fornecedores.hfor_dt_entrada IS 'Armazenamento do histórico da data da alteração dos dados';

-- Comentários das colunas da tabela H_FUNCIONARIOS
COMMENT ON COLUMN h_funcionarios.hfun_id IS 'Armazenamento do histórico da pk (chave primária) da relação funcionários.';
COMMENT ON COLUMN h_funcionarios.hfun_matricula IS 'Armazenamento do histórico dos dados da matrícula dosfuncionário.';
COMMENT ON COLUMN h_funcionarios.hfun_primeiro_nome IS 'Armazenamento do histórico dos dados referente ao primeiro nome do funcionário.';
COMMENT ON COLUMN h_funcionarios.hfun_nome_meio IS 'Armazenamento do histórico dos dados referente ao nome do meio do funcionário.';
COMMENT ON COLUMN h_funcionarios.hfun_ultimo_nome IS 'Armazenamento do histórico dos dados referente ao sobrenome do funcionário.';
COMMENT ON COLUMN h_funcionarios.hfun_dt_contratacao IS 'Armazenamento do histórico dos dados referente à data de contratação do funcionário.';
COMMENT ON COLUMN h_funcionarios.hfun_crg_id IS 'Armazenamento do histórico da fk (chave estrangeira) da relação de cargos do funcionário.';
COMMENT ON COLUMN h_funcionarios.hfun_dt_entrada IS 'Armazenamento do histórico da data da alteração dos dados';

-- Comentários das colunas da tabela H_PRODUTOS
COMMENT ON COLUMN h_produtos.hprd_id IS 'Armazenamento do histórico da pk (chave primária) da relação de produtos.';
COMMENT ON COLUMN h_produtos.hprd_nome IS 'Armazenamento  do histórico dos dados referente ao nome do produto.';
COMMENT ON COLUMN h_produtos.hprd_preco IS 'Armazenamento do histórico dos dados referente ao preço do produto.';
COMMENT ON COLUMN h_produtos.hprd_qtd_minima IS 'Armazenamento do histórico dos dados referente à quantidade mínima do produto no estoque.';
COMMENT ON COLUMN h_produtos.hprd_qtd_atual IS 'Armazenamento do histórico dos dados referente à quantidade  atual do produto no estoque.';
COMMENT ON COLUMN h_produtos.hprd_for_id IS 'Armazenamento do histórico da fk (chave estrangeira) da relação de fornecedores do produto.';
COMMENT ON COLUMN h_produtos.hprd_cat_id IS 'Armazenamento do historico da da fk (chave estrangeira) da relação de categorias do produto.';
COMMENT ON COLUMN h_produtos.hprd_dt_entrada IS 'Armazenamento do histórico da data da alteração dos dados';

-- Comentários das colunas da tabela H_VENDAS
COMMENT ON COLUMN h_vendas.hvnd_id IS 'Armazenamento do histórico da chave primária da relação vendas.';
COMMENT ON COLUMN h_vendas.hvnd_doc_cliente IS 'Armazenamento do histórico dos dados do documento do cliente (cpf ou cnpj).';
COMMENT ON COLUMN h_vendas.hvnd_valor_total IS 'Armazenamento do histórico do valor total da venda realizada.';
COMMENT ON COLUMN h_vendas.hvnd_dt_hr IS 'Armazenamento do histórico dos dados da data e hora da venda realizada.';
COMMENT ON COLUMN h_vendas.hvnd_fun_id IS 'Armazenamento do histórico da fk (chave estrangeira) da relação funcionarios.';
COMMENT ON COLUMN h_vendas.hvnd_dt_entrada IS 'Armazenamento do histórico da data da alteração dos dados';
