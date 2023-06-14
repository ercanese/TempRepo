$Users = Get-Content -Path C:\temp\TbbPwsh\Compurersdemo.txt
foreach ($item in $Users)
{
    $Mail = $item + "@bilgeadam.com"
    Write-Host "$Mail"
}

$UsersCSV = Import-Csv -Path C:\temp\TbbPwsh\Users.csv


foreach ($item in $UsersCSV)
{
    $Email = $item.Name.Trim().tolower() + "." +  $item.surName.ToLower() + "@bilgeadam.com"
    $Email | Out-File -FilePath C:\temp\TbbPwsh\mail.txt -Append 
}


Invoke-Sqlcmd -ServerInstance SQL01 -Database ITM -Username sa -Password 123 -Query "
    SELECT * FROM Users 
"

Invoke-Command -ComputerName LON-DC -Credential bilgeadam\ercan.ese -ScriptBlock {
    Start-Process -FilePath notepad

}