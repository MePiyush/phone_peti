#!/bin/bash
#Install Dependencies
sudo apt-get -y install sox apache2 libapache2-mod-wsgi python-mysqldb libmysqlclient-dev

#Create Directory
mkdir PhonePetiUI

#Code for Git Clone

git clone https://github.com/MePiyush/PhonePeti.git

#Create the following Folder Structures.
mkdir -p /usr/local/phonepeti/media/prompts
mkdir -p /usr/local/phonepeti/media/recordings
mkdir -p /usr/local/phonepeti/logs

#Change File Permissions
chmod -R a+w /usr/local/phonepeti/media
chmod -R a+w /usr/local/phonepeti/logs

#Copy Prompts

#Copy VoiceApplications Folder

#Create MySQL Database
mysql -uroot -pjunoon -e "create database PhonePeti"

#Update httpd.conf
echo -e "WSGIScriptAlias / /usr/local/phonepeti/VoiceApplications/wsgi.py\n
WSGIPythonPath /usr/local/phonepeti\n
<Directory /usr/local/phonepeti/VoiceApplications>\n
<Files wsgi.py>\n
Order deny,allow\n
Allow from all\n
</Files>\n
</Directory>\n" >> /etc/apache2/httpd.conf

#Restart Apache
/etc/init.d/apache2 restart
