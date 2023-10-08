<#
.SYNOPSIS
Hello visa seeker!

.DESCRIPTION
This script will help you check if there is an available appoinment to schedule your visa interview. This script solves the hardest part. Now you can run this script periodically to see if there is a new appoitment time available and alert yourself automatically and timely.

.PARAMETER email
The email that you use to login at https://ais.usvisa-info.com/en-tr/iv/users/sign_in

.PARAMETER password
The password that you use to login at https://ais.usvisa-info.com/en-tr/iv/users/sign_in

.PARAMETER scheduleId
ScheduleId comes from the URL where you make the visa payment https://ais.usvisa-info.com/en-tr/iv/schedule/{scheduleId}/payment

.EXAMPLE
.\visa-appointment-checker.ps1 -email "hello@world.com" -password "12abc" -scheduleId 456677
#>

[CmdletBinding()]
param (
    [Parameter(
        Mandatory = $true
    )]
    [string]$email,
    [Parameter(
        Mandatory = $true
    )]
    [string]$password,
    [Parameter(
        Mandatory = $true
    )]
    [int]$scheduleId
)

[string]$loginUrl = "https://ais.usvisa-info.com/en-tr/iv/users/sign_in"
[string]$appointmentUrl = "https://ais.usvisa-info.com/en-tr/iv/schedule/$scheduleId/payment"

$firstResponse = Invoke-WebRequest -Uri $appointmentUrl `
    -SessionVariable firstSession `
    -Headers @{
    "User-Agent"                = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36"
    "Accept"                    = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
    "Accept-Encoding"           = "gzip, deflate, br"
    "Accept-Language"           = "en-US,en;q=0.9"
    "Cache-Control"             = "no-cache"
    "Origin"                    = "https://ais.usvisa-info.com"
    "DNT"                       = "1"
    "Pragma"                    = "no-cache"
    "Sec-Fetch-Dest"            = "document"
    "Sec-Fetch-Mode"            = "navigate"
    "Sec-Fetch-Site"            = "none"
    "Sec-Fetch-User"            = "?1"
    "Upgrade-Insecure-Requests" = "1"
    "sec-ch-ua"                 = "`"Google Chrome`";v=`"117`", `"Not;A=Brand`";v=`"8`", `"Chromium`";v=`"117`""
    "sec-ch-ua-mobile"          = "?0"
    "sec-ch-ua-platform"        = "`"macOS`""
}

$firstResponse.Content -match '<meta name="csrf-token" content="([^"]+)"' | Out-Null
$csrfToken = $matches[1]

$loginRequestHeaders = @{
    "User-Agent"         = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36"
    "Accept"             = "*/*;q=0.5, text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
    "Accept-Encoding"    = "gzip, deflate, br"
    "Accept-Language"    = "en-US,en;q=0.9"
    "Cache-Control"      = "no-cache"
    "DNT"                = "1"
    "Cookie"             = $firstResponse.Headers['Set-Cookie'] -join '; '
    "Origin"             = "https://ais.usvisa-info.com"
    "Pragma"             = "no-cache"
    "Referer"            = $loginUrl
    "Sec-Fetch-Dest"     = "empty"
    "Sec-Fetch-Mode"     = "cors"
    "Sec-Fetch-Site"     = "same-origin"
    "X-CSRF-Token"       = $csrfToken
    "X-Requested-With"   = "XMLHttpRequest"
    "sec-ch-ua"          = "`"Google Chrome`";v=`"117`", `"Not;A=Brand`";v=`"8`", `"Chromium`";v=`"117`""
    "sec-ch-ua-mobile"   = "?0"
    "sec-ch-ua-platform" = "`"macOS`""
}

$loginResponse = Invoke-WebRequest -UseBasicParsing -Uri $loginUrl `
    -Method "POST" `
    -Headers  $loginRequestHeaders `
    -ContentType "application/x-www-form-urlencoded; charset=UTF-8" `
    -Body "user%5Bemail%5D=$email&user%5Bpassword%5D=$password&policy_confirmed=1&commit=Sign+In"

$paymentResponse = Invoke-WebRequest -UseBasicParsing -Uri $appointmentUrl `
    -Headers @{
    "User-Agent"                = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36"
    "Accept"                    = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
    "Accept-Encoding"           = "gzip, deflate, br"
    "Accept-Language"           = "en-US,en;q=0.9"
    "Cache-Control"             = "no-cache"
    "DNT"                       = "1"
    "Cookie"                    = $loginResponse.Headers['Set-Cookie'] -join '; '
    "Pragma"                    = "no-cache"
    "Referer"                   = $loginUrl
    "Sec-Fetch-Dest"            = "document"
    "Sec-Fetch-Mode"            = "navigate"
    "Sec-Fetch-Site"            = "same-origin"
    "Sec-Fetch-User"            = "?1"
    "Upgrade-Insecure-Requests" = "1"
    "sec-ch-ua"                 = "`"Google Chrome`";v=`"117`", `"Not;A=Brand`";v=`"8`", `"Chromium`";v=`"117`""
    "sec-ch-ua-mobile"          = "?0"
    "sec-ch-ua-platform"        = "`"macOS`""
}

if ($paymentResponse.Content -match "There are no available appointments") {
    Write-Host "No available appointments."
}
else {
    Write-Host "Appointments available."
}
