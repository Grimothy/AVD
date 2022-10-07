$AppName = "Winget 2.38.0-64-bit"
$Destination = "$env:SystemDrive\Invoke-Installs\$AppName"
write-host -ForegroundColor Green "Starting Download"
#Change progress prefences becuase it slows down the invoke-webrequest actions
$ProgressPreference = 'SilentlyContinue'
$Url = "https://github.com/git-for-windows/git/releases/download/v2.38.0.windows.1/Git-2.38.0-64-bit.exe"
$Exe = $Url.Substring($url.LastIndexOf('/')+1)
$DownloadFile = "$destination\$Exe"
New-Item -Path $Destination -ItemType Directory -Force
Invoke-WebRequest -Uri $Url -OutFile $DownloadFile

Write-Host -ForegroundColor Green "Starting Installation of $AppName"
$Exe = $Url.Substring($url.LastIndexOf('/')+1)
Start-Process -Wait -FilePath "$Destination\$Exe" -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES" -PassThru