--Listar todos os produtos em estoque
SELECT produto_id, nome, descricao, preco, estoque
FROM Produtos
WHERE estoque > 0;

--Listar os pedidos de um cliente específico
SELECT pedido_id, data_pedido, status
FROM Pedidos
WHERE cliente_id = 123; -- Substitua 123 pelo ID do cliente desejado

--Calcular o valor total de um pedido com base nos itens do pedido
SELECT pedido_id, SUM(quantidade * preco_unitario) AS valor_total
FROM Itens_do_Pedido
WHERE pedido_id = 456; -- Substitua 456 pelo ID do pedido desejado
GROUP BY pedido_id;

--Encontrar os produtos com avaliação média superior a 4
SELECT P.produto_id, P.nome, AVG(A.classificacao) AS avaliacao_media
FROM Produtos AS P
LEFT JOIN Avaliacoes_de_Produtos AS A ON P.produto_id = A.produto_id
GROUP BY P.produto_id, P.nome
HAVING avaliacao_media > 4;

--Encontrar os cinco produtos mais caros em estoque
SELECT produto_id, nome, descricao, preco, estoque
FROM Produtos
ORDER BY preco DESC
LIMIT 5;
