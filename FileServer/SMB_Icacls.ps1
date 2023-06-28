$cred = Get-Credential
$session = New-PSSession -ComputerName FICHIERS -Credential $cred

$Perm = {
    $env:computername
    icacls e:/Partage/ /grant:r *S-1-5-21-4004191931-4134181578-3665843900-512":(OI)(CI)(F)"
    icacls e:/Partage/Achats /grant:r Achats":(OI)(CI)(F)"
    icacls "e:/Partage/Centre d'appel" /grant:r "Centre d'appel:(OI)(CI)(F)"
    icacls e:/Partage/Comptabilité /grant:r Comptabilité":(OI)(CI)(F)"
    icacls e:/Partage/Finance /grant:r Finance":(OI)(CI)(F)"
    icacls e:/Partage/Informatique /grant:r informatique":(OI)(CI)(F)"
    icacls e:/Partage/Ingénierie /grant:r ingénierie":(OI)(CI)(F)"
    icacls e:/Partage/RH /grant:r RH":(OI)(CI)(F)"
    icacls e:/Partage/Ventes /grant:r Ventes":(OI)(CI)(F)"
}

Invoke-Command -Session $session -ScriptBlock $Perm
Exit-Pssession