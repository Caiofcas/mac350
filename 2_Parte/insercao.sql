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
	   ),
	   (2,
		'21133355579',
		'segundo usuario',
		'area de pesquisa 1',
		'IME USP',
		to_date('2017 06 15', 'YYYY MM DD'),
		'login2',
		'senha123'
	   ),
	   (3,
		'31133355579',
		'terceiro usuario',
		'area de pesquisa 2',
		'IME USP',
		to_date('2017 06 15', 'YYYY MM DD'),
		'login3',
		'senha123'
	   ),
	   (4,
		'41133355579',
		'quarto usuario',
		'area de pesquisa 3',
		'IF USP',
		to_date('2017 06 16', 'YYYY MM DD'),
		'login4',
		'senha123'
	   ),
	   (5,
		'51133355579',
		'quinto usuario',
		'area de pesquisa 3',
		'IF USP',
		to_date('2017 06 16', 'YYYY MM DD'),
		'login5',
		'senha123'
	   ),
	   (6,
		'61133355579',
		'sexto usuario',
		'area de pesquisa 3',
		'IQ USP',
		to_date('2017 06 17', 'YYYY MM DD'),
		'login6',
		'senha123'
	   ),
	   (7,
		'71133355579',
		'setimo usuario',
		'area de pesquisa 2',
		'IQ USP',
		to_date('2017 06 17', 'YYYY MM DD'),
		'login7',
		'senha123'
	   ),
	   (8,
		'81133355579',
		'oitavo usuario',
		'area de pesquisa 3',
		'POLI USP',
		to_date('2017 06 20', 'YYYY MM DD'),
		'login8',
		'senha123'
	   ),
	   (9,
		'91133355579',
		'nono usuario',
		'area de pesquisa 4',
		'IME USP',
		to_date('2017 06 21', 'YYYY MM DD'),
		'login9',
		'senha123'
	   ),
	   (10,
		'10133355579',
		'decimo usuario',
		'area de pesquisa 1',
		'IME USP',
		to_date('2017 06 25', 'YYYY MM DD'),
		'login10',
		'senha123'
	   );

insert into perfil
values (11,
		'codigo',
		'pesquisador'
	   ),
	   (12,
		'codigo2',
		'administrador'
	   ),
	   (13,
		'codigoX',
		'desenvolvedor'
	   );

insert into servico
values (111,
		'remove exame',
		'remoção'
	   ),
	   (112,
		'remove amostra',
		'remoção'
	   ),
	   (113,
		'remove usuário',
		'remoção'
	   ),
	   (114,
		'remove paciente',
		'remoção'
	   ),
	   (115,
		'remove servico',
		'remoção'
	   ),
	   (116,
		'remove tutelamento',
		'remoção'
	   ),
	   (211,
		'insere exame',
		'inserção'
	   ),
	   (212,
		'insere amostra',
		'inserção'
	   ),
	   (213,
		'insere usuário',
		'inserção'
	   ),
	   (214,
		'insere paciente',
		'inserção'
	   ),
	   (215,
		'insere servico',
		'inserção'
	   ),
	   (216,
		'insere tutelamento',
		'inserção'
	   ),
	   (311,
		'consulta exame',
		'visualização'
	   ),
	   (312,
		'consulta amostra',
		'visualização'
	   ),
	   (313,
		'consulta usuário',
		'visualização'
	   ),
	   (314,
		'consulta paciente',
		'visualização'
	   ),
	   (315,
		'consulta servico',
		'visualização'
	   ),
	   (316,
		'consulta tutelamento',
		'visualização'
	   ),
	   (411,
		'altera exame',
		'alteração'
	   ),
	   (412,
		'altera amostra',
		'alteração'
	   ),
	   (413,
		'altera usuário',
		'alteração'
	   ),
	   (414,
		'altera paciente',
		'alteração'
	   ),
	   (415,
		'altera servico',
		'alteração'
	   ),
	   (416,
		'altera tutelamento',
		'alteração'
	   ),
	   (511,
	    'solicita exame',
		'solicitação'
	   );

insert into paciente
values (
		1111,
		'11122211122',
		'João da Silva',
		'Rua Limoeiro 12',
		to_date('1950 01 01', 'YYYY MM DD')
	   ),
	   (
		2111,
		'21122211122',
		'João da Rocha',
		'Rua Limoeiro 22',
		to_date('2000 03 11', 'YYYY MM DD')
	   ),
	   (
		3111,
		'31122211122',
		'Caio Fontes',
		'Rua Laranjeiras 12',
		to_date('2000 02 10', 'YYYY MM DD')
	   ),
	   (
		4111,
		'41122211122',
		'Caio Andrade',
		'Rua Laranjeiras 200',
		to_date('2000 10 10', 'YYYY MM DD')
	   ),
	   (
		5111,
		'51122211122',
		'Guilherme da Silva',
		'Rua Limoeiro 12',
		to_date('2010 03 07', 'YYYY MM DD')
	   ),
	   (
		6111,
		'61122211122',
		'Bruna Fontes',
		'Rua Laranjeiras 12',
		to_date('1960 03 19', 'YYYY MM DD')
	   ),
	   (
		7111,
		'71122211122',
		'Laura Sousa',
		'Rua Macieira 22',
		to_date('2001 03 04', 'YYYY MM DD')
	   ),
	   (
		8111,
		'81122211122',
		'Julia Moura',
		'Rua Macieira 32',
		to_date('2000 05 11', 'YYYY MM DD')
	   ),
	   (
		9111,
		'91122211122',
		'Julia Silva',
		'Rua Limoeiro 12',
		to_date('1999 05 15', 'YYYY MM DD')
	   ),
	   (
		1011,
		'10122211122',
		'Janaina Castro',
		'Rua Macieira 1112',
		to_date('2002 02 14', 'YYYY MM DD')
	   ),
	   (
		1121,
		'11212211122',
		'Gabriela Sousa',
		'Rua Limoeiro 522',
		to_date('2000 07 14', 'YYYY MM DD')
	   ),
	   (
		1211,
		'33322211122',
		'João Sousa',
		'Rua Limoeiro 522',
		to_date('1990 02 11', 'YYYY MM DD')
	   ),
	   (
		1311,
		'44422211122',
		'Joana Lima',
		'Rua Lima 11112',
		to_date('2000 04 01', 'YYYY MM DD')
	   ),
	   (
		1411,
		'55122211122',
		'Jorge da Silva',
		'Rua Limoeiro 12',
		to_date('2000 02 21', 'YYYY MM DD')
	   );

insert into exame
values (11111,
		'PCR',
		'SARS-CoV-2019'
	   ),
	   (11112,
		'anticorpos',
		'SARS-CoV-2019'
	   ),
	   (11113,
		'PCR',
		'H1N1'
	   ),
	   (11114,
		'anticorpos',
		'H5N1'
	   ),
	   (11115,
		'PCR',
		'HIV'
	   ),
	   (11116,
		'anticorpos',
		'H1N1'
	   );

--Relacionamentos

insert into possui
values (1,12),
	   (2,11),
	   (3,11),
	   (4,11),
	   (5,11),
	   (6,11),
	   (7,12),
	   (8,11),
	   (9,12),
	   (10,13);

insert into pertence
values (111,13),
	   (112,13),
	   (113,13),
	   (114,13),
	   (115,13),
	   (116,13),
	   (211,13),
	   (212,13),
	   (213,13),
	   (214,13),
	   (215,13),
	   (216,13),
	   (311,13),
	   (312,13),
	   (313,13),
	   (314,13),
	   (315,13),
	   (316,13),
	   (411,13),
	   (412,13),
	   (413,13),
	   (414,13),
	   (415,13),
	   (416,13),
	   (111,12),
	   (112,12),
	   (113,12),
	   (114,12),
	   (211,12),
	   (212,12),
	   (213,12),
	   (214,12),
	   (311,12),
	   (312,12),
	   (313,12),
	   (314,12),
	   (411,12),
	   (412,12),
	   (413,12),
	   (414,12),
	   (111,11),
	   (112,11),
	   (211,11),
	   (212,11),
	   (311,11),
	   (312,11),
	   (411,11),
	   (412,11),
	   (511,11),
	   (511,12),
	   (511,13);

insert into gerencia
values (111,11111),
	   (111,11112),
	   (111,11113),
	   (111,11114),
	   (111,11115),
	   (111,11116),
	   (211,11111),
	   (211,11112),
	   (211,11113),
	   (211,11114),
	   (211,11115),
	   (211,11116),
	   (311,11111),
	   (311,11112),
	   (311,11113),
	   (311,11114),
	   (311,11115),
	   (311,11116),
	   (411,11111),
	   (411,11112),
	   (411,11113),
	   (411,11114),
	   (411,11115),
	   (411,11116),
	   (511,11111),
	   (511,11112),
	   (511,11113),
	   (511,11114),
	   (511,11115),
	   (511,11116);

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

insert into registro 
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