import-module activedirectory 
get-aduser -filter * -properties whencreated,lastlogon,modified
New-ADOrganizationalUnit -Name:"Test2" -Path:"OU=Catuslab,DC=catuslab,DC=com" -ProtectedFromAccidentalDeletion:$true