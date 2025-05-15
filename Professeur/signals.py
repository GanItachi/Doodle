from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User
from .models import Professeurs

@receiver(post_save, sender=Professeurs)
def create_user_for_professor(sender, instance, created, **kwargs):
    if created and not instance.user:
        user = User.objects.create_user(
            username=instance.email,
            email=instance.email,
            password=instance.password,# ⚠️ Assure-toi qu'elle est bien chiffrée si nécessaire
            first_name = instance.prenom,
            last_name = instance.prenoms
        )
        instance.user = user
        instance.save()
