from django.urls import path
from . import views
from Acceuil import views as v

urlpatterns = [
    path('postuler/<int:cours_id>/', views.postuler_cours, name='postuler_cours'),
    path('postulations/', views.gerer_postulations, name='gerer_postulations'),
    path('postulation/<int:postulation_id>/<str:action>/', views.traiter_postulation, name='traiter_postulation'),
    path('classe/<int:cours_id>/', views.voir_classe, name='voir_classe'),
    path('noter/<int:cours_id>/', v.noter_cours, name='noter_cours'),

]
