from django.urls import path
from . import views

app_name = 'messagerie'

urlpatterns = [
    path('inbox/', views.inbox, name='inbox'),
    path('conversation/<int:destinataire_id>/', views.envoyer_message, name='envoyer'),
]