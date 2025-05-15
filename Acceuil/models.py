from django.db import models

# Create your models here.

from django.db import models
from Etudiants.models import Etudiants
from Cours.models import Cours

class Evaluation(models.Model):
    etudiant = models.ForeignKey(Etudiants, on_delete=models.CASCADE)
    cours = models.ForeignKey(Cours, on_delete=models.CASCADE)
    note = models.IntegerField(choices=[(i, str(i)) for i in range(1, 6)])  # de 1 à 5
    commentaire = models.TextField(blank=True, null=True)
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('etudiant', 'cours')
