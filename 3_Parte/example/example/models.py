from django.db import models

# Tabelas simples

class Pessoa(models.Model):
    id_pessoa = models.AutoField(primary_key=True)
    cpf = models.CharField(unique=True, max_length=11)
    nome = models.CharField(max_length=255)
    data_de_nascimento = models.DateField(blank=True, null=True)
    endereco = models.CharField(max_length=255)

    def __str__(self):
        return self.nome

class Usuario(models.Model):
    id_usuario = models.IntegerField(primary_key=True)
    cpf_pessoa = models.OneToOneField('Pessoa', to_field='cpf')
    area_de_pesquisa = models.CharField(max_length=255, blank=True, null=True)
    instituicao = models.CharField(max_length=255, blank=True, null=True)
    login = models.CharField(max_length=255)
    senha = models.CharField(max_length=255)

    # Relação Possui
    possui_perfil = models.ManyToManyField('Perfil')

    # Tutoria
    id_tutor = models.ForeignKey('self', blank=True, null=True)

    def __str__(self):
        return self.login

class Paciente(models.Model):
    id_paciente = models.AutoField(primary_key=True)
    cpf_pessoa = models.OneToOneField('Pessoa', to_field='cpf')

    def __str__(self):
        return str(self.cpf_pessoa)

class Exame(models.Model):
    id_exame = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=255)
    virus = models.CharField(max_length=255)

    def __str__(self):
        return self.tipo + " - " + self.virus

class Perfil(models.Model):
    id_perfil = models.AutoField(primary_key=True)
    codigo = models.CharField(unique=True, max_length=255)
    tipo = models.CharField(max_length=255, blank=True, null=True)

    # Relação Pertence
    servicos_per = models.ManyToManyField('Servico')

    def __str__(self):
        return self.tipo

class Registro(models.Model):

    id_registro = models.AutoField(primary_key=True)
    data_de_realizacao = models.DateTimeField(blank=True, null=True)
    id_usuario = models.ForeignKey('Usuario')
    id_servico = models.ForeignKey('Servico')
    id_exame = models.ForeignKey('Exame')

class Servico(models.Model):
    id_servico = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=255)
    classe = models.CharField(max_length=255)

    # Relação Gerencia
    ger_exames = models.ManyToManyField('Exame')

    def __str__(self):
        return self.nome

# Agregados

class Amostra(models.Model):
    id_paciente = models.ForeignKey('Paciente')
    id_exame = models.ForeignKey('Exame')
    codigo_amostra = models.CharField(max_length=255)
    metodo_de_coleta = models.CharField(max_length=255)
    material = models.CharField(max_length=255)

# Relações

class Realiza(models.Model):

    id_paciente = models.ForeignKey('Paciente')
    id_exame = models.ForeignKey('Exame')
    codigo_amostra = models.CharField(max_length=255, blank=True, null=True)
    data_de_solicitacao = models.DateTimeField(blank=True, null=True)

class Tutelamento(models.Model):

    id_tutor = models.ForeignKey('Usuario')
    id_usuario_tutelado = models.ForeignKey('Usuario')
    id_servico = models.ForeignKey(Servico)
    id_perfil = models.ForeignKey(Perfil)
    data_de_inicio = models.DateField()
    data_de_termino = models.DateField(blank=True, null=True)
