Set-Location (Split-Path $MyInvocation.MyCommand.Path)

Get-ChildItem * -Include *.zip -Recurse |Where-Object { $_.Name} |ForEach-Object { 

$zname = (Get-Item $_.Name).BaseName

$zname2 = ".iso" 
$zname3 = $zname+$zname2
$zname4 = ".zip"
$zname7 = $zname+$zname4
$zname5 = """"+$zname3+""""
$zname6 = """"+$zname+""""

Expand-Archive -LiteralPath $_.Name -DestinationPath ".\"
Remove-Item -Path .\$zname7
Invoke-Expression ".\extract-xiso.exe $zname5"
Remove-Item -Path .\$zname3
Invoke-Expression ".\extract-xiso.exe -c $zname6"
Remove-Item -Path .\$zname -Force -Recurse


}