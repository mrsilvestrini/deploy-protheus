<#
===============================================================================================
                                SCRIPT - COMPILE PRW
===============================================================================================
.SYNOPSIS
    SCRIPT FOR COMPILE PRW FILES
.DESCRIPTION
    AUTOMATION FOR COMPILE PRW FILES
    USE ADVPLC
    FOR MORE DETAILS:
    https://tdn.totvs.com/pages/viewpage.action?pageId=397381004    
.OUTPUTS
    RPO WITH PRW APPLY
.NOTES
    Version:        1.0.0
    Author:         MARCOS SILVESTRINI
    Creation Date:  07/11/2019
#>
#-------------------SET VARIABLES-------------------
#SCRIPT PATH 
$scriptPath = $PSScriptRoot

#--------------------IMPORTS-----------------------
Import-Module -DisableNameChecking $scriptPath\Get-JSon.psm1

#--------------------EXECUTION----------------------
#INIT ADVPLC
& $scriptPath\init.ps1

#GET OBJECT JSON
$pathJson = $null
$pathJson = $scriptPath | Split-Path -Parent
$pathJson = $pathJson + '\json\'
$objJson = $null
$objJson = Get-JSON -path $pathJson
$jsonfile = $objJson.jsonFile

#SET PACKAGES
$package = $null
$package = ((Get-ChildItem $objJson.packagesPath -Filter *.prw* | Sort-Object LastWriteTime -Descending)[0]).FullName 
If ($null -ne $package) {
    #APPEND INFOS IN JSON FILE 
    $objJson | Add-Member -Type NoteProperty -Name 'package' -Value $package -Verbose -Force
    $objJson | ConvertTo-Json -Depth 50 | Set-Content $jsonfile -Encoding UTF8   
    
    #GENERATE HISTORIC
    & $scriptPath\generate_historic.ps1          
    $objJson = $null
    $objJson = Get-JSON -path $pathJson    
    $advplc = $objJson.advplc         
    $log_advplc = $objJson.log_advplc
    $log_error = $objJson.log_error
    $log_historic = $objJson.historicLog
    $src = $objJson.installPath
    $includes = $objJson.includes
    
    #BUILD      
    $args = " -compile -files=" + $package + " -includes=" + $includes + " -src=" + $src + " -env=BUILD -outreport"    
    Start-Process  $advplc -WindowStyle Hidden -ArgumentList $args -RedirectStandardOutput $log_advplc -RedirectStandardError $log_error -Wait    
    $contentHistoricLog = Get-Content $log_advplc
    Add-Content -Path   $log_historic -Value $contentHistoricLog
    Invoke-Item $log_advplc    
}
else {
    Add-Content -Path $log_error -Value "Packages not found!!!"
    Write-Host "Packages not found!!!"
}