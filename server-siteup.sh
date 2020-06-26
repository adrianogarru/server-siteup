#!/bin/bash

#Alert script to check the status of the service Apache and MySQL and the HTTP code on the website
#The script need the service mailx to be configured in order to trigger the email to inform on the alert status

clear

#Variables that need to be set configured
WEBSITE="https://yourwebsite.com"
APACHE_STATUS=$(systemctl status httpd | grep "Active: " | cut -d " " -f 6)
MYSQL_STATUS=$(systemctl status mysql | grep "Active: " | cut -d " " -f 6)
SITE=$(curl -s -o /dev/null -w "%{http_code}\n" $WEBSITE)
LOGFILEFOLDER="Path where you want to save the log example: /home/pippo/bin/logs"
EMAILBODY="If you receive this email is because on the website: $WEBSITE the issue in subject line has been occurred."
ALERT_EMAIL="Email where you want rececive the alert"

echo "# Welcome to Server-Siteup #"
echo " "
echo "The APACHE service is $APACHE_STATUS"
echo " "
echo "The MySQL service is $MYSQL_STATUS"
echo " "
echo "The website status code is: $SITE"
echo " "

#Main Log file
echo "$(date +%F) $(date +%T) The Apache is $APACHE_STATUS, My SQL is $MYSQL_STATUS and site has status code is $SITE" >> $LOGFILEFOLDER/log-siteup_$(date +%Y_%m_%d).log

#APACHE Condition in order to send the alert email
if [ $APACHE_STATUS != "(running)" ]; then
echo "$EMAILBODY" | mail -v -s "[Alert]-[Action Needed] Status is $APACHE_STATUS on service APACHE" $ALERT_EMAIL
#Error Log file
echo "$(date +%F) $(date +%T) service Apache status is $APACHE_STATUS" >> $LOGFILEFOLDER/Error_log_siteup_$(date +%Y_%m_%d).log
else
echo "No alert mail needed for Apache Service"
fi

#MySQL Condition in order to send the alert email
if [ $MYSQL_STATUS != "(running)" ]; then
echo "$EMAILBODY" | mail -v -s "[Alert]-[Action Needed] Status is $MYSQL_STATUS on service MySQL" $ALERT_EMAIL
#Error Log file
echo "$(date +%F) $(date +%T) service MySQL status is $MYSQL_STATUS" >> $LOGFILEFOLDER/Error_log_siteup_$(date +%Y_%m_%d).log
else
echo "No alert mail needed for MySql Service"
fi

#MySQL Condition in order to send the alert email
if [ $SITE != "200" ]; then
echo "$EMAILBODY" | mail -v -s "[Alert]-[Action Needed] Error $SITE on HTTP Request" $ALERT_EMAIL
#Error Log file
echo "$(date +%F) $(date +%T) $WEBSITE has status code: $SITE" >> $LOGFILEFOLDER/Error_log_siteup_$(date +%Y_%m_%d).log
else
echo "No alert mail needed for HTTP status"
fi
