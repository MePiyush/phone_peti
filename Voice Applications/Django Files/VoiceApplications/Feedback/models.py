from django.db import models
from django.forms import ModelForm
# Create your models here.

class Response (models.Model):
	call = models.ForeignKey('PhonePeti.Call')
	filePath = models.FilePathField()
	title = models.CharField(max_length=32, null=True, blank=True)
	description = models.CharField(max_length=256, null=True, blank=True)

class ResponseForm(ModelForm):
    class Meta:
        model = Response
        fields = ('title', 'description')

