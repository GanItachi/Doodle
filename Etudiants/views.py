
from django.shortcuts import render, get_object_or_404
from Cours.models import Cours
from django.shortcuts import render, redirect
from django.forms import ModelForm, PasswordInput
from .models import Etudiants
from django import forms
from django.contrib.auth.hashers import make_password
from django.shortcuts import render, get_object_or_404
from Cours.models import Ressource
from Cours.forms import RessourceForm
from django.shortcuts import render, redirect
from .forms import EtudiantRegisterForm
from .models import Etudiants
from django.shortcuts import render, redirect
from django.contrib import messages
from Cours.models import Postulation
from .forms import EtudiantUpdateForm

from django.contrib.auth.decorators import login_required

NIVEAU_ORDER = {
    'Licence 1': 1,
    'Licence 2': 2,
    'Licence 3': 3,
    'Master 1': 4,
    'Master 2': 5,
}
@login_required
def Etudiant(request):
    cours = Cours.objects.all()
    return render(request, 'Vue_Etudiant.html', {'cours': cours})


@login_required
def liste_cours(request):

    etudiant = request.user.etudiants
    niveau_etudiant = etudiant.niveau_etude
    niveau_max = NIVEAU_ORDER.get(niveau_etudiant, 1)
    niveaux_autorises = [niveau for niveau, ordre in NIVEAU_ORDER.items() if ordre <= niveau_max]

    # Cours autorisés selon niveau
    cours = Cours.objects.filter(niveau__in=niveaux_autorises)

    # Demandes de cours de cet étudiant
    demandes = Postulation.objects.filter(etudiant=etudiant)
    
    # Cours postulés (toutes les demandes faites)
    cours_postules = demandes.values_list('cours_id', flat=True)

    # Cours validés
    cours_inscrits = demandes.filter(statut="accepte").values_list('cours_id', flat=True)
    
    print(cours_inscrits)

    return render(request, 'Vue_Etudiants_cours.html', {
        'etudiant': etudiant,
        'cours': cours,
        'cours_postules': cours_postules,
        'cours_inscrits': cours_inscrits,
        'niveaux_autorises': niveaux_autorises,
    })


@login_required
def b_etudiant(request):
    etudiant = request.user.etudiants  # Accès direct via la relation OneToOne
    return render(request, 'Vue_Etudiant.html', {'etudiant': etudiant})

@login_required
def profil_etudiant(request):
    etudiant = request.user.etudiants  # récupérer le profil lié à l'user

    if request.method == "POST":
        form = EtudiantUpdateForm(request.POST, request.FILES, instance=etudiant)
        if form.is_valid():
            form.save()
            # éventuellement un message de succès
            return redirect('profil_etudiant')  # recharge la page pour voir les modifs
    else:
        form = EtudiantUpdateForm(instance=etudiant)

    return render(request, "profil_etudiant.html", {
        "form": form,
        "etudiant": etudiant,
    })
# views.py
from django.contrib.auth.models import User
from django.contrib.auth import login
from django.shortcuts import render, redirect
from .forms import EtudiantRegisterForm

def register(request):
    if request.method == 'POST':
        form = EtudiantRegisterForm(request.POST, request.FILES)
        if form.is_valid():
            # Vérifie s'il existe déjà un user avec cet email
            email = form.cleaned_data['email']
            if User.objects.filter(username=email).exists():
                form.add_error('email', 'Un utilisateur avec cet email existe déjà.')
            else:
                etudiant = form.save()
                login(request, etudiant.user)  # Connecte automatiquement l'étudiant
                return redirect('success')     # Redirige vers la page d'accueil après inscription
    else:
        form = EtudiantRegisterForm()

    return render(request, 'register.html', {'form': form})




def success(request):
    return render(request, 'success.html')

def home(request) :
    return render (request, 'Acceuil.html')


def detail_coursE(request, id):
    etudiant = request.user.etudiants 
    cours = get_object_or_404(Cours, id= id)
    ressources = Ressource.objects.filter(cours=cours)  # Récupère les ressources liées à ce cours
    
    # Formulaire pour ajouter des ressources
    if request.method == 'POST':
        form = RessourceForm(request.POST, request.FILES)
        if form.is_valid():
            ressource = form.save(commit=False)
            ressource.cours = cours  # Associe la ressource au cours
            ressource.save()
            return redirect('detailsE', id=cours.id)
    else:
        form = RessourceForm()

    return render(request, 'detail_cours_etudiant.html', {
        'cours': cours,
        'ressources': ressources,
        'form': form,
        'etudiant': etudiant, 
    })
    
def logout(request):
    request.session.flush()  # Supprime toutes les données de la session
    return redirect('accueil')

    