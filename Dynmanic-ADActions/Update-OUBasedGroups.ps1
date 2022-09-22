<#
.SYNOPSIS
 
A Script that is used to Dynamically update security groups based off of OU Memberships
 
.DESCRIPTION

A script used to dynamically update security groups memberships based off of objects withing defined organizational unis. 

 
.NOTES
 
File Name:      Update-OUBasedGroups.ps1
Created:        09/22/2022
Last modified:  09/22/2022
Author:         Charles Coulter
PowerShell:     5.1 or above 
Requires:       NA
OS:             Windows Server 2016, Windows Server 2019 and Windows Server 2022
Version:        3.0
Action:         Change variables were needed to fit your needs
Disclaimer:     This script is provided "As Is" with no warranties.
 
.EXAMPLE
 
.\Update-OUBasedGroups.ps1
 
.LINK
  
    NA
    OU=Dynamic-HostPool-Personal,OU=Personal,OU=Nerdio,OU=Catuslab,DC=catuslab,DC=com
    grp-Dynamic-HostPool-Personal
#>
 
## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 

Param (
# OU to query for objects
[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
[String] $OUDistinguishedName,
  # Security Group to Update membership 
[Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
[String] $securityGroup
)

Write-Host -ForegroundColor Green "Building List of AD Group members for the following OU:"
Write-Host -ForegroundColor Magenta "$OUDistinguishedName"
$OUMembers = Get-ADComputer -Filter * -SearchBase $OUDistinguishedName 

foreach ($i in $OUMembers){
Add-ADGroupMember  -Identity $(Get-ADGroup -Identity $securityGroup).DistinguishedName -Members $i.DistinguishedName -Verbose
Write-Host -ForegroundColor Green Added $i.name to group $securityGroup
}
      
    

 