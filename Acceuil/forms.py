from django import forms
from .models import Evaluation

class EvaluationForm(forms.ModelForm):
    class Meta:
        model = Evaluation
        fields = ['note', 'commentaire']
        widgets = {
            'note': forms.Select(attrs={'class': 'form-select'}),
            'commentaire': forms.Textarea(attrs={'rows': 3, 'class': 'form-textarea'}),
        }
