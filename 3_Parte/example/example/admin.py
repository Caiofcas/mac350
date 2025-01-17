from django.contrib import admin
from .models import Usuario, Perfil, Exame, Servico, Pessoa, Paciente, Usuario_Possui_Perfil, Pertence, Tutelamento, Servico_com_exame

class PerfilInline(admin.TabularInline):
    model = Usuario_Possui_Perfil
    extra = 1

class ExameInline(admin.StackedInline):
    model = Servico_com_exame
    extra = 1

class ServicoAdmin(admin.ModelAdmin):
    inlines = (ExameInline,)
class ServicoInline(admin.TabularInline):
    model = Pertence
    extra = 1
class TutelamentoInline(admin.StackedInline):
    model = Tutelamento
    extra = 1
    fk_name = "id_usuario_tutelado"
class UsuarioAdmin(admin.ModelAdmin):
    list_display=('get_person_name', 'login', 'instituicao')
    inlines = (PerfilInline, TutelamentoInline)

class PerfilAdmin(admin.ModelAdmin):
    inlines = (ServicoInline,)

admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Perfil, PerfilAdmin)
admin.site.register(Exame)
admin.site.register(Servico, ServicoAdmin)
admin.site.register(Pessoa)
admin.site.register(Paciente)
