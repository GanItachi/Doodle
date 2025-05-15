from django.db import models
from django.utils import timezone
from django.core.files import File
from django.core.validators import FileExtensionValidator
from django.utils.text import slugify
from django.conf import settings
import os
from Etudiants.models import Etudiants
from Professeur.models import Professeurs
# from Etudiants.models import Etudiants  


# ------------------------
# Modèle Cours
# ------------------------
class Cours(models.Model):
    NIVEAU_CHOICES = [
        ('Licence 1', 'Licence 1'),
        ('Licence 2', 'Licence 2'),
        ('Licence 3', 'Licence 3'),
    ]

    titre = models.CharField(max_length=200)
    slug = models.SlugField(unique=True, blank=True)
    description = models.TextField()
    categorie = models.CharField(max_length=100, blank=True, null=True)
    professeur = models.ForeignKey(Professeurs, related_name='cours', on_delete=models.CASCADE)

    date_debut = models.DateField(default=timezone.now)
    date_fin = models.DateField(null=True, blank=True)
    nombre_heures = models.PositiveIntegerField(blank=True, null=True)
    niveau = models.CharField(max_length=50, choices=NIVEAU_CHOICES, blank=True, null=True)

    illustration = models.ImageField(upload_to='cours_illustrations/', blank=True, null=True)
    actif = models.BooleanField(default=True)

    # etudiants_inscrits = models.ManyToManyField(Etudiants, blank=True, related_name='cours_suivis')  

    date_ajout = models.DateTimeField(auto_now_add=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.titre)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.titre


# ------------------------
# Enum Type Ressource
# ------------------------
class RessourceType(models.TextChoices):
    PDF = 'pdf', 'PDF'
    WORD = 'word', 'Word'
    EXCEL = 'excel', 'Excel'
    PYTHON = 'python', 'Python'
    POWER = 'power', 'PowerPoint'


# ------------------------
# Modèle Ressource
# ------------------------
class Ressource(models.Model):
    cours = models.ForeignKey(Cours, related_name='ressources', on_delete=models.CASCADE)
    titre = models.CharField(max_length=200)
    type = models.CharField(max_length=50, choices=RessourceType.choices)

    fichier = models.FileField(
        upload_to='ressources/',
        validators=[FileExtensionValidator(allowed_extensions=['pdf', 'docx', 'xlsx', 'py', 'pptx'])]
    )
    description = models.TextField(blank=True, null=True)
    illustration = models.ImageField(upload_to='ressources_illustrations/', blank=True, null=True)
    date_ajout = models.DateTimeField(auto_now_add=True)

    def get_default_illustration(self):
        mapping = {
            'pdf': 'default_images/illust_pdf.png',
            'python': 'default_images/illust_pyton.jpg',
            'word': 'default_images/illust_word.png',
            'excel': 'default_images/illust_excel.webp',
            'power': 'default_images/illust_powerpoint.jpg',
        }
        return mapping.get(self.type.lower(), 'default_images/image_default.jpg')

    def save(self, *args, **kwargs):
        if not self.illustration:
            default_image_path = os.path.join(settings.MEDIA_ROOT, self.get_default_illustration())
            if os.path.exists(default_image_path):
                with open(default_image_path, 'rb') as f:
                    self.illustration.save(os.path.basename(default_image_path), File(f), save=False)
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.titre} ({self.type.upper()})"


class Postulation(models.Model):
    STATUT_CHOICES = [
        ('en_attente', 'En attente'),
        ('accepte', 'Accepté'),
        ('refuse', 'Refusé'),
    ]

    etudiant = models.ForeignKey("Etudiants.Etudiants", on_delete=models.CASCADE)
    cours = models.ForeignKey("Cours.Cours", on_delete=models.CASCADE)
    statut = models.CharField(max_length=20, choices=STATUT_CHOICES, default='en_attente')
    date_postulation = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('etudiant', 'cours')

    def __str__(self):
        return f"{self.etudiant} - {self.cours} ({self.statut})"

# (Optionnel) Méthode sur Etudiants pour savoir s'il peut voir un cours
def peut_voir_cours(self, cours):
    niveaux = ['Licence 1', 'Licence 2', 'Licence 3', 'Master 1', 'Master 2']
    return niveaux.index(self.niveau_etude) >= niveaux.index(cours.niveau or 'Licence 1')

Etudiants.peut_voir_cours = peut_voir_cours



class Classe(models.Model):
    cours = models.OneToOneField(Cours, on_delete=models.CASCADE, related_name='classe')
    etudiants = models.ManyToManyField(Etudiants, related_name='classes')

    def __str__(self):
        return f"Classe de {self.cours.titre}"