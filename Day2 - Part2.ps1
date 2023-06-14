$Ercan

$logfile
$LogFile

$LogFile = "C:\Temp\TbbPwsh" 

$Service = Get-Service -Name ALG


$logfile | Get-Member
$Service | Get-Member

$Today = "10/10/2022"
$Today | Get-Member

[datetime]$Today = "10/10/2022"

$Num1 = 10

$Num1 | Get-Member

[int]$Num2 = "20"

$Num2 | Get-Member

[int]$Num3 = "Ben bir sayıyım"

$Num1 = $null

$Service

(Get-Service -Name ALG).Name
$Service.Name

Write-Host "Ercan ESE Naber? $($Service.Name)" -ForegroundColor Cyan

$Demo = "ercan.ese@bilgeadam.com"
$Demo | Get-Member
$Demo.GetType()
$Demo.Length

$Demo.Split('@') | Select-Object -First 1
$Demo.ToUpper()
$Demo.ToLower()
$Demo.Replace('bilgeadam.com','hrthema.com')

$Today | Get-Member

$TodayReal = Get-Date

$TodayRealFormat = $TodayReal.AddDays(-10)




#String bir CustomPath değişkeni oluşturun içindeki değer C:\windows olsun ve bunu kullanarak get-childitem cmdletinde içerisindeki dosya ve klasörleri
#listeleyin.

$CustomPath = "C:\Ansible"
Get-ChildItem -Path $CustomPath


#Bir adet today adında değişken oluşturun ve bu değişken içerisinde bugünün tarihi olsun.
#Bugünün tarihinden 30 gün çıkararak.
#Get-Eventlog cmdleti üzerinde where-object kullanarak son 30 gündeki application logları çekin.

$Today = Get-date
$Today = $Today.AddDays(-30)

Get-EventLog -LogName Application |
    Where-Object {$PSItem.TimeWritten -ge $Today}


#OutputCustomPath adında bir string değişken oluşturun ve Servislerden durmuş olupta starttype automatic olanları export alırken
#bu pathi out-file ile dinamik bir şekilde kullanın.

$OutputcustomPath = "C:\temp\TbbPwsh\Log-11.txt"

Get-Service |
    Where-Object {$PSItem.Status -eq "Stopped" -and $PSItem.StartType -eq "Automatic"} |
        Out-File -FilePath $OutputcustomPath



$TimeDemo = "Ercan"

$Computers = "LON-DC1","LON-DC2","LON-DC3"
$Computers.GetType()
$Computers.Count

$Services = Get-Service -Name ALG,BITS
$Services.GetType()

[array]$NewUser = "Ercan"
$NewUser = $NewUser + "Alican"
$NewUser = $NewUser + "Teslime"

$EmtypArray = @()

[Array]$Emt = ""

$Emt = $Emt + "ssadarffsadadsada"

$EmtypArray = $EmtypArray + "Demo1"

$EmtypArray | Select-Object -First 1 -Skip 1

$EmtypArray[1]

$Services = Get-Service
$Services[100].Name

$Services | Select-Object -Skip 99 -First 1