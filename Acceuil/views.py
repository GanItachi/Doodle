from django.http import HttpResponseBadRequest
from django.shortcuts import render
from . import views
from Etudiants.models import Etudiants
from Cours.models import Cours
from Professeur.models import Professeurs


# Create your views here.
from django.contrib.auth import logout

def home(request):
    nb_etudiants = Etudiants.objects.count()
    nb_cours = Cours.objects.count()
    nb_professeurs = Professeurs.objects.count()
    #taux_satisfaction = Evaluation.objects.aggregate(moy=Avg('note'))['moy'] or 0
    #taux_satisfaction = round(taux_satisfaction * 20)  # note sur 5 convertie en %

    context = {
        'nb_etudiants': nb_etudiants,
        'nb_cours': nb_cours,
        'nb_professeurs': nb_professeurs,
        #'taux_satisfaction': taux_satisfaction,
    }
    return render(request, 'Acceuil.html', context)

from django.shortcuts import render, redirect, get_object_or_404
from .models import Evaluation
from Cours.models import Cours
from Etudiants.models import Etudiants
from .forms import EvaluationForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required

@login_required
def noter_cours(request, cours_id):
    cours = get_object_or_404(Cours, id=cours_id)
    etudiant = Etudiants.objects.get(user=request.user)

    # Vérifie que l'étudiant a été accepté à ce cours
    if not cours.postulation_set.filter(etudiant=etudiant, statut='accepte').exists():
        messages.error(request, "Vous n'avez pas accès à ce cours.")
        return redirect('detailsE', cours_id)

    evaluation = Evaluation.objects.filter(etudiant=etudiant, cours=cours).first()
    form = EvaluationForm(request.POST, instance=evaluation)
    note = request.POST.get('note')
    commentaire = request.POST.get('commentaire')
    if note is None:
        return HttpResponseBadRequest("La note est requise.")

    if evaluation is None:
        evaluation = Evaluation.objects.create(
            etudiant=etudiant,
            cours=cours,
            note=note
        )
    else:
        evaluation.note = note
        evaluation.commentaire = commentaire
        evaluation.save()


    messages.success(request, "Merci pour ta note !")
    return redirect('detailsE', id=cours.id)

