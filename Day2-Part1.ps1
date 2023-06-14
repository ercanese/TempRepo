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
Get-Disk | Get-Member
Get-Disk | Select-Object -Property FriendlyName,Size,@{
    n ='SizeGB';
    e = {'{0:N2}' -f ($PSItem.Size / 1GB)}
}

#Processlerden cpu değerini 2 ile çarparak ekranda id ye göre sıralı olacak şekilde Name,id ve cpu değerlerini görelim.

Get-Process | 
    Select-Object -Property Name,ID,CPU,@{
        n ='CPUx2';
        e = {$_.cpu * 2}
    } | Sort-Object -Property ID



Get-ChildItem -Path C:\Ansible

New-TimeSpan -Start  "11/6/2022  10:57 AM" -End (Get-Date) | Select-Object -ExpandProperty Days
Get-Service -Name ALG | Select-Object -ExpandProperty Name

(New-TimeSpan -Start  "11/6/2022  10:57 AM" -End (Get-Date)).Days

(Get-Service -Name ALG).Name


Get-ChildItem -Path C:\Ansible | Get-Member

Get-ChildItem -Path C:\Ansible | Select-Object -Property Name,LastWriteTime,LastAccessTime,CreationTime

Get-ChildItem -Path C:\Ansible -Recurse | Select-Object -Property Name,@{
    n = 'LastWriteTimeDays';
    e = {  (New-TimeSpan -Start $PSItem.LastWriteTime -End (Get-Date)).Days }
},
@{
    n = 'LastAccessTimeDays';
    e = {  (New-TimeSpan -Start $PSItem.LastAccessTime -End (Get-Date)).Days }
},
@{
    n = 'CreationTimeDays';
    e = {  (New-TimeSpan -Start $PSItem.CreationTime -End (Get-Date)).Days }
}

#Processlerin ekranda name path ve ne zaman başlatıldığını dakika olarak gösteren ve bu dakikaya göre sıralayan komutu yazalım.
Get-Process | Get-Member
Get-Process | Select-Object -Property Name,Path,@{
    n = 'ProcessAge';
    e = {(New-TimeSpan -Start $PSItem.starttime -End (Get-Date)).TotalMinutes}
} | Sort-Object -Property ProcessAge

#Makine üzerindeki yüklü olan hotfixleri getiren cmdleti bulalım ve kaç gün önce hotfixlerin yüklendiğini hesaplayan kodu yazalım.
Get-Command -Verb * -Noun "*Hotfix*"
Get-HotFix | Select-Object -Property HotFixID,Description,@{
    n='HotfixAge';
    e={ (New-TimeSpan -Start $PSItem.InstalledOn).Days}
} | Sort-Object -Property HotfixAge




#Where-Object
Get-Process | Where-Object {$PSItem.CPU -ge 10} | Sort-Object -Property CPU
Get-Process | Where-Object {$PSItem.Name -like "*Teams*"}

Get-Process -Name *Teams*

#Durmuş olan servisleri isme göre tersten ekranda sadece name,status ve starttype değeri olacak şekilde listeleyelim.
Get-Service | 
    Where-Object {$PSItem.Status -eq "Stopped"} | 
        Sort-Object -Property NAme -Descending | 
            Select-Object -Property NAme,Status,Starttype

#Ip adreslerinden sadece ipv4 olanları ekranda görelim.

Get-NetIPAddress -AddressFamily IPv4
Get-NetIPAddress | Where-Object {$PSItem.AddressFamily -eq "IPv4"}

#IP adreslerinden 127.0. ile başlamayanları ekranda görelim.
Get-NetIPAddress | Where-Object {$PSItem.IPv4Address -notlike "127.0*"}

#Volumelerden DriveType fixed olanları ekranda size ve sizeremaining hesaplanmış şekilde driveletter ile beraber görelim.

Get-Volume | Where-Object {$PSItem.DriveType -eq "Fixed"} |
    Select-Object -Property Driveletter,@{
        n='SizeGB';
        e={$PSItem.size / 1GB}
    },
    @{
        n='SizeRemainingGB';
        e={$PSItem.SizeRemaining / 1GB}
    }


Get-Service | Where-Object {$PSItem.Status -eq "Stopped" -and $PSItem.StartType -eq "automatic"} #| Where-Object {$PSItem.StartType -eq "Automatic"}