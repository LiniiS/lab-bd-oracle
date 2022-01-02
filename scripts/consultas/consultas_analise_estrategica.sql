-- Consultas 
/*
	Consulta 1: Retorna a quantia vendida por todos os funcionários nos últimos 12 meses, ordenados pelo nome

	Observação: A PetShop é um comércio e, portanto, obtém receita através de suas vendas. 
				É comum para esses estabelecimentos que se operarem sob um sistema de metas em vendas, 
				ou que utilizem mecanismos de incentivo de vendas, como quadro de funcionário do mês, bônus em salário, 
				entre outros. Essa análise permite ao gestor do negócio uma observação simplificada do desempenho, 
				em vendas, de seus funcionários.


*/
SELECT
        fun_primeiro_nome || ' ' || fun_ultimo_nome AS funcionario,
        SUM(vnd_valor_total) AS soma
    FROM
        vendas
        join funcionarios ON (VENDAS.vnd_fun_id = FUNCIONARIOS.fun_id)
    WHERE
        VENDAS.vnd_dt_hr BETWEEN (sysdate -30) AND (sysdate)
    GROUP BY
        fun_primeiro_nome, fun_ultimo_nome
    ORDER BY
        fun_primeiro_nome, fun_ultimo_nome
     

/* 
	Consulta 02: Retorna o nome “top” vendedor dos últimos 30 dias

	Observação: Em outra situação, pode ser significante na consulta que seja retornado apenas o nome do funcionário que mais vendeu, em R$. 
				Por exemplo, em nossa PetShop, estabelecemos uma “corrida de vendas”, o funcionário que mais vende é premiado ao final da corrida. 
				Nessa situação, ao final da corrida ou durante sua vigência, a exibição somente do nome do funcionário vencedor, ou que lidera a corrida, 
				é importante para manter a harmonia entre os funcionários participantes.

*/
SELECT
    fun_primeiro_nome || ' ' || fun_ultimo_nome AS Funcionario
FROM
    funcionarios
    join vendas ON (FUNCIONARIOS.fun_id = VENDAS.vnd_fun_id)
WHERE
    VENDAS.vnd_dt_hr BETWEEN (sysdate -30) AND (sysdate)
GROUP BY
    fun_primeiro_nome, fun_ultimo_nome
HAVING
    SUM(vnd_valor_total) = (
        SELECT
            MAX(SUM(vnd_valor_total))
        FROM
            vendas
            join funcionarios ON (VENDAS.vnd_fun_id = FUNCIONARIOS.fun_id)
        WHERE
            VENDAS.vnd_dt_hr BETWEEN (sysdate -30) AND (sysdate)
        GROUP BY
            fun_primeiro_nome, fun_ultimo_nome
);

/*
	Consulta 03: Apresenta o nome do “Top Vendedor” nos últimos 12 meses.
*/

SELECT
    fun_primeiro_nome || ' ' || fun_ultimo_nome AS Funcionario
FROM
    funcionarios
    join vendas ON (FUNCIONARIOS.fun_id = VENDAS.vnd_fun_id)
WHERE
    VENDAS.vnd_dt_hr BETWEEN (add_months (sysdate,-12)) AND (sysdate)
GROUP BY
    fun_primeiro_nome, fun_ultimo_nome
HAVING
    SUM(vnd_valor_total) = (
        SELECT
            MAX(SUM(vnd_valor_total))
        FROM
            vendas
            join funcionarios ON (VENDAS.vnd_fun_id = FUNCIONARIOS.fun_id)
        WHERE
            VENDAS.vnd_dt_hr BETWEEN (add_months (sysdate,-12)) AND (sysdate)
        GROUP BY
            fun_primeiro_nome, fun_ultimo_nome
);

/*
	Consulta 04: Para todos os produtos vendidos, quanto foi vendido nos últimos 30 dias

	Observação: Em qualquer negócio, conhecer os produtos que possuem maiores vendas é muito importante, seja para o ajuste no estoque ou para promoção dos itens. 
				Em nossa PetShop não possuímos estoque, mas uma quantidade mínima de cada produto. Para o gestor, conhecer os itens mais vendidos dentro de nosso estabelecimento
 				permite que seja traçado um plano efetivo de compra e entrega dos produtos, assim, nunca faltarão nas prateleiras.
*/
SELECT
    prd_nome as Produto,
    SUM(itv_quantidade) as Quantidade_Vendida
FROM
    itens_venda
    JOIN produtos ON (ITENS_VENDA.itv_prd_id = PRODUTOS.prd_id)
    JOIN vendas ON (ITENS_VENDA.itv_vnd_id = VENDAS.vnd_id)
WHERE
    VENDAS.vnd_dt_hr BETWEEN (sysdate - 30) AND (sysdate)
GROUP BY
    prd_nome, prd_id
ORDER BY
   sum(itv_quantidade) desc;

/*
	Consulta 05: Representação em % da nova quantidade em "estoque" em relação ao estoque mínimo.

	Observação: A consulta permite ao gestor traçar um plano de compra e entrega de um ou mais produtos. 
				Para auxiliar essa consulta, descrevemos a quantidade do estoque dos produtos e sua relação percentual com o estoque mínimo necessário, após a venda. 
				Quando um produto é vendido e retirado da prateleira o estoque desse produto diminui; com esta consulta, o gestor pode analisar a relação da nova 
				quantidade de estoque do produto em relação ao estoque mínimo necessário em loja.

*/
SELECT
    prd_id,
    prd_nome,
    SUM(itv_quantidade) AS "QUANTIDADE VENDIDA",
    AVG(prd_qtd_atual) AS "QUANTIDADE ANTERIOR DE ESTOQUE",
    (AVG(prd_qtd_atual) - SUM(itv_quantidade)) AS "NOVA QUANTIDADE EM ESTOQUE",
    AVG(prd_qtd_minima) AS "ESTOQUE MINIMO",
    TO_CHAR((((AVG(prd_qtd_atual)-SUM(itv_quantidade))/AVG(prd_qtd_minima))*100), '999,000.00') AS "REPRESENTAÇÃO EM %"
FROM
    itens_venda
    JOIN produtos ON (ITENS_VENDA.itv_prd_id = PRODUTOS.prd_id)
    JOIN vendas ON (ITENS_VENDA.itv_vnd_id = VENDAS.vnd_id)
WHERE
    VENDAS.vnd_dt_hr BETWEEN (sysdate - 30) AND (sysdate)
GROUP BY
    prd_nome, prd_id
ORDER BY
     SUM(itv_quantidade) desc;

/*
	Consulta 06: Retorna as categorias com o seu valor em estoque, 
				 considerando a quantidade mínima necessária manter na Loja PetShop e a origem dos seus fornecedores.

	Observação: A PetShop não possui estoque, mantém uma quantidade mínima de produtos e saber a origem do fornecedor dos produtos de maior valor
				ajuda a entender se o produto de determinada categoria de maior valor pode ser trocado por de um fornecedor mais próximo, junto à essa análise 
				deve-se observar se os produtos desse fornecedor são os que mais vendem. O alto valor em estoque ajuda a entender se está sendo repassado ao 
				cliente para compensar os custos com o fornecedor ou se representa maior margem de lucro.
*/
SELECT
    COUNT(for_id) AS qtd_fornecedores,
    for_estado AS estado,
    cat_nome AS categoria,
    LPAD (TO_CHAR(SUM(prd_preco * prd_qtd_minima), '$999999.00'),15, ' ')  AS valor_estoque
    
FROM
    produtos p LEFT JOIN fornecedores f ON (p.prd_for_id = f.for_id)
    LEFT JOIN categorias c ON(c.cat_id = p.prd_cat_id)
GROUP BY
    for_estado, cat_nome
ORDER BY
    SUM(prd_preco * prd_qtd_minima) DESC;

/*
	Consulta 07: Apresenta o ticket médio das vendas.
	
	Observação: O indicador do ticket médio ajuda a compreender o faturamento das vendas pois representa a, em média, a quantia em espécie de cada compra realizada
				e permite entender o comportamento do mercado (sazonalidades) com relação ao segmento da loja.

	PS: esse indicador geralmente é utilizado para análises históricas e o período de análise depende do segmento da loja. 
		A PetShop é um comércio recente e ainda está buscando compreender o melhor período para análise.

*/
SELECT
    to_char(AVG(vnd_valor_total), '$99999.00') as ticket_medio_mensal
FROM
    vendas
WHERE
    VENDAS.vnd_dt_hr BETWEEN (sysdate -30) AND (sysdate) 

