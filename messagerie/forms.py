from django import forms
from .models import Message

class MessageForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ['contenu']
        widgets = {
            'contenu': forms.Textarea(attrs={
                'placeholder': "Pose ta question ici...",
                'rows': 4,
                'class': 'form-control'
            }),
        }
