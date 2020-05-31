-- Lista todos exames realizados, com seus respectivos tipos, bem como os seus usuários com suas
-- respectivas datas de solitação e execução

SELECT e.tipo, reg.data_de_solicitacao, rea.data_de_realizacao, u.nome
FROM exame as e, realiza as rea, registro as reg, usuario as u
WHERE e.id_exame = rea.id_exame AND e.id_exame = reg.id_exame

-- Liste os 5 exames realizados com maior eficiencia (isto é, menor diferença de tempo entre 
-- data de realização e data de solicitação)

-- Liste os servições que podem ser realizados pelos usuários

SELECT usuario.nome, servico.classe
FROM 
    usuario
    perfil,
	possui,
	pertence,
    servico
WHERE
    usuario.id_usuario = possui.id_usuario AND
	possui.id_perfil = perfil.id_perfil AND
	perfil.id_perfil = pertence.id_perfil AND
	pertence.id_servico = servico.id_servico

