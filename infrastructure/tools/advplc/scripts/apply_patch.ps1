<#
===============================================================================================
                                   SCRIPT - APPLY PATCHS 
===============================================================================================
.SYNOPSIS
    SCRIPT FOR APPLY PATCHS 
.DESCRIPTION
    AUTOMATION FOR APPLY PATCH IN ERP PROTHEUS
    USE ADVPLC FOR APPLY PATH IN RPO
    FOR MORE DETAILS:
    https://tdn.totvs.com/pages/viewpage.action?pageId=397381004    
.OUTPUTS
    RPO WITH PATCH APPLY
.NOTES
    Version:        1.0.0
    Author:         MARCOS SILVESTRINI
    Creation Date:  11/09/2019
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
$package = ((Get-ChildItem $objJson.packagesPath -Filter *.ptm* | Sort-Object LastWriteTime -Descending)[0]).FullName
If ($null -ne $package) {
    #APPEND INFOS IN JSON FILE 
    $objJson | Add-Member -Type NoteProperty -Name 'package' -Value $package -Force
    $objJson | ConvertTo-Json -Depth 50 | Set-Content $jsonfile -Encoding UTF8       
    #GENERATE HISTORIC
    & $scriptPath\generate_historic.ps1          
    $objJson = $null
    $objJson = Get-JSON -path $pathJson    
    $advplc = $objJson.advplc         
    $log_advplc = $objJson.log_advplc
    $log_error = $objJson.log_error
    $log_historic = $objJson.historicLog
    
    #BUILD         
    $args = "-compile -applypatch -files=" + $package + " -env=BUILD"    
    Start-Process  $advplc -WindowStyle Hidden -ArgumentList $args -RedirectStandardOutput $log_advplc -RedirectStandardError $log_error -Wait
    $contentHistoricLog = Get-Content $log_advplc
    Add-Content -Path   $log_historic -Value $contentHistoricLog
    Invoke-Item $log_advplc        
    
}
else {
    Add-Content -Path $log_error -Value "Packages not found!!!"
    Write-Host "Packages not found!!!"
}