$Size = 6GB

if($Size -lt 10GB){
    Write-Host "Değer 10 GB den küçük"
}
elseif($Size -lt 20GB)
{
    Write-Host "Değer 20 GB den küçük"
}
elseif($Size -lt 30GB){
Write-Host "Değer 30GB den küçük"
}
else {
    Write-Host "Değer 30GB dan büyük."
}


$Process = Get-Process

foreach ($item in $Process)
{
    if($item.cpu -ge 10){
        Write-Host "$($item.Name)" -ForegroundColor Red
    }
    else
    {
        Write-Host "$($item.Name)" -ForegroundColor Green
    }
}

#Bana çalışan servisleri yeşil çalışmayanları kırmızı olarak erkanda gösterin ve bunları ayrı ayrı log dosyalarında tutun.
$Servisler = Get-Service 

foreach ($item in $Servisler)
{
    if($item.Status -eq "Running")
    {
        Write-Host "$($item.Name)" -ForegroundColor Green
        "$($item.Name)" | Out-File -FilePath C:\temp\TbbPwsh\Running.txt -Append
    }
    else
    {
        Write-Host "$($item.Name)" -ForegroundColor Red
        "$($item.Name)" | Out-File -FilePath C:\temp\TbbPwsh\Stopped.txt -Append
    }
}


#Boslugu kontrol etmek için
""
if($Size -eq $null){}
if([string]::IsNullOrWhiteSpace($Size)){}





