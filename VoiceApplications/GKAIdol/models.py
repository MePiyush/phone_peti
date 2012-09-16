from django.db import models
from django.forms import ModelForm

# Create your models here.

class RecordingType(models.Model):
	phoneNo = models.ForeignKey('PhonePeti.PhoneNo')
	recordingType = models.IntegerField(null=True, blank=True)

class CallerDetailsRecording(models.Model):
	call = models.ForeignKey('PhonePeti.Call', null=True, blank=True)
	phoneNo = models.ForeignKey('PhonePeti.PhoneNo')
	personalDetail = models.FilePathField(null=True, blank=True)

class Recording(models.Model):
	call = models.ForeignKey('PhonePeti.Call', null=True, blank=True)
	phoneNo = models.ForeignKey('PhonePeti.PhoneNo', null=True, blank=True)
	recording = models.FilePathField(null=True, blank=True)
	Select_Choices = (
		('A', 'Accept'), 
		('R','Reject'),
		)
	status = models.CharField(max_length=1, blank=True, null=True, choices=Select_Choices)
	group = models.IntegerField(null = True, blank = True)


class RecordingForm (ModelForm):
	class Meta:
        	model = Recording
		exclude = ('call', 'phoneNo', 'recording')

class CallerDetailsData(models.Model):
	name = models.CharField(max_length=32, blank=True, null=True)
	Gender_Choices = (
		('M', 'Male'), 
		('F','Female'),
		)
	gender = models.CharField(max_length=1, blank=True, null=True, choices=Gender_Choices)
	age = models.IntegerField(null=True, blank=True)
	phoneNo = models.ForeignKey('PhonePeti.PhoneNo', null=True, blank=True)

class CallerDetailsDataForm (ModelForm):
	class Meta:
        	model = CallerDetailsData

class VotingType(models.Model):
	phoneNo = models.ForeignKey('PhonePeti.PhoneNo')
	votingType = models.IntegerField(null=True, blank=True)

class VoteTwoSongs(models.Model):
	call = models.ForeignKey('PhonePeti.Call', null=True, blank=True)
	song1of2 = models.ForeignKey(Recording, null=True, blank=True, related_name='song1of2')
	song2of2 = models.ForeignKey(Recording, null=True, blank=True, related_name='song2of2')
	winnerof2 = models.ForeignKey(Recording, null=True, blank=True, related_name='winnerof2')
	votetime = models.DateTimeField(null=True, blank=True,)

class VoteFourSongs(models.Model):
	call = models.ForeignKey('PhonePeti.Call', null=True, blank=True)
	song1of4 = models.ForeignKey(Recording, null=True, blank=True, related_name='song1of4')
	song2of4 = models.ForeignKey(Recording, null=True, blank=True, related_name='song2of4')
	song3of4 = models.ForeignKey(Recording, null=True, blank=True, related_name='song3of4')
	song4of4 = models.ForeignKey(Recording, null=True, blank=True, related_name='song4of4')
	winnerof4 = models.ForeignKey(Recording, null=True, blank=True, related_name='winnerof4')
	votetime = models.DateTimeField(null=True, blank=True,)
