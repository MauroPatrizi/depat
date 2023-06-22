#--- CSV Import ---#
 
$CSVPath = "utilisateurs.CSV"
$lignes = Import-Csv -Path $CSVPath `
                     -Delimiter ";"
 
foreach ($ligne in $lignes)
{
  $Prenom       = $ligne.FIRSTNAME
  $Nom          = $ligne.LASTNAME
  $Password     = $ligne.PASSWORD
  $Depart       = $ligne.DEPARTEMENT
 
  $Login        = $Nom+$Prenom
  $Path         = "OU=$Depart,OU=DEPAT,DC=DEPAT,DC=LOCAL"
  $mdp          = ConvertTo-SecureString -AsPlainText $Password -Force
 
  
#--- Test if OU exists ---#
  $oucheck = [adsi]::Exists("LDAP://$Path")
 
  if ($oucheck -eq $true) {
  Write-Host "$Path exists ( $oucheck )"
  }
 
  else {
  Write-Host "$Path doesn't exist ( $oucheck )"
 
#--- Ou cration ---#
  New-ADOrganizationalUnit -Name $Depart `
                           -Path "OU=DEPAT,DC=DEPAT,DC=LOCAL" `
                           -ProtectedFromAccidentalDeletion $false
 
#--- Groups creation ---#
  New-ADGroup  		-Name "$Depart" `
                    -GroupScope Global `
                    -GroupCategory Security `
                    -Path "OU=$Depart,OU=DEPAT,DC=DEPAT,DC=LOCAL"
  }
 
 
#--- Users creation ---#
  New-ADUser               -Name $Login `
                           -UserPrincipalName "$Login@depat.local" `
                           -DisplayName "$Prenom $Nom" `
                           -GivenName $Prenom `
                           -SurName $Nom `
                           -Path $Path `
                           -AccountPassword $mdp `
                           -PasswordNeverExpires $true `
                           -Enabled $true
 
  Write-Host "Création de l'utilisateur $Login"
 
  
#--- Permissions configuration ---#
  if ($Depart -eq "Informatique") {
  Add-ADPrincipalGroupMembership -Identity $Login `
                                 -MemberOf $Depart,"Admins du domaine"
  }
  else {
  Add-ADPrincipalGroupMembership -Identity $Login `
                                 -MemberOf $Depart
  }


#--- Folder shares mapping ---#
  Set-ADUser -Identity $Login `
             -HomeDirectory \\fichiers\$Depart `
             -HomeDrive S:
}
