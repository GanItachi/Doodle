"""
URL configuration for GLC_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from Acceuil.views import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.home, name='accueil'),
    path('Etudiant/',include('Etudiants.urls')),
    path('login/', include('login.urls')),
    path('loginP/', include('loginP.urls')),
    path('Professeur/', include('Professeur.urls')),
    path('Cours/', include('Cours.urls')),
    path('messagerie/', include('messagerie.urls', namespace='messagerie')),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)



