$env:PSModulePath.Split(';')


Install-Module -Name SqlServer
Get-Command -Verb Get -Noun "*IpAddress*"
Get-Command -Module SqlServer
Get-Command -Verb Get -Noun "*firewall*"
Get-NetFirewallRule
Get-Command -Verb * -Noun "*zabbix*"


#IpAdresslerini listeleyen komutu bulup çalıştırın.
Get-Command -Verb get -Noun "*IPAddress*"
Get-Help -Name Get-NetIPAddress 
Get-NetIPAddress -AddressFamily IPv4 

#Application loglardan en yeni 10 tanesini ekrana getiren cmdleti bulun ve çalıştırın.

Get-Command -Verb get -Noun *Log*
Get-Help -Name get-eventlog -Full
Get-EventLog -LogName Application -Newest 10

#Bilgisayar üzerindeki cachede bulunan dns kayıtlarını getiren komutu bulun ve çalıştırın.
Get-Command -Verb get -Noun "*cache*"
Get-Help -Name Get-DnsClientCache -Full
Get-DnsClientCache -Type A

#Makinenin dns server adreslerini bulan komutu bulun ve çalıştırın.

Get-Command -Verb get -Noun "*dns*"
Get-DnsClientServerAddress

Get-Command -Verb * -Noun Service

Get-Service -Name ALG

Start-Service -Name ALG -PassThru
Stop-Service -Name ALG -PassThru

Get-Process -Nam
Start-Process -FilePath notepad.exe #-RedirectStandardOutput out
Stop-Process -Name Notepad


Get-Process -Name notepad
Stop-Process -Id 185160
Connect-AzAccount
Get-Help -Name Start-Process -Full


Get-Service -Name ALG,BITS


Get-Service -Name ALG
Start-Service -Name ALG


Get-Service -Name ALG | Stop-Service 
Get-Process -Name Notepad
Stop-Process -Name Notepad

Get-Process -Name notepad | Stop-Process 

Get-Service | Get-Member
Get-Process | Get-Member
Get-Process -Name ai

Get-Service |
    Get-Member

Get-Service | 
    Format-Table -Property Name,Machinename,StartType,Status 
Get-Service | 
    Format-List -Property Name,Machinename,StartType,Status 
Get-Service | 
    Format-Wide -Property Name 


Get-Service | Get-Member
Get-Service | Format-Table | Get-Member


Get-Service |
    Select-Object -Property Name,Machinename,StartType,Status 


#Tüm processleri ekranda tablo şeklinde sadece cpu,isim,çalışma pathini ve ne zaman başladığını ekranda gösteren komutu yazalım.
Get-Process | 
    Get-Member
Get-Process | 
    Format-Table -Property NAme,CPU,PAth,Starttime -AutoSize -Wrap

#Ekranda IP adreslerini sadece Ipaddress, adres ailesi ve interfaceindex olacak şekilde liste halinde görelim.
Get-NetIPAddress | Get-Member
Get-NetIPAddress | Format-List -Property IpAddress, AddressFAmily, InterfaceIndex


#Makine üzerinde bulunan lokal firewall kurallarından ekranda isim,grup,Action ve enable olma durumunu göreceğimiz kodu yazalım.
Get-NetFirewallRule | Get-Member
Get-NetFirewallRule  |
     Select-Object -Property ACtion,Enabled,Name,Group


#Makine üzerindeki volumeleri listeleyen komutu bulalım ve ekranda sadece model,partitionstyle, disknumber ve location bilgisini görelim.
Get-Disk | Get-Member
Get-Disk | Select-Object -Property Model,PArtitionStyle,DiskNumber,Location


Get-Volume