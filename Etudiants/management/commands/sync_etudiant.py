from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from Etudiants.models import Etudiants
from django.contrib.auth.hashers import make_password
from django.utils import timezone

class Command(BaseCommand):
    help = 'Synchronise les étudiants sans compte utilisateur'

    def handle(self, *args, **kwargs):
        etudiants_sans_user = Etudiants.objects.filter(user__isnull=True)

        for etu in etudiants_sans_user:
            user = User.objects.create_user(
                username=etu.email,
                email=etu.email,
                password=make_password(etu.password),  # 💥 sécurisé !
                first_name=etu.prenom,
                last_name=etu.nom,
                last_login =timezone.now()
            )
            etu.user = user
            etu.save()

        self.stdout.write(self.style.SUCCESS(f'{etudiants_sans_user.count()} étudiants synchronisés !'))
