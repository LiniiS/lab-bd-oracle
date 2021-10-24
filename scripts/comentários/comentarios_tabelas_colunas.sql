-- COMMENTS
-- Comentários das Tabelas
COMMENT ON TABLE cargos IS 'Responsável por armazenar dados referentes aos cargos dos funcionários do Petshop. ';
COMMENT ON TABLE categorias IS 'Responsável por armazenar dados referentes às categorias dos produtos comercializados.';
COMMENT ON TABLE itens_venda IS 'Responsável por armazenar dados referentes aos itens vendidos.';
COMMENT ON TABLE fornecedores IS 'Responsável por armazenar dados referentes aos fornecedores dos produtos comercializados no Petshop.';
COMMENT ON TABLE funcionarios IS 'Responsável por armazenar dados referentes a todos os funcionários do Petshop.';
COMMENT ON TABLE produtos IS 'Responsável por armazenar dados referentes aos produtos comercializados no Petshop.';
COMMENT ON TABLE vendas IS 'Responsável por armazenar dados referentes às vendas realizadas pelo funcionário no Petshop.';

-- Comentários das colunas da tabela CARGOS
COMMENT ON COLUMN cargos.crg_id IS 'Armazenamento da pk (chave primária) da relação cargos.';
COMMENT ON COLUMN cargos.crg_nome IS 'Armazenamento do nome do cargo de um funcionário.';


-- Comentários das colunas da tabela CATEGORIAS
COMMENT ON COLUMN categorias.cat_id IS 'Armazenamento da pk (chave primária) da relação categorias dos produtos.';
COMMENT ON COLUMN categorias.cat_nome IS 'Armazenamento do nome da categoria do produto.';


-- Comentários das colunas da tabela ITENS_VENDA
COMMENT ON COLUMN itens_venda.itv_prd_id IS 'Armazenamento da chave estrangeira da relação dos itens vendidos e os produtos.';
COMMENT ON COLUMN itens_venda.itv_vnd_id IS 'Armazenamento da chave estrangeira da relação dos itens vendidos e as vendas.';
COMMENT ON COLUMN itens_venda.itv_quantidade IS 'Armazenamento do dado referente à quantidade de itens vendidos.';

-- Comentários das colunas da tabela FORNECEDORES
COMMENT ON COLUMN fornecedores.for_id IS 'Armazenamento da pk (chave primária) da relação de fornecedores.';
COMMENT ON COLUMN fornecedores.for_nome IS 'Armazenamento do dado de nome do fornecedor.';
COMMENT ON COLUMN fornecedores.for_telefone IS 'Armazenamento do dado de telefone do fornecedor.';
COMMENT ON COLUMN fornecedores.for_email IS 'Armazenamento do dado de email do fornecedor.';
COMMENT ON COLUMN fornecedores.for_estado IS 'Armazenamento do dado da sigla do estado do endereço do fornecedor.';
COMMENT ON COLUMN fornecedores.for_cidade IS 'Armazenamento do dado  da cidade do endereço do fornecedor.';
COMMENT ON COLUMN fornecedores.for_bairro IS 'Armazenamento do dado do bairro do endereço do fornecedor.';
COMMENT ON COLUMN fornecedores.for_cep IS 'Armazenamento do dado do código de endereçamento postal do fornecedor.';
COMMENT ON COLUMN fornecedores.for_logradouro IS 'Armazenamento do dado do logradouro do endereço do fornecedor.';
COMMENT ON COLUMN fornecedores.for_numero IS 'Armazenamento do dado número do endereço dos fornecedor.';
COMMENT ON COLUMN fornecedores.for_complemento IS 'Armazenamento do dado de complemento do endereço do fornecedor.';

-- Comentários das colunas da tabela FUNCIONARIOS
COMMENT ON COLUMN funcionarios.fun_id IS 'Armazenamento da pk (chave primária) da relação funcionários.';
COMMENT ON COLUMN funcionarios.fun_matricula IS 'Armazenamento do dado da matrícula dosfuncionário.';
COMMENT ON COLUMN funcionarios.fun_primeiro_nome IS 'Armazenamento do dado referente ao primeiro nome do funcionário.';
COMMENT ON COLUMN funcionarios.fun_nome_meio IS 'Armazenamento do dado opcional referente ao nome do meio do funcionário.';
COMMENT ON COLUMN funcionarios.fun_ultimo_nome IS 'Armazenamento do dado referente ao sobrenome do funcionário.';
COMMENT ON COLUMN funcionarios.fun_dt_contratacao IS 'Armazenamento do dado referente à data de contratação do funcionário.';
COMMENT ON COLUMN funcionarios.fun_crg_id IS 'Armazenamento da fk (chave estrangeira) da relação de cargos do funcionário.';

-- Comentários das colunas da tabela PRODUTOS
COMMENT ON COLUMN produtos.prd_id IS 'Armazenamento da pk (chave primária) da relação de produtos.';
COMMENT ON COLUMN produtos.prd_nome IS 'Armazenamento  do dado referente ao nome do produto.';
COMMENT ON COLUMN produtos.prd_preco IS 'Armazenamento do dado referente ao preço do produto.';
COMMENT ON COLUMN produtos.prd_qtd_minima IS 'Armazenamento do dado referente à quantidade mínima do produto no estoque.';
COMMENT ON COLUMN produtos.prd_qtd_atual IS 'Armazenamento do dado referente à quantidade  atual do produto no estoque.';
COMMENT ON COLUMN produtos.prd_for_id IS 'Armazenamento da fk (chave estrangeira) da relação de fornecedores do produto.';
COMMENT ON COLUMN produtos.prd_cat_id IS 'Armazenamento da fk (chave estrangeira) da relação de categorias do produto.';

-- Comentários das colunas da tabela VENDAS
COMMENT ON COLUMN vendas.vnd_id IS 'Armazenamento da chave primária da relação vendas.';
COMMENT ON COLUMN vendas.vnd_doc_cliente IS 'Armazenamento do dado do documento do cliente (cpf ou cnpj).';
COMMENT ON COLUMN vendas.vnd_valor_total IS 'Armazenamento do valor total da venda realizada.';
COMMENT ON COLUMN vendas.vnd_dt_hr IS 'Armazenamento do dado da data e hora da venda realizada.';
COMMENT ON COLUMN vendas.vnd_fun_id IS 'Armazenamento da fk (chave estrangeira) da relação funcionarios.';