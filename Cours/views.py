from django.shortcuts import get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from Cours.models import Cours
from django.shortcuts import render, get_object_or_404, redirect
from Etudiants.models import Etudiants
from Professeur.models import Professeurs
from .models import Postulation
from Cours.models import Classe

# Hiérarchie des niveaux pour comparaison
NIVEAU_ORDER = {
    'Licence 1': 1,
    'Licence 2': 2,
    'Licence 3': 3,
    'Master 1': 4,
    'Master 2': 5,
}

@login_required
def postuler_cours(request, cours_id):
    etudiant = get_object_or_404(Etudiants, user=request.user)
    cours = get_object_or_404(Cours, id=cours_id)

    niveau_eleve = NIVEAU_ORDER.get(etudiant.niveau_etude, 0)
    niveau_cours = NIVEAU_ORDER.get(cours.niveau, 0)

    # Vérifie que l'étudiant peut postuler à ce cours
    if niveau_cours > niveau_eleve:
        messages.error(request, "Ce cours est trop avancé pour votre niveau.")
        return redirect('LISTE')

    # Vérifie s'il a déjà postulé
    postulation_existante = Postulation.objects.filter(etudiant=etudiant, cours=cours).exists()
    if postulation_existante:
        messages.info(request, "Vous avez déjà postulé à ce cours.")
    else:
        Postulation.objects.create(etudiant=etudiant, cours=cours)
        messages.success(request, "Votre demande a été envoyée avec succès.")

    return redirect('LISTE')


from django.contrib import messages

@login_required
def gerer_postulations(request):
    try:
        professeur = Professeurs.objects.get(user=request.user)
    except Professeurs.DoesNotExist:
        messages.error(request, "Aucun profil professeur lié à votre compte.")
        return redirect('accueil')  # ou vers une autre page plus appropriée

    cours_prof = Cours.objects.filter(professeur=professeur)
    postulations = Postulation.objects.filter(cours__in=cours_prof, statut='en_attente')

    return render(request, 'gestion_postulation.html', {
        'postulations': postulations,
        'Professeur': professeur,
    })

    
    
@login_required
def traiter_postulation(request, postulation_id, action):
    postulation = get_object_or_404(Postulation, id=postulation_id)

    if action == 'accepter':
            postulation.statut = 'accepte'
            postulation.save()

        # 🔁 Créer une classe si elle n'existe pas
            classe, created = Classe.objects.get_or_create(cours=postulation.cours)

        # 🔁 Ajouter l'étudiant dans la classe
            classe.etudiants.add(postulation.etudiant)

    elif action == 'refuser':
        postulation.statut = 'refuse'
        postulation.save()

    return redirect('gerer_postulations')


@login_required
def voir_classe(request, cours_id):
    cours = get_object_or_404(Cours, id=cours_id, professeur__user=request.user)
    classe = getattr(cours, 'classe', None)

    etudiants = classe.etudiants.all() if classe else []

    return render(request, 'classe_professeur.html', {
        'cours': cours,
        'etudiants': etudiants
    })
