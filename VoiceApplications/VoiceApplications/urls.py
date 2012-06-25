from django.conf.urls import patterns, include, url
from django.conf import settings

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'VoiceApplications.views.home', name='home'),
    # url(r'^VoiceApplications/', include('VoiceApplications.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),

	url(r'^$', 'PhonePeti.views.index'),
	url(r'^login/$', 'django.contrib.auth.views.login'),
	url(r'^logout/$', 'PhonePeti.views.logout_page'),

	url(r'^feedbacks/$', 'PhonePeti.views.feedbacks'),

	url(r'^edit/(?P<feedid>\d+)/$', 'Feedback.views.edit'),

	url(r'^del_caller/(?P<callid>\d+)/$', 'PhonePeti.views.del_caller'),

	url(r'^del_feedback/(?P<feedid>\d+)/$', 'PhonePeti.views.del_feedback'),

	url(r'^CallRecordings/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT,}),

	url(r'^download/(?P<feedid>\d+)/$', 'Feedback.views.download'),

)
