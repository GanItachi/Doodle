from django.db import models
from django.contrib.auth.models import User


# Create your models here.

class Professeurs(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE,null=True, blank=True)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    password=models.CharField(max_length=50)
    photo = models.ImageField(upload_to='professeurs_photos/', blank=True, null=True)
    biographie = models.TextField(blank=True, null=True)
    telephone = models.CharField(max_length=15, blank=True, null=True)
    date_embauche = models.DateField(blank=True, null=True)

    def __str__(self):
        return self.nom
    


    
