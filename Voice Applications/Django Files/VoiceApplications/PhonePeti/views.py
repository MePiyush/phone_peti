# Create your views here.

from django.shortcuts import render_to_response, redirect
from django.contrib.auth import logout
from django.http import HttpResponseRedirect
from Feedback.models import Response
from PhonePeti.models import Call

def index(request):
	return render_to_response('index.html', {'user': request.user})

def logout_page(request):
	logout(request)
	return HttpResponseRedirect('/')

def feedbacks(request):
	all_feedbacks = Response.objects.all().order_by('-id')
	return render_to_response('feedbacks.html', {'all_feedbacks': all_feedbacks})

def del_caller(request, callid):
	Call.objects.filter(id=callid).update(caller='')
	return redirect (feedbacks)