/*
	Nota sobre Materialized View
		A materialized view mv_detalhe_venda foi criada pois a Stage Table não possui o ID da venda, portanto não permite associar o valor total da venda na qual 
		o produto da linha está associado a um único pedido de venda, ou seja, cada linha que representa um produto vendido apresenta a coluna “valor total do pedido de venda” 
		ao qual ele está associado, gerando assim inconsistência no cálculo do valor de venda. 

	PS: adicionar uma coluna que identifica unicamente a venda como número de NF ou Número do Pedido (controle interno do PetShop) poderia ajudar nessa consulta
		permitindo o uso da Stage sem a inclusão do id da venda.

	Consulta 08: Ticket médio anual: consulta anterior realizada com e sem a view: 
*/
-- sem mw
SELECT
   to_char(AVG(vnd_valor_total), '$99999.00') as ticket_medio_anual
FROM
    vendas
WHERE
    VENDAS.vnd_dt_hr BETWEEN (add_months (sysdate, -12)) AND (sysdate)

-- com mw
SELECT  TO_CHAR(AVG(valor_total),'$99999.00')  AS ticket_medio_anual
FROM
    (SELECT DISTINCT 
        identificacao_vnd,
        valor_total
    FROM vw_detalhe_venda   
    );

/* 
	Consulta 09: Apresenta o ticket médio das vendas por trimestre 
*/

SELECT
    trimestre AS trimester,
    to_char(avg(valor_total),'$99999.00')  AS ticket_medio   
FROM
    (SELECT DISTINCT 
        identificacao_vnd,
        valor_total,
        trimestre
    FROM vw_detalhe_venda   
    )
GROUP BY trimestre;

/*
	Consulta 10: Análise do Volume de Vendas (R$) e o tipo do cliente.

	Observação: analisar o tipo do cliente que a Petshop possui ajuda a conhecer o perfil de cliente que frequenta a loja e alinhar estratégias de venda e
			    avaliar a escalabilidade do estoque, clientes CNPJ tendem a comprar em grandes quantidades.
	

*/
SELECT DISTINCT 
        identificacao_vnd AS venda,
        TO_CHAR((valor_total), '$99999.00') AS total,
        tipo_cliente AS cliente
    FROM vw_detalhe_venda
ORDER BY identificacao_vnd;

/*
	Consulta 11: Análise de Variação do volume de vendas (trimestre) (projeções futuras de vendas, custos etc.).

	Observação: a análise da variação do volume de vendas por trimestre faz parte do conjunto de análises que buscam compreender o comportamento do mercado.
*/
SELECT
    trimestre AS trimestre,
    COUNT(identificacao_vnd) AS volume_vendas
FROM
   ( SELECT DISTINCT identificacao_vnd, trimestre FROM vw_detalhe_venda)
GROUP BY
    trimestre
ORDER BY 
    trimestre

/*
	Consulta 12: Análise de Variação do volume de produtos vendidos (trimestre) (projeções futuras de vendas, custos etc.).
	
	Observçaão: A análise de volume de vendas em função dos produtos faz parte do conjunto de análises de suporte em busca de entender
				 o como o mercado está perante o segmento da Petshop.

*/
SELECT
    trimestre AS trimestre,
    SUM(qtd_vendida) AS quantidade_produtos
FROM
    vw_detalhe_venda
GROUP BY
    trimestre
ORDER BY 
    trimestre

/*
	Consulta 13: Análise de volume de vendas por período (manhã ou tarde).
		
	Observação: Analisar se o período do dia apresenta afeta as vendas ajuda a compreender o comportamento do mercado 
				e traçar estratégias caso a loja necessite ampliar seu horário de atendimento ou alterar o horário para acompanhar a tendência dos clientes.

*/
SELECT
    periodo_venda AS periodo,
    COUNT(identificacao_vnd) AS volume_venda
FROM
    ( SELECT DISTINCT identificacao_vnd, periodo_venda FROM vw_detalhe_venda)
GROUP BY periodo_venda

/*
	Consulta 14: Apresenta o volume de vendas (R$) dos vendedores durante todo o período englobando todas as vendas.

	Observação: A loja do PetShop está há pouco tempo no mercado e com a análise de vendas por funcionários busca-se 
	construir um histórico acerca das habilidades dos vendedores visando encontrar pontos de melhorias ou apenas de compreensão em baixos e altos volumes de vendas.

*/
 SELECT
    funcionario,
    SUM (valor_total) as TOTAL_P
FROM (
    SELECT DISTINCT
        identificacao_vnd,
        valor_total,
        funcionario
    FROM
        vw_detalhe_venda
)
GROUP BY
    funcionario;

