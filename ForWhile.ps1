
for($i=0;$i -le 10;$i++){
    
    $i
}


$PasswordL = 16
$PasswordList = @("a","b","A","B","1","4","-","*","j","K","q","Q","o","O")
$Password = @()


for ($i = 1; $i -lt $PasswordL; $i++)
{ 
        $p = Get-Random -InputObject $PasswordList

        #$Password = $Password + $p
        $Password +=  $p
}

$Password -join ''



do{
    Write-Host "Demo"
    Start-Sleep 1
    $Devam = Read-Host "Devam edeyimmi? (y\N)"
}
while($Devam -eq "Y")


while($true){
    
}

