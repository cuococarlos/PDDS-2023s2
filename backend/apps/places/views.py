from django.shortcuts import render
from rest_framework import generics, viewsets, views, status
from apps.places.models import Place
from apps.places.serializers import PlaceSerializer

class PlaceViewSet(viewsets.ModelViewSet):
    serializer_class = PlaceSerializer
    queryset = Place.objects.filter().all()
   