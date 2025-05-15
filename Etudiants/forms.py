from django import forms
from .models import Etudiants
from django.contrib.auth.models import User

class EtudiantRegisterForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput(), label="Mot de passe")

    class Meta:
        model = Etudiants
        fields = [
            'prenom',
            'nom',
            'email',
            'password',
            'date_naissance',
            'sexe',
            'telephone',
            'etablissement',
            'niveau_etude',
            'filiere',
            'nationalite',
            'photo',
        ]
        widgets = {
            'sexe': forms.Select(attrs={'class': 'form-select'}),
            'niveau_etude': forms.Select(attrs={'class': 'form-select'}),
            'nationalite': forms.Select(attrs={'class': 'form-select'}),
            'date_naissance': forms.DateInput(attrs={'type': 'date'}),
        }

    def save(self, commit=True):
        etudiant = super().save(commit=False)
        user = User.objects.create_user(
            username=self.cleaned_data['email'],
            email=self.cleaned_data['email'],
            password=self.cleaned_data['password'],
            first_name = self.cleaned_data['prenom'],
            last_name= self.cleaned_data['nom']
        )
        etudiant.user = user
        if commit:
            user.save()
            etudiant.save()
        return etudiant

from django import forms
from .models import Etudiants

class EtudiantUpdateForm(forms.ModelForm):
    class Meta:
        model = Etudiants
        fields = [
            'prenom', 'nom', 'date_naissance', 'telephone',
            'etablissement', 'niveau_etude', 'filiere', 'nationalite', 'photo'
        ]
