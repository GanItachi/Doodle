from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from Professeur.models import Professeurs
from django.utils import timezone

class Command(BaseCommand):
    help = 'Synchronise les professeurs sans user'

    def handle(self, *args, **kwargs):
        profs_sans_user = Professeurs.objects.filter(user__isnull=True)
        for prof in profs_sans_user:
            user = User.objects.create_user(
                username=prof.email,
                email=prof.email,
                password=prof.password,  # ⚠️ attention, mot de passe en clair
                first_name=prof.prenom,
                last_name=prof.nom,
                last_login =timezone.now(),
            )
            prof.user = user
            prof.save()
        self.stdout.write(self.style.SUCCESS('Professeurs synchronisés avec succès.'))

