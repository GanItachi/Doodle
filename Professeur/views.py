from .models import Professeurs
from django.shortcuts import render, redirect
from django.shortcuts import get_object_or_404, render
from Cours.models import Cours, Classe
from Cours.models import Ressource
from Cours.forms import RessourceForm
from .forms import  ProfesseurUpdateForm
from django.utils import timezone
from messagerie.models import Message

# Create your views here.
def profil_Professeur(request):
        Professeur = request.user.professeurs  # récupérer le profil lié à l'user
        if request.method == "POST":
            form =  ProfesseurUpdateForm(request.POST, request.FILES, instance= Professeur)
            if form.is_valid():
                form.save()
                # éventuellement un message de succès
                return redirect('profil_Professeur')  # recharge la page pour voir les modifs
        else:
            form =  ProfesseurUpdateForm(instance= Professeur)

        return render(request, "profil_Professeur.html", {
            "form": form,
            "Professeur":Professeur,
        })





def cours_professeur(request):
    professeur = request.user.professeurs
    cours = Cours.objects.filter(professeur=professeur) # Récupère les cours attribués au professeur
    return render(request, 'Vue_professeur_cours.html', {'cours': cours, 'Professeur' : professeur})

def detail_cours(request, id):
    Professeur = request.user.professeurs
    cours = get_object_or_404(Cours, id= id)
    ressources = Ressource.objects.filter(cours=cours)  # Récupère les ressources liées à ce cours
    classe = get_object_or_404(Classe, cours= cours)
    # Formulaire pour ajouter des ressources
    if request.method == 'POST':
        form = RessourceForm(request.POST, request.FILES)
        if form.is_valid():
            ressource = form.save(commit=False)
            ressource.cours = cours  # Associe la ressource au cours
            ressource.save()
            
            etudiants = classe.etudiants.all() 
            
            for etu in etudiants:
                Message.objects.create(
                    expediteur=cours.professeur.user,  # ou le user du prof
                    destinataire=etu.user,  # user de l’étudiant
                    contenu=f"Nouveau contenu disponible pour votre cours '{cours.titre}' : {ressource.titre}",
                    date_envoi=timezone.now()
                )
            
            return redirect('details', id=cours.id)
        
            
    else:
        form = RessourceForm()

    return render(request, 'detail_cours.html', {
        'cours': cours,
        'ressources': ressources,
        'form': form,
        'Professeur': Professeur, 
    })
    
    
from django.shortcuts import get_object_or_404, redirect
from django.contrib import messages

def supprimer_ressource(request, ressource_id):
    if request.method == "POST":
        ressource = get_object_or_404(Ressource, id=ressource_id)
        ressource.delete()
        messages.success(request, "La ressource a été supprimée avec succès.")
        return redirect('details', id=ressource.cours.id)  # Redirige vers la page du cours après la suppression
    
def logout_professeur(request):
    request.session.flush()  # Supprime toutes les données de la session
    return redirect('accueil')

