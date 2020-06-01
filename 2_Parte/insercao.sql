--Classes Simples

insert into usuario
values (1,
		'11133355579',
		'primeiro usuario',
		'area de pesquisa 1',
		'IME USP',
		to_date('2017 06 15', 'YYYY MM DD'),
		'login1',
		'senha123'
	   );

insert into perfil
values (
	11,
	'codigo',
	'pesquisador'
);

insert into servico
values (
	111,
	'sudo rm -rf /',
	'remoção'
);

insert into paciente
values (
	1111,
	'11122211122',
	'João da Silva',
	'Rua Limoeiro 12',
	to_date('2000 02 11', 'YYYY MM DD')
);

insert into exame
values 
	(
		11111,
		'PCR',
		'SARS-CoV-2019'
	),
	(
		11112,
		'anticorpos',
		'SARS-CoV-2019'
	),
	(
		11113,
		'PCR',
		'H1N1'
	),
	(
		11114,
		'anticorpos',
		'H5N1'
	),
	(
		11115,
		'PCR',
		'HIV'
	),
	(
		11116,
		'anticorpos',
		'H1N1'
	);

--Relacionamentos

insert into possui
values (
	1,
	11
);

insert into pertence
values (
	111,
	11
);

insert into gerencia
values (
	111,
	11111
);

insert into tutelamento
values (
	2,
	1,
	111,
	11,
	to_date('2015 02 11', 'YYYY MM DD'),
	to_date('2018 02 11', 'YYYY MM DD')
);

insert into realiza
values 
(
	1111,
	11111,
	'abcde11',
	to_date('2020 02 11', 'YYYY MM DD')
),
(
	1111,
	11112,
	'abcde12',
	to_date('2020 05 31', 'YYYY MM DD')
),
(
	1111,
	11113,
	'abcde13',
	to_date('2020 05 30', 'YYYY MM DD')
),
(	1111,
	11114,
	'abcde14',
	to_date('2020 05 29', 'YYYY MM DD')
),
(	1111,
	11115,
	'abcde15',
	to_date('2020 05 28', 'YYYY MM DD')
),
(
	1111,
	11116,
	'abcde16',
	to_date('2020 05 27', 'YYYY MM DD')
);

--Agregados

insert into amostra
values (
	1111,
	11111,
	'abcde11',
	'oral',
	'saliva'
);

-- Registros

insert into registro -- (TODO - Andrade): Fazer essa inserção
-- quando o tipo da coluna "data_de_solicitacao" for alterado de
-- "date" para "TIMESTAMP
values 
(
	1,
	111,
	11111,
	to_date('2020 02 10', 'YYYY MM DD')
),
(
	1,
	111,
	11112,
	to_date('2020 05 30', 'YYYY MM DD')
),
(
	1,
	111,
	11113,
	to_date('2020 05 29', 'YYYY MM DD')
),
(
	1,
	111,
	11114,
	to_date('2020 05 28', 'YYYY MM DD')
),
(
	1,
	111,
	11115,
	to_date('2020 05 27', 'YYYY MM DD')
),
(
	1,
	111,
	11116,
	to_date('2020 05 20', 'YYYY MM DD')
);