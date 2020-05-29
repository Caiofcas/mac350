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
values (
	11111,
	'PCR',
	'SARS-CoV-2019'
);

--Relacionamentos

--Agregados
