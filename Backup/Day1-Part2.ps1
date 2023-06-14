#Sıralama Objesi

Get-Process | Sort-Object -Property CPU 
Get-Process | Sort-Object -Property CPU -Descending


Get-Service | Sort-Object -Property Status

Get-Service | Group-Object -Property Status

#Processleri id ye göre tersten sıralayalım.
Get-Process | 
    Sort-Object -Property id -Descending

#IpAdresslerini addressfamily değerine göre gruplayalım.
Get-NetIPAddress | Group-Object -Property AddressFamily

#Servisleri isme göre tersten sıralayalım.

Get-Service | Sort-Object -Property NAme -Descending

Get-Service | Measure-Object

Get-Process | Measure-Object -Property CPU -Sum -Average -Maximum -Minimum

Measure-Command -Expression {
    Get-Process
    Get-Process
    Get-Process
    Get-Process
    Get-Process
}

Get-Service | Select-Object -Property Name,StartType
Get-Service | Select-Object -Unique Status
Get-Service | Select-Object -Skip 10 -First 10 
Get-Service | Select-Object -First 1


get-mailboxdatabase | Sort-Object -Property Size -Descending | Select-Object -First 1
#Bana makinede en çok cpu tüketen processi ekranda sadece CPU ve Name olarak şekilde tek satır gösterin.
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 1 -Property Cpu,Name 