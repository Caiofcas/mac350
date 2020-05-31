-- Lista todos exames realizados, com seus respectivos tipos, bem como os seus usuários com suas
-- respectivas datas de solitação e execução

SELECT e.tipo, reg.data_de_solicitacao, rea.data_de_realizacao, r2.id_usuario 
FROM exame as e, realiza as rea, registro as r2, 
WHERE e.id_exame = rea.id_exame AND e.id_exame = reg.id_exame

-- Liste os 5 exames realizados com maior eficiencia (isto é, menor diferença de tempo entre 
-- data de realização e data de solicitação)

