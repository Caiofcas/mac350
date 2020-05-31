-- Lista todos exames realizados, com seus respectivos tipos, bem como os seus usuários com suas
-- respectivas datas de solitação e execução

SELECT e.tipo, r2.data_de_solicitacao, r1.data_de_realizacao, u.nome FROM ( 
	(exame as e join realiza as r1 on e.id_exame = r1.id_exame) 
	join 
	registro as r2 on e.id_exame = r2.id_exame
	join
	usuario as u on u.id_usuario = r2.id_usuario
)

-- ou 

SELECT e.tipo, r2.data_de_solicitacao, r1.data_de_realizacao, r2.id_usuario 
FROM exame as e, realiza as r1, registro as r2, 
WHERE e.id_exame = r1.id_exame AND e.id_exame = r2.id_exame

-- Liste os 5 exames realizados com maior eficiencia (isto é, menor diferença de tempo entre 
-- data de realização e data de solicitação)

