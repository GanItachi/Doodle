# messagerie/views.py
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import render, redirect, get_object_or_404
from .models import Message
from .forms import MessageForm
from django.db.models import Max
from django.db import models
from django.db.models import Q

@login_required
def inbox(request):
    user = request.user

    # Étape 1 : obtenir les derniers IDs de message par expéditeur
    last_messages_ids = (
        Message.objects
        .filter(destinataire=user)
        .values('expediteur')
        .annotate(last_id=Max('id'))
        .values_list('last_id', flat=True)
    )
    

    # Étape 2 : récupérer les messages complets correspondants à ces IDs
    messages = Message.objects.filter(id__in=last_messages_ids).select_related('expediteur').order_by('-date_envoi')
    return render(request, 'inbox.html', {'messages': messages})

from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, render, redirect
from .models import Message
from .forms import MessageForm
from django.contrib.auth.models import User

@login_required
def envoyer_message(request, destinataire_id=None):
    destinataire = get_object_or_404(User, id=destinataire_id) if destinataire_id else None
    messages = []
    conversations = []
    unread_counts = {}

    if destinataire:
        # ✅ Marquer les messages comme lus
        Message.objects.filter(
            expediteur=destinataire,
            destinataire=request.user,
            lu=False
        ).update(lu=True)

        # ✅ Fil des messages
        messages = Message.objects.filter(
            Q(expediteur=request.user, destinataire=destinataire) |
            Q(expediteur=destinataire, destinataire=request.user)
        ).order_by('date_envoi')

        # ✅ Liste des conversations
        conversations = User.objects.filter(
            Q(messages_recus__expediteur=request.user) |
            Q(messages_envoyes__destinataire=request.user)
        ).exclude(id=request.user.id).distinct()

        # ✅ Compte des messages non lus
        unread_counts = {
            conv.id: Message.objects.filter(
                expediteur=conv,
                destinataire=request.user,
                lu=False
            ).count()
            for conv in conversations
        }

    # ✅ Formulaire
    if request.method == 'POST':
        form = MessageForm(request.POST)
        if form.is_valid() and destinataire:
            msg = form.save(commit=False)
            msg.expediteur = request.user
            msg.destinataire = destinataire
            msg.save()
            return redirect('messagerie:envoyer', destinataire_id=destinataire.id)
    else:
        form = MessageForm()

    return render(request, 'envoyer.html', {
        'form': form,
        'messages': messages,
        'destinataire': destinataire,
        'users': conversations,
        'user': request.user,
        'unread_counts': unread_counts,
    })
