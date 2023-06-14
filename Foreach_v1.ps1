$Services = Get-Service | Where-Object {$PSItem.Status -eq "Stopped" -and $PSItem.StartType -eq "Automatic"}
$LogPath = "C:\Temp\TbbPwsh\"

foreach ($t in $Services)
{
    $FileName = "Log_$(Get-Date -Format "ddMMyyyyhh").txt"

    $FullLog = $LogPath + $FileName
     try 
    {
        Start-Service -Name $t.Name -ErrorAction Stop
        Write-Host "[INFORMATION][$(Get-Date)] Trying Start Service Name ==> $($t.Name)" -ForegroundColor Green

        

        "[INFORMATION][$(Get-Date)] Trying Start Service Name ==> $($t.Name)" | Out-File -FilePath $FullLog
    }
    catch 
    {
        Write-Host "[ERROR][$(Get-Date)] Trying Start Service Name ==> $($t.Name)" -ForegroundColor Red
        "[ERROR][$(Get-Date)] Trying Start Service Name ==> $($t.Name)" | Out-File -FilePath $FullLog
    }


    
    Start-Sleep -Seconds 1
}







$Services |Select-Object -Property Name,StartType


try {

    200/5
}
catch {
    Write-Host "Bölme işlemi yapılrıken bir hata ile karşılaşıldı."
}


New-Item -Path H:\ -Name dsada -ItemType Directory