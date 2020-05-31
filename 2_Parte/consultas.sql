-- Lista todos exames realizados, com seus respectivos tipos, bem como os seus usuários com suas
-- respectivas datas de solitação e execução

SELECT e.tipo, rea.data_de_realizacao, u.nome, reg.data_de_solicitacao
FROM exame as e, realiza as rea, registro as reg, usuario as u
WHERE e.id_exame = rea.id_exame AND reg.id_exame = e.id_exame

-- Liste os 5 exames realizados com maior eficiencia (isto é, menor diferença de tempo entre 
-- data de realização e data de solicitação)

