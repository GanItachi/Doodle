from django.apps import AppConfig


class ProfesseurConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'Professeur'
    def ready(self):
        import Professeur.signals
