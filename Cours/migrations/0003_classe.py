# Generated by Django 5.0.3 on 2025-05-14 11:47

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Cours', '0002_alter_cours_niveau_postulation'),
        ('Etudiants', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Classe',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cours', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='classe', to='Cours.cours')),
                ('etudiants', models.ManyToManyField(related_name='classes', to='Etudiants.etudiants')),
            ],
        ),
    ]
