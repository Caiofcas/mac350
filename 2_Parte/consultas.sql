-- 4.1) Lista todos exames realizados, com seus respectivos tipos, bem como os seus pacientes com suas
-- respectivas datas de solitação e execução

SELECT e.tipo, rea.data_de_solicitacao, rea.data_de_realizacao, p.nome
FROM exame as e, realiza as rea, paciente as p
WHERE 
	e.id_exame = rea.id_exame AND 
	rea.id_paciente = p.id_paciente AND
	rea.data_de_realizacao IS NOT NULL

-- 4.2) Liste os 5 exames realizados com maior eficiencia (isto é, menor diferença de tempo entre 
-- data de realização e data de solicitação)

SELECT rea.id_exame, rea.data_de_realizacao, rea.data_de_solicitacao
FROM realiza as rea
WHERE rea.data_de_realizacao IS NOT NULL
ORDER BY rea.data_de_realizacao - rea.data_de_solicitacao
LIMIT 5;

-- 4.3) Liste os serviços que podem ser realizados pelos usuários

SELECT usuario.nome, servico.classe, servico.nome
FROM 
    usuario,
    perfil,
	possui,
	pertence,
    servico
WHERE
    usuario.id_usuario = possui.id_usuario AND
	possui.id_perfil = perfil.id_perfil AND
	perfil.id_perfil = pertence.id_perfil AND
	pertence.id_servico = servico.id_servico

-- 4.4) Liste os serviços que podem ser utilizados por usuários tutelados (dependentes)

SELECT usuario.nome, servico.nome, servico.classe
FROM usuario, tutelamento, servico
WHERE 
	usuario.id_usuario = tutelamento.id_usuario_tutelado AND
	tutelamento.id_servico = servico.id_servico

-- 4.5) Liste em ordem crescente o total de serviços utilizados agrupados pelos tipos de
-- serviços disponíveis e pelo perfil dos usuários.
SELECT perfil.tipo, servico.classe, COUNT(servico.classe)
FROM 
    perfil,
	possui,
	pertence,
    servico
WHERE
	perfil.id_perfil = pertence.id_perfil AND
	pertence.id_servico = servico.id_servico
GROUP BY servico.classe,  perfil.tipo