from django import forms
from .models import Professeurs

class ProfesseurUpdateForm(forms.ModelForm):
    class Meta:
        model = Professeurs
        fields = [
            'prenom', 'nom', 'email', 'telephone', 'photo', 'biographie'
        ]
