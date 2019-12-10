# PhonePeti
This repository contains two applications whose details are given below. Both the applications are present in VoiceApplications folder.

  - First applications is Feedback Application, which can be used to collect and record Feedback of the callers. Callers can call into the IVR system and record their feedback.
  - Second application is GKAIdol (Gurgoan Ki Awaaz Idol) Application. In this, community members can call into the IVR system to record their songs, and vote to select the best songs.

## Instructions for Running the Applications

### Install Asterisk
- Download Asterisk from *[here]* 
- cd /usr/src
- sudo tar zxvf (location of the downloaded file)
- sudo apt-get install ncurses-dev libxml2-dev g++
- cd (name of asterisk directory)
- sudo ./configure
- sudo make clean
- sudo make
- sudo make install
- sudo make samples



### Install package called Chan Dongle for Asterisk (For using USB Dongle {Huawei E173} as a Gateway for calls ) 
- Download package from http://code.google.com/p/asterisk-chan-dongle/
- sudo tar -zxvf (location of the downloaded file)
- cd (name of asterisk directory)
- sudo ./configure
- sudo make
- sudo make install
- Once installed, copy example file dongle-read-only/etc/dongle.conf to /etc/asterisk/. Configure it as desired and enter the IMEI number of the device
- For more detailed instructions about Chan Dongle visit http://wiki.e1550.mobi


##### After installing above mentioned packages, any of the two applications can be installed

- For Running the First (Feedback) Application
   - RUN the Install_Feedback script as root
   - Give the location of the Feedback AGI (/usr/local/phonepeti/Feedback/Feedback.agi) file in the extentions.conf (/etc/asterisk/extensions.conf) or Replace the existing extentions.conf file at '/etc/asterisk/extensions.conf' with the given file for this application in the /usr/local/phonepeti/Feedback/ folder


- For Running the Second (GKAIdol) Application
   - RUN the desired Install_GKAIdol script as root
   - Give the location of the GKAIdol AGI (/usr/local/phonepeti/GKAIdol/GKAIdol.agi) file in the extentions.conf (/etc/asterisk/extensions.conf) or Replace the existing extentions.conf file at '/etc/asterisk/extensions.conf' with the given file for this application in the /usr/local/phonepeti/GKAIdol/ folder
   - In settings.py located at /usr/local/phonepeti/VoiceApplication/, uncomment the MEDIA_ROOT path for GKAIdol and comment the MEDIA_ROOT path for Feedback application. By default its commented for GKAIdol

[here]: <http://www.asterisk.org/downloads>

