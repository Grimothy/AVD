
$testpath =Test-Path -Path $env:SystemDrive\testscript
if ($testpath -eq $true) {Remove-Item -Path $env:SystemDrive\testscript }
#New-Item -ItemType Directory C:\testscript