from django.db import models
from django.forms import ModelForm
# Create your models here.

class AnswerType (models.Model):
	ansType = models.CharField(max_length=16)

class Question (models.Model):
	questionNo = models.IntegerField()
	answerType = models.ForeignKey(AnswerType)
	promptInstance = models.ForeignKey('PhonePeti.Prompt')

class QuestionForm (ModelForm):
	class Meta:
		model = Question

class Answer (models.Model):
	question = models.ForeignKey(Question)
	call = models.ForeignKey('PhonePeti.Call')
	answer = models.CharField(max_length=128)

class Feedback (models.Model):
	filePath = models.FilePathField()
	call = models.ForeignKey('PhonePeti.Call')

class AnswerChoices (models.Model):
	question = models.ForeignKey(Question)
	choice1 = models.CharField(max_length=32)
	choice2 = models.CharField(max_length=32)
	choice3 = models.CharField(max_length=32)
	choice4 = models.CharField(max_length=32)
	choice5 = models.CharField(max_length=32)

class AnswerChoicesForm (ModelForm):
	class Meta:
		model = AnswerChoices

class CallStatus (models.Model):
	call = models.ForeignKey('PhonePeti.Call')
	status = models.IntegerField()

class CallStatusForm (ModelForm):
	class Meta:
		model = CallStatus
