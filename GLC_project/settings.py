from pathlib import Path
import os  # Optionnel si tu passes à PostgreSQL plus tard

BASE_DIR = Path(__file__).resolve().parent.parent

# Pour les fichiers médias (images, uploads)
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

# Clé secrète Django
SECRET_KEY = 'django-insecure-gln8h)#obh6=)u5v30v5jydw%zn^5t!(%^wrs@9al77ciy&uz!'

# ⚠️ DEBUG à False en production
DEBUG = True

ALLOWED_HOSTS = ['*']  # À sécuriser plus tard

# Messages Bootstrap friendly
from django.contrib.messages import constants as messages
MESSAGE_TAGS = {
    messages.DEBUG: 'debug',
    messages.INFO: 'info',
    messages.SUCCESS: 'success',
    messages.WARNING: 'warning',
    messages.ERROR: 'danger',
}

# Applications
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'Acceuil',
    'Etudiants',
    'Cours',
    'login',
    'loginP',
    'Professeur',
    'messagerie',
]

# Middleware
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',  # 🔥 Ajout pour servir les fichiers statiques
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'GLC_project.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'GLC_project.wsgi.application'

# Base de données
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

# Validation des mots de passe
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

# Langue & fuseau horaire
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_TZ = True

# 🌐 Fichiers statiques (CSS, JS)
STATIC_URL = '/static/'
STATICFILES_DIRS = [BASE_DIR / 'static']       # Où tu écris tes CSS/JS
STATIC_ROOT = BASE_DIR / 'staticfiles'         # Où Django les colle pour Render

# WhiteNoise : compresse et gère les fichiers statiques
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

# Fichiers média (upload)
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Redirection après login
LOGIN_URL = '/login/Etudiant'
LOGIN_REDIRECT_URL = '/Etudiant/'

# Clé par défaut pour les modèles
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
