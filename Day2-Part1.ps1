Get-ChildItem -Path C:\Ansible | Get-Member
Get-ChildItem -Path C:\Ansible | Select-Object -Property Name,FullName,Length
Get-Volume | Select-Object -Property Driveletter,Size,SizeRemaining


Get-Volume | 
    Select-Object -Property Driveletter,@{
        n ='SizeGB';
        e = {"Ercan ESE"}   
    },
    @{
        n ='SizeGB1';
        e = {"Ercan ESE"}   
    },
    @{
        n ='SizeGB2';
        e = {"Ercan ESE"}   
    }

Get-Service | Select-Object -Property Name,@{
    n = 'ComputerName';
    e = {hostname}
}

Get-Volume | 
    Select-Object -Property Driveletter,@{
        n ='AlicanGB';
        e = {$PSItem.Size / 1GB}   
    },
    @{
        n ='SizeRemainingGB';
        e = {$PSItem.SizeRemaining / 1GB}   
    }

Get-Volume | 
    Select-Object -Property Driveletter,@{
        n ='AlicanGB';
        e = {[Math]::Round($PSItem.Size / 1GB)}   
    },
    @{
        n ='SizeRemainingGB';
        e = {[Math]::Round($PSItem.SizeRemaining / 1GB)}   
    }


Get-Volume | 
    Select-Object -Property Driveletter,@{
        n ='AlicanGB';
        e = {'{0:N0}' -f ($PSItem.Size / 1GB)}   
    },
    @{
        n ='SizeRemainingGB';
        e = {'{0:N0}' -f ($PSItem.SizeRemaining / 1GB)}   
    }


#Formatting

 '{0:N0}' -f 110.00010



#PowerShellde bir .net classı çağırmak için yapılması gereken.
[Math]::Round(1.5)


#Disk boyutlarını GB cinsinden hesaplayan komutu yazalım ve sıfırlardan arındıralım.
#Processlerden cpu değerini 2 ile çarparak ekranda id ye göre sıralı olacak şekilde Name,id ve cpu değerlerini görelim.

