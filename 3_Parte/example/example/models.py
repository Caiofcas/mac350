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
    cpf_pessoa = models.OneToOneField(
        'Pessoa', to_field='cpf', on_delete=models.CASCADE, verbose_name="Pessoa")
    area_de_pesquisa = models.CharField(max_length=255, blank=True, null=True)
    instituicao = models.CharField(max_length=255, blank=True, null=True)
    login = models.CharField(unique=True, max_length=255)
    senha = models.CharField(max_length=255)

    # Relação Possui
    possui_perfil = models.ManyToManyField('Perfil', through='Usuario_Possui_Perfil')

    # Tutoria
    #id_tutor = models.ForeignKey(
    #    'Tutelamento', blank=True, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.get_person_name().nome
    def get_person_name(self):
        return self.cpf_pessoa
    get_person_name.short_description = "Nome"

class Paciente(models.Model):

    id_paciente = models.AutoField(primary_key=True)
    cpf_pessoa = models.OneToOneField(
        'Pessoa', to_field='cpf', on_delete=models.CASCADE, verbose_name="Pessoa")

    def __str__(self):
        return str(self.cpf_pessoa)

class Usuario_Possui_Perfil(models.Model):
    usuario = models.ForeignKey('Usuario', on_delete=models.CASCADE)
    perfil = models.ForeignKey('Perfil', on_delete=models.CASCADE)
    
    class Meta:
        constraints = [
                models.UniqueConstraint(fields=['usuario', 'perfil'], name='unique_usuario_perfil')
                ]



class Exame(models.Model):

    id_exame = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=255)
    virus = models.CharField(max_length=255)

    servico_correspondente = models.ManyToManyField('Servico', through='Servico_com_exame')

    class Meta():
        unique_together = (('tipo', 'virus'),)

    def __str__(self):
        return self.tipo + " - " + self.virus


class Perfil(models.Model):

    id_perfil = models.AutoField(primary_key=True)
    usuario_com_perfil = models.ManyToManyField('Usuario', through='Usuario_Possui_Perfil')
    codigo = models.CharField(unique=True, max_length=255)
    tipo = models.CharField(max_length=255, blank=True, null=True)

    # Relação Pertence
    servicos_per = models.ManyToManyField('Servico', through="Pertence")

    def __str__(self):
        return self.tipo

class Pertence(models.Model):
    perfil = models.ForeignKey('Perfil', on_delete=models.CASCADE)
    servicos = models.ForeignKey('Servico', on_delete=models.CASCADE)
    
    class Meta:
        constraints = [
                models.UniqueConstraint(fields=['perfil', 'servicos'], name='unique_perfil_servicos')
                ]


class Servico(models.Model):
    VIS = 'Visualização'
    INS = 'Inserção'
    ALT = 'Alteração'
    REM = 'Remoção'
    CLASSE_CHOICES = (
        (VIS, 'visualização'),
        (INS, 'inserção'),
        (ALT, 'alteração'),
        (REM, 'remoção'),
    )

    id_servico = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=255)
    classe = models.CharField(max_length=255, choices=CLASSE_CHOICES)
    perfil_com_acesso = models.ManyToManyField("Perfil", through="Pertence")
    # Relação Gerencia
    ger_exames = models.ManyToManyField('Exame', verbose_name="Gerencia exames", through="Servico_com_exame")

    class Meta():
        unique_together = (('nome', 'classe'),)

    def __str__(self):
        return self.nome

class Servico_com_exame(models.Model):
    servico = models.ForeignKey('Servico', on_delete=models.CASCADE)
    exame = models.ForeignKey('Exame', on_delete=models.CASCADE)
    class Meta():
        unique_together = (('servico', 'exame'),)

# Agregados


class Amostra(models.Model):

    codigo_amostra = models.CharField(max_length=255, primary_key=True)
    metodo_de_coleta = models.CharField(max_length=255)
    material = models.CharField(max_length=255)

    id_paciente = models.ForeignKey('Paciente', on_delete=models.SET_NULL, null=True)
    id_exame = models.ForeignKey('Exame', on_delete=models.CASCADE)


# Relações


class Realiza(models.Model):

    id_realiza = models.AutoField(primary_key=True)
    id_paciente = models.ForeignKey('Paciente', on_delete=models.CASCADE)
    id_exame = models.ForeignKey('Exame', on_delete=models.CASCADE)
    codigo_amostra = models.ForeignKey(
        'Amostra', blank=True, null=True, on_delete=models.SET_NULL)
    data_de_solicitacao = models.DateTimeField()
    data_de_realizacao = models.DateTimeField(blank=True, null=True)

    class Meta():
        unique_together = (('id_paciente', 'id_exame', 'data_de_solicitacao'),)


class Registro(models.Model):

    id_registro = models.AutoField(primary_key=True)
    data = models.DateTimeField()
    id_usuario = models.ForeignKey('Usuario', on_delete=models.DO_NOTHING)
    id_servico = models.ForeignKey('Servico', on_delete=models.DO_NOTHING)
    id_exame = models.ForeignKey('Exame', on_delete=models.DO_NOTHING)


class Tutelamento(models.Model):

    id_tutelamento = models.AutoField(primary_key=True)

    id_tutor = models.ForeignKey(
        'Usuario', on_delete=models.CASCADE, related_name='tutor', verbose_name="Tutor")
    id_usuario_tutelado = models.ForeignKey(
        'Usuario', on_delete=models.CASCADE, related_name='tutelado', verbose_name="Tutorado")
    id_servico = models.ForeignKey('Servico', on_delete=models.CASCADE, verbose_name="Serviço disponível ao tutorado")
    id_perfil = models.ForeignKey('Perfil', on_delete=models.CASCADE, verbose_name="Perfil herdado pelo tutorado")
    data_de_inicio = models.DateField()
    data_de_termino = models.DateField(blank=True, null=True)

    class Meta():
        unique_together = ((
            'id_tutor',
            'id_usuario_tutelado',
            'id_servico',
            'id_perfil',
            'data_de_inicio'),)
