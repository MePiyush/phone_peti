# Create your views here.
from django.shortcuts import render_to_response, redirect, get_object_or_404
from Feedback.models import Response, ResponseForm
from PhonePeti.models import Caller, CallerForm, Call, CallForm, Tags, TagsForm
from django.template import RequestContext

def edit(request, feedid):
	feedback = get_object_or_404(Response, id=feedid)
	feedback_form = ResponseForm(request.POST or None, instance=feedback)
	existing_callers = Call.objects.filter(phoneNo_id=feedback.call.phoneNo_id, caller_id__isnull=False).distinct()
	caller_of_call_form = CallerForm(request.POST or None, instance=feedback.call.caller)
	new_caller_form = CallerForm(request.POST or None)
	tags_form = TagsForm(request.POST or None)
	all_tags = Tags.objects.all().order_by('tagName')

	tags_of_call_comma_sep=list()
	tags_of_call_list = feedback.call.tags_set.all()

	for tags_of_call in tags_of_call_list:
		tags_of_call_comma_sep.append(tags_of_call.tagName)
	tags_of_call_comma_sep=','.join(tags_of_call_comma_sep)

	if ((feedback_form.is_valid()) or (caller_of_call_form.is_valid()) or (new_caller_form.is_valid()) or (tags_form.is_valid())):

		if ((feedback_form.is_valid()) and (feedback_form.data['title'] or feedback_form.data['description'])):
			feedback_form.save()

		if (feedback.call.caller):
			if ((caller_of_call_form.is_valid()) and (caller_of_call_form.data['name'] or caller_of_call_form.data['address'] or caller_of_call_form.data['profession'])):
				caller_of_call_form.save()
		else:

			if (new_caller_form.is_valid()):

				if (new_caller_form.data['name'] or new_caller_form.data['address'] or new_caller_form.data['profession']):
					new_caller = Caller.objects.create(name=new_caller_form.data['name'], address=new_caller_form.data['address'], profession=new_caller_form.data['profession'], gender=new_caller_form.data['gender'])
					Call.objects.filter(id=feedback.call.id).update(caller=new_caller.id)

					if (new_caller_form.data['age']):
						Caller.objects.filter(id=new_caller.id).update(age=new_caller_form.data['age'])					

				elif (existing_callers.count()):

					if (new_caller_form.data['callers'].isdigit()):
						Call.objects.filter(id=feedback.call.id).update(caller=int(new_caller_form.data['callers']))

		if (tags_form.is_valid()):
			feedback.call.tags_set.clear()
			for tag_names in request.POST.getlist('tagName'):
				tag_names_new = tag_names.split(',')
				for tag_name in tag_names_new:
			
#			tag_names_new = tags_form.data['tagName'].split(',')
#			for tag_name in tag_names_new:

					if (tag_name.strip()):
						tag_object, created = Tags.objects.get_or_create(tagName=tag_name.strip())
						tag_object.call.add(feedback.call)

		return redirect('/')

	return render_to_response('edit.html', {'feedid': feedid, 'feedback': feedback, 'feedback_form': feedback_form, 'existing_callers': existing_callers, 'existing_callers_count': existing_callers.count(), 'caller_of_call': feedback.call.caller, 'caller_of_call_form': caller_of_call_form, 'new_caller_form': new_caller_form, 'tags_form': tags_form, 'tags_of_call_comma_sep': tags_of_call_comma_sep, 'all_tags': all_tags,}, context_instance=RequestContext(request))

