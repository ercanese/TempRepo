$Computers = "LON-DC1","LON-DC2","LON-DC3"

foreach($comp in $Computers)
{
    $comp
}



$Source      = "C:\temp\TbbPwsh"
$Destination = "C:\temp\TbbPwsh\Backup"

$ps1Files    =  Get-ChildItem -Path $Source | Where-Object {$PSItem.Name -like "*.ps1"} #Get-ChildItem -Path $Source -Filter "*.ps1"

foreach ($item in $ps1Files)
{
    Copy-Item -Path $item.FullName -Destination $Destination 
    Write-Host "[VERBOSE][$(Get-Date -Format "ddMMyyyy hh:mm:ss")] Source : $($item.FullName) ====> $($Destination)" -ForegroundColor Cyan
    Start-Sleep -Seconds 1
}

#'{0:ddMMyyyy hh:mm:ss}' -f (Get-Date)