from django import forms
from .models import Ressource

class RessourceForm(forms.ModelForm):
    class Meta:
        model = Ressource
        fields = ['titre', 'fichier', 'type', 'description', 'illustration']
        widgets = {
            'titre': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Titre de la ressource',
            }),
            'type': forms.Select(attrs={
                'class': 'form-select'
            }),
            'fichier': forms.ClearableFileInput(attrs={
                'class': 'form-control'
            }),
            'description': forms.Textarea(attrs={
                'class': 'form-control',
                'placeholder': 'Description facultative...',
                'rows': 4
            }),
            'illustration': forms.ClearableFileInput(attrs={
                'class': 'form-control'
            }),
        }
        labels = {
            'titre': 'Titre',
            'fichier': 'Fichier à téléverser',
            'type': 'Type de document',
            'description': 'Description (facultatif)',
            'illustration': 'Illustration personnalisée (facultatif)',
        }
