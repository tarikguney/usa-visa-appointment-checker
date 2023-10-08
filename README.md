# USA Visa Appointment Checker

![Example Image](./visa-logo.jpg)

Hello, Visa Seeker!

This script automates the process of checking for available visa interview appointments. 

It logs into your account on https://ais.usvisa-info.com using your username and password, and then scans the appointment page for availability. 

You can run the script at regular intervals to receive timely alerts on new appointment slots. 

Optionally, you can configure it to send email notifications about appointment availability to you or someone else. 

Rest assured, the script runs locally on your computer, ensuring that your login details are not shared. 


## How to run

1. Download the visa-appointment-checker.ps1 file onto your computer. You can also clone this repo if you know Git.
1. Open up your preferred terminal app, like Windows Terminal or iTerm.
2. Run this command to enter the Powershell shell: `pwsh`
3. Navigate to the directory where you placed the visa-appointment-checker.ps1 file.
4. Run this command and make sure you provide your username, password, and schedule id `./visa-appointment-checker.ps1 -email "hello@world.com" -password "12abc" -scheduleId 456677`

## Prerequisites

You will need to download Powershell to run this script on your computer.

[Dowload it here](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3) if you don't have it already. 

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
