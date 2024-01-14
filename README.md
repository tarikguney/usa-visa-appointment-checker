# USA Visa Appointment Checker

![Example Image](./visa-logo.jpg)

Hello, Visa Seeker!

This script automates the process of checking for available visa interview appointments. 

It logs into your account on https://ais.usvisa-info.com using your username and password and then scans the appointment page for availability. 

You can run the script regularly for timely alerts on new appointment slots. You can use [crontab](https://medium.com/@justin_ng/how-to-run-your-script-on-a-schedule-using-crontab-on-macos-a-step-by-step-guide-a7ba539acf76) in MacOS or [Task Scheduler](https://www.windowscentral.com/how-create-automated-task-using-task-scheduler-windows-10) in Windows to run the script on a regular schedule.

Optionally, you can configure it to send you or someone else email notifications about appointment availability. 

Rest assured, the script runs locally on your computer, ensuring your login details are not shared. 


> [!IMPORTANT]
> This code is designed for **Non-Immigrant Visa Applications** and has not been tested for Immigrant Visa applications. However, if you can read/write code, then it should be an easy problem to solve. If you give me a test account to write one, I am also happy to add that support.

## How to run

1. Download the visa-appointment-checker.ps1 file onto your computer. You can also clone this repo if you know Git.
1. Open up your preferred terminal application, like MacOS Terminal, Windows Terminal, or iTerm2.
2. In your terminal, run this command to enter the Powershell shell: `pwsh`. If this command seems unavailable, restart your terminal app.
3. Using `cd` command, go to the directory where you store the visa-appointment-checker.ps1 file.
4. Run this command and make sure you provide your username, password, and schedule id `./visa-appointment-checker.ps1 -email "hello@world.com" -password "12abc" -scheduleId 456677`

## Prerequisites

You must download and install Powershell to run this script on your computer.

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
