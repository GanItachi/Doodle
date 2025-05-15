from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

class Etudiants(models.Model):
    SEXE_CHOICES = (
        ('M', 'Masculin'),
        ('F', 'Féminin'),
    )

    NIVEAU_CHOICES = (
        ('Licence 1', 'Licence 1'),
        ('Licence 2', 'Licence 2'),
        ('Licence 3', 'Licence 3'),
        ('Master 1', 'Master 1'),
        ('Master 2', 'Master 2'),
    )
    NATIONALITES_CHOICES = [
        ('CI', 'Côte d\'Ivoire'),
        ('BF', 'Burkina Faso'),
        ('TG', 'Togo'),
        ('BJ', 'Bénin'),
        ('SN', 'Sénégal'),
        ('ML', 'Mali'),
        ('CM', 'Cameroun'),
        ('HA', 'Haïti'),
        ]
    user = models.OneToOneField(User, on_delete=models.CASCADE,null=True, blank=True)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    email = models.EmailField(primary_key=True,unique=True)
    password = models.CharField(max_length=128)
    date_naissance = models.DateField(null=True, blank=True)
    sexe = models.CharField(max_length=1, choices=SEXE_CHOICES, default='M')
    telephone = models.CharField(max_length=20, blank=True)
    etablissement = models.CharField(max_length=150, blank=True)
    niveau_etude = models.CharField(max_length=20, choices=NIVEAU_CHOICES, default='Licence 1')
    filiere = models.CharField(max_length=100, blank=True)
    photo = models.ImageField(upload_to='photos/', blank=True, null=True)
    nationalite = models.CharField(max_length=2, choices=NATIONALITES_CHOICES)
    date_inscription = models.DateTimeField(default=timezone.now)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.prenom} {self.nom}"


