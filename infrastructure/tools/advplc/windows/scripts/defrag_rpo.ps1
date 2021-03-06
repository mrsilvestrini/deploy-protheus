<#
===============================================================================================
                                SCRIPT - DEFRAG RPO
===============================================================================================
.SYNOPSIS
    SCRIPT FOR DEFRAG RPO
.DESCRIPTION
    AUTOMATION FOR DEFRAG RPO
    USE ADVPLC
    FOR MORE DETAILS:
    https://tdn.totvs.com/pages/viewpage.action?pageId=397381004    
.OUTPUTS
    RPO WITH PRW APPLY
.NOTES
    Version:        1.2.0
    Author:         MARCOS SILVESTRINI
    Creation Date:  08/11/2019
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

#SET RPO
$rpo = $null
$rpo = (Get-ChildItem $objJson.sourcePath).FullName
If ($null -ne $rpo) {
    #APPEND INFOS IN JSON FILE 
    $objJson | Add-Member -Type NoteProperty -Name 'rpo' -Value $rpo -Verbose -Force
    $objJson | ConvertTo-Json -Depth 50 | Set-Content $jsonfile -Encoding UTF8    
    #DEFRAG RPO    
    $advplc = $objJson.advplc   
    $log_advplc = $objJson.log_advplc
    $log_error = $objJson.log_error 
    $args = " -console -compile -defragrpo -env=BUILD "    
    Start-Process  $advplc -WindowStyle Hidden -ArgumentList $args -RedirectStandardOutput $log_advplc -RedirectStandardError $log_error -Wait    
}
else {
    Add-Content -Path $log_error -Value "RPO not found!!!"
    Write-Host "RPO not found!!!"
}