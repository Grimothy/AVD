



$AppName = "FSLOGIX"
$destination = "$env:SystemDrive\Invoke-Installs\$AppName\zip\"
$Url = "https://download.microsoft.com/download/d/1/9/d190de51-f1c1-4581-9007-24e5a812d6e9/FSLogix_Apps_2.9.8228.50276.zip"
$DownloadZipFile = "$destination" + $(Split-Path -Path $Url -Leaf)
$ExtractPath = "$env:SystemDrive\Invoke-Installs\$AppName\unzip"
New-Item -Path $destination -ItemType Directory -Force
New-Item -Path $ExtractPath -ItemType Directory -Force
Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile
$ExtractShell = New-Object -ComObject Shell.Application 
$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 
$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles) 
Start-Process $ExtractPath

Write-Host -ForegroundColor Green "Starting Installation of $AppName"
Start-Process -Wait -FilePath "$ExtractPath\x64\Release\FSLogixAppsSetup.exe" -ArgumentList "/q" -PassThru