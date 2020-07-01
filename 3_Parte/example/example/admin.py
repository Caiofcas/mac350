from django.contrib import admin
from .models import Usuario, Perfil, Exame, Servico, Pessoa, Paciente

class UsuarioAdmin(admin.ModelAdmin):
    list_display=('get_person_name', 'login', 'instituicao')

admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Perfil)
admin.site.register(Exame)
admin.site.register(Servico)
admin.site.register(Pessoa)
admin.site.register(Paciente)
