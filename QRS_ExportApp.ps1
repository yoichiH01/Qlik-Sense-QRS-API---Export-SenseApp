####################################################################################
#v1.0 Author Yoichi Hirotake
#Example on how export/download app. Pls change the code based on your environment. 
#This code is NOT supported by Qlik.
####################################################################################


$FQDN = "QlikServer1.domain.local"
#$FQDN
$appid = "ea28b19d-591b-4736-94a6-5ae572cd37e8"
$exporedtFolderPath= "C:\yheTemp\"
$exportedAppName = "OperationMonitor"
#$appid
$hdrs = @{}
$hdrs.Add("X-Qlik-Xrfkey","examplexrfkey123")
$hdrs.Add("X-Qlik-User", "UserDirectory=Domain;UserId=Administrator")
#$hdrs
$xrfkey="examplexrfkey123"
#$xrfkey
$cert = Get-ChildItem -Path "Cert:\CurrentUser\My" | Where {$_.Subject -like '*QlikClient*'}
#$cert


add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

$StartTime = Get-Date
Write-Host "Start Time is:" $StartTime
$export1of2 = Invoke-RestMethod -Uri "https://$($FQDN):4242/qrs/App/$($appid)/export?xrfkey=$($xrfkey)" -Method Get -Headers $hdrs -ContentType 'application/json' -Certificate $cert
#$export1of2

$return = $export1of2 | Out-String
$ticket = $return  -replace "`r`n",''
#$ticket
$ticket =$ticket -replace "-----",''
$ticket =$ticket -replace "value",''
$ticket = $ticket.trim()
#$ticket
$expoert2of2 = Invoke-RestMethod -Uri "https://$($FQDN):4242/qrs/download/App/$($appid)/$($ticket)/abc.qvf?xrfkey=$($xrfkey)" -Method Get -Headers $hdrs -ContentType 'application/json' -Certificate $cert -OutFile "$($exporedtFolderPath)\$($exportedAppName).qvf"

$EndTime = Get-Date
Write-Host "Finishedt Time is:" $EndTime