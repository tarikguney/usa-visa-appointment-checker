# USA Visa Appointment Checker

![Example Image](./visa-logo.jpg)

Hello, Visa Seeker!

This script will help you check if there is an available appointment to schedule your visa interview. This script solves the hardest part. 

Now, you can run this script periodically to see if there is a new appointment time available and alert yourself automatically and timely.

Perhaps, you could send yourself or someone else a notification email periodically about the availability of visa appointment dates.

It checks the availability of visa appointments by using your username and password, logging into your account at https://ais.usvisa-info.com, and reading the appointment page there.

Don't worry about your username and password. This script runs on your computer, and nothing is sent anywhere. 

## How to run

`visa-appointment-checker.ps1 -email "hello@world.com" -password "12abc" -scheduleId 456677`

## Prerequisites

You will need to download Powershell to run this script on your computer.


### More Help
```
.PARAMETER email
The email that you use to log in at https://ais.usvisa-info.com/en-tr/iv/users/sign_in

.PARAMETER password
The password that you use to log in at https://ais.usvisa-info.com/en-tr/iv/users/sign_in

.PARAMETER scheduleId
ScheduleId comes from the URL where you make the visa payment https://ais.usvisa-info.com/en-tr/iv/schedule/{scheduleId}/payment

.EXAMPLE
.\visa-appointment-checker.ps1 -email "hello@world.com" -password "12abc" -scheduleId 456677
```
