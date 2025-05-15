
from django.shortcuts import render, redirect
from django.forms import ModelForm
from .models import Login
from Etudiants.models import Etudiants
from django.contrib import messages
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password
from django.contrib.auth.decorators import login_required
from messagerie.models import Message


# Create your views here.
class LoginForm(ModelForm):
    class Meta:
        model = Login
        fields=['email','password']



def connecter(request):
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
                    return redirect('Acc')
                else:
                    messages.error(request, "Mot de passe incorrect.")
            except User.DoesNotExist:
                messages.error(request, "Aucun compte avec cet email.")
    else:
        form = LoginForm()
    
    return render(request, 'login.html', {'form': form})




@login_required(login_url='login_etudiant')  # Redirige si non connecté
def Acc(request):
    etudiant = Etudiants.objects.get(user=request.user)
    messages_non_lus = Message.objects.filter(
        destinataire=request.user,
        lu=0
    )
    messages_count = messages_non_lus.count()
    return render(request, 'Vue_Etudiant.html', {'etudiant': etudiant, 'messages_count':  messages_count })
