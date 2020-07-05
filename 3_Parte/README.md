# Parte 3

## Membros:

**Caio Andrade - 9797232**
**Caio Fontes - 10692061**

## Usando virtualEnv

Para reduzir o tamanho do pacote, não gitamos a pasta de ENV
do virtualenv. Mas se quiser instalar as dependencias do projeto,
rode `pip install -r requirements.txt`


## Gerando as Tabelas no Postgres

Tivemos alguns problemas integrando o django com o sql já existente no postgresql, portanto decidimos seguir o princípio DRY (Don't Repeat Yourself) recomendado pela documentação do Djando e utilizamos o arquivo `models.py` como fonte primária do modelo de dados.

Para gerar as tabelas no postgres a partir do 0, basta ir até a pasta *example* e rodar `python manage.py makemigrations` e `python manage.py migrate`.

O arquivo `fisico.sql` contém a versão atual das tabels presentes no ambiente postgresql.

O histórico das alterações está em *example/example/migrations*. Para ver o sql gerado por todas elas basta executar:

```{python}
python manage.py sql migrate example 0001
python manage.py sql migrate example 0002
python manage.py sql migrate example 0003
```

Dentro da pasta *examples*.
