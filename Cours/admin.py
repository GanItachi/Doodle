from django.contrib import admin
from .models import Cours


class CoursAdmin(admin.ModelAdmin):
    list_display = ('titre', 'professeur', 'niveau', 'date_debut', 'actif')
    search_fields = ('titre', 'professeur__nom')
    list_filter = ('niveau', 'actif')
    
    
admin.site.register(Cours, CoursAdmin)
