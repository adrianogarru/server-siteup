### Server-Siteup

#### Essential Server to check if services are up with log file.

The purpose of this script is to check the service status of Apache, MySQL and the HTTP request on the web page, in case one of these service is down an email alert will be triggered, all the check will be saved in a log file.
This script has been developed and tested on instance CentOS 8.

**Author:** Adriano Garruba [website](https://adrianogarruba.com/) </br>
**Date:** 25/06/2020 </br>
**Release** 1.0 </br>

### How to use it

1. Script is located in the file called: **server-siteup.sh**
2. Before proceeding it is suggested to configure it as per next chapter "Configuration and Functionalities"
- Mailx or different email service should be installed.

### Configuration and Functionalities

This script has been tested on instance CentOS 8, some commands should be configured as per the log path and log file name that in some Linux version can be different as well as the service commands.
- Package Mailx is needed for email alerting.

**Functionalities**

- Check the status of Apache if is running or dead
- Check the status of MySQL if is running or dead
- Check the status code if is 200 in the website
- Email alert in case the status is different from running or the 200 code for at least 1 of the services.
- Log tracking, 2 logs one that will log each action and second error.log that will track only error.

**Configuration**

- First of all it is suggested to create a folder to save the log files
- The i between rows 8 and 15 should be revised as per your configuration, the names of variables have been organized in order to be clear for their purpose.
- As indicated previously one email service should be installed on your server, (In this script has been used mailx)
- The automatization of the script should be configured in your crontab

### Consideration

- The use of this code and any issue occurred will be at your responsibility.
- This script has been created for my personal use and educational purpose, I will highly appreciate any kind of suggestions.

**Main view of the script**

<br>
<a href="https://ibb.co/mJVmWLQ"><img src="https://i.ibb.co/nrNTJHh/mainpage-Siteup.png" alt="mainpage-Siteup" border="0"></a>
<br>

**Service MySql stopped to simulate site fault**

<a href="https://ibb.co/K04H8pj"><img src="https://i.ibb.co/2nVBp17/test-stop-mysql.png" alt="test-stop-mysql" border="0"></a>
<br>

**Email Alert triggered**

<a href="https://ibb.co/7KDsJyP"><img src="https://i.ibb.co/NKqc6Y5/email-alert.png" alt="email-alert" border="0"></a>

