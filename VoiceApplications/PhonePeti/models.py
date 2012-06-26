from django.db import models
from django import forms
from django.forms import ModelForm

# Create your models & forms here.

Gender_Choices = (
		('M', 'Male'), 
		('F','Female'),
		)

class PhoneNo (models.Model):
	phoneNo = models.CharField(max_length=20)

class Caller (models.Model):
	name = models.CharField(max_length=32, blank=True)
	age = models.IntegerField(null=True, blank=True)
	gender = models.CharField(max_length=1, blank=True, choices=Gender_Choices)
	address = models.CharField(max_length=32, blank=True)
	profession = models.CharField(max_length=32, blank=True)

class CallerForm (ModelForm):
	class Meta:
		model = Caller

class Application (models.Model):
	name = models.CharField(max_length=32)
	description = models.CharField(max_length=256)

class ApplicationForm (ModelForm):
	class Meta:
        	model = Application

class AppInstance (models.Model):
	app = models.ForeignKey(Application)
	startTime = models.DateTimeField(null=True, blank=True)
	endTime = models.DateTimeField(null=True, blank=True)
	options = models.CharField(max_length=256)

class AppInstanceForm (ModelForm):
	class Meta:
        	model = AppInstance

class Call (models.Model):
	phoneNo = models.ForeignKey(PhoneNo)
	caller = models.ForeignKey(Caller, null=True, blank=True)
	startTime = models.DateTimeField()
	endTime = models.DateTimeField(null=True)
	appInstance = models.ForeignKey(AppInstance)
	monitorFile = models.FilePathField()

class CallForm (ModelForm):
	class Meta:
		model = Call

class Prompt (models.Model):
	app = models.ForeignKey(Application)
	name = models.CharField(max_length=32)
	description = models.CharField(max_length=128)
	filePath = models.FilePathField()

class PromptForm (ModelForm):
	class Meta:
        	model = Prompt

class PromptInstance (models.Model):
	prompt = models.ForeignKey(Prompt)
	appInstance = models.ForeignKey(AppInstance)
	filePath = models.FilePathField()

class PromptInstanceForm (ModelForm):
	class Meta:
        	model = PromptInstance

class Tags (models.Model):
	tagName = models.CharField(max_length=32, unique=True, blank=True, null=True)
	call = models.ManyToManyField(Call)

class TagsForm (forms.Form):
	tagName = forms.CharField(required=False, widget=forms.TextInput (attrs = {'size': 32}))

