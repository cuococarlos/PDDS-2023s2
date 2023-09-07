from django.db import models

class Place(models.Model):
    name = models.CharField(
        gettext_lazy("place_prop_name"), max_length=30, unique=True
    )
    email_contact = models.EmailField(
        gettext_lazy("place_email_address"), max_length=80, required=False
    )
