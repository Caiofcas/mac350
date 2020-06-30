from django.contrib import admin
from .models import Usuario, Perfil, Possui, Exame, Servico

class PerfilInline(admin.TabularInline):
    model = Possui
    extra = 1

class UsuarioAdmin(admin.ModelAdmin):
    inlines = (PerfilInline,)

admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Perfil)
admin.site.register(Exame)
admin.site.register(Servico)
#admin.site.register(Usuario_Possui_Perfil)
