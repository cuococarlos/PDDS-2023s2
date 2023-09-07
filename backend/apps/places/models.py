from django.db import models

class Place(models.Model):
    name = models.CharField(
        max_length=30, unique=True
    )
    email_contact = models.EmailField(
         max_length=80, unique=True
    )
