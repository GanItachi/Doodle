
from django.shortcuts import render, redirect
from django.forms import ModelForm
from .models import loginP
from Professeur.models import Professeurs
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password
from django.contrib.auth.decorators import login_required
from Cours.models import Postulation
from messagerie.models import Message

# Create your views here.
class LoginForm(ModelForm):
    class Meta:
        model = loginP
        fields=['email','password']

def connecterP(request):
    if request.method == 'POST': 
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']

            try:
                user = User.objects.get(email=email)
                user = authenticate(request, username=user.username, password=password)
                
                if user is not None:
                    login(request, user)  # ⬅️ LA MAGIE
                    return redirect('AccP')
                else:
                    messages.error(request, "Mot de passe incorrect.")
            except User.DoesNotExist:
                messages.error(request, "Aucun compte avec cet email.")
    else:
        form = LoginForm()
    
    return render(request, 'loginP.html', {'form': form})


@login_required
def AccP(request) :
    Professeur = Professeurs.objects.get(user=request.user)
    postulations = Postulation.objects.filter(
        cours__professeur=Professeur,
        statut='en_attente'
    )
    
    messages_non_lus = Message.objects.filter(
        destinataire=request.user,
        lu=0
    )
    
    # ✅ Comptage des postulations en attente
    postulation_count = postulations.count()
    messages_count = messages_non_lus.count()
    return render(request, 'Vue_Professeur.html', {'Professeur': Professeur,'postulation_count':postulation_count,'messages_count':messages_count })
