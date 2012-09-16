# Create your views here.

from django.shortcuts import render_to_response, redirect, get_object_or_404
from django.contrib.auth import logout
from django.http import HttpResponseRedirect
from PhonePeti.models import *
from GKAIdol.models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.template import RequestContext
from django.http import HttpResponse


def allrecordings(request):
	recordings = Recording.objects.raw('select * from GKAIdol_recording where id in (select max(id) from GKAIdol_recording group by phoneNo_id)')
	all_recordings = Recording.objects.filter(id__in=[recording.id for recording in recordings], status__isnull=True)
	paginator = Paginator(all_recordings, 10)
	page = request.GET.get('page')
	try:
		all_recordings = paginator.page(page)
	except PageNotAnInteger:
		all_recordings=paginator.page(1)
	except EmptyPage:
		all_recordings = paginator.page(paginator.num_pages)

	return render_to_response('allrecordings.html', {'all_recordings': all_recordings})

def shortlisted_recordings(request):
       	recordings = Recording.objects.raw("select * from GKAIdol_recording where id in (select max(id) from GKAIdol_recording where status='A' group by phoneNo_id)")
	all_recordings = Recording.objects.filter(id__in=[recording.id for recording in recordings])

#	all_recordings = Recording.objects.filter(status='A')
	paginator = Paginator(all_recordings, 10)
	page = request.GET.get('page')
	try:
		all_recordings = paginator.page(page)
	except PageNotAnInteger:
		all_recordings=paginator.page(1)
	except EmptyPage:
		all_recordings = paginator.page(paginator.num_pages)

	return render_to_response('shortlisted_recordings.html', {'all_recordings': all_recordings})


def rejected_recordings(request):
	all_recordings = Recording.objects.filter(status='R')
	paginator = Paginator(all_recordings, 10)
	page = request.GET.get('page')
	try:
		all_recordings = paginator.page(page)
	except PageNotAnInteger:
		all_recordings=paginator.page(1)
	except EmptyPage:
		all_recordings = paginator.page(paginator.num_pages)

	return render_to_response('rejected_recordings.html', {'all_recordings': all_recordings})




def edit(request, recordingid):
	recording = get_object_or_404(Recording, id=recordingid)
	recording_form = RecordingForm(request.POST or None, instance=recording)
	personaldetail = CallerDetailsRecording.objects.filter(phoneNo_id=recording.phoneNo_id).order_by('-id')[0]
        phoneNo_object = PhoneNo.objects.get(id=recording.phoneNo_id)

	try:
                old_caller_object = CallerDetailsData.objects.get(phoneNo_id=phoneNo_object.id)
                caller_form = CallerDetailsDataForm(request.POST or None, instance = old_caller_object)
        except CallerDetailsData.DoesNotExist:
                caller_form = CallerDetailsDataForm(request.POST or None)

	tags_form = TagsForm(request.POST or None)
	all_tags = Tags.objects.all().order_by('tagName')

	tags_of_call_comma_sep=list()
	tags_of_call_list = recording.call.tags_set.all()

	for tags_of_call in tags_of_call_list:
		tags_of_call_comma_sep.append(tags_of_call.tagName)
	tags_of_call_comma_sep=','.join(tags_of_call_comma_sep)

	if ((recording_form.is_valid()) or (caller_form.is_valid()) or (tags_form.is_valid())):

		if recording_form.is_valid():
#			print recording_form.data['status']
			recording_form.save()
#			print "recording Form is SAVED"


	        if caller_form.is_valid():
#			print "Form is valid"
	                caller_object = caller_form.save(commit=False)
	                caller_object.phoneNo = phoneNo_object
	                caller_object.save()

		if (tags_form.is_valid()):
			recording.call.tags_set.clear()
			for tag_names in request.POST.getlist('tagName'):
				tag_names_new = tag_names.split(',')
				for tag_name in tag_names_new:
			
#			tag_names_new = tags_form.data['tagName'].split(',')
#			for tag_name in tag_names_new:

					if (tag_name.strip()):
						tag_object, created = Tags.objects.get_or_create(tagName=tag_name.strip())
						tag_object.call.add(recording.call)

		return redirect('/')

	return render_to_response('edit.html', {'recordingid': recordingid, 'recording': recording, 'recording_form': recording_form, 'personaldetail': personaldetail, 'caller_form': caller_form, 'tags_form': tags_form, 'tags_of_call_comma_sep': tags_of_call_comma_sep, 'all_tags': all_tags,}, context_instance=RequestContext(request))

def download(request, recordid):
	recording = get_object_or_404(Recording, id=recordid)
	fopen = open("/usr/local/phonepeti/GKAIdol/media/recordings/" + recording.recording, 'r')
	download_file = HttpResponse(fopen, mimetype='audio/wav')
	file_name = str(recording.id)+'-'+str(recording.recording)
	download_file['Content-Disposition'] = 'attachment; filename = %s' % (file_name)
	return download_file
