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

#GET OBJECT JSON
$pathJson = $null
$pathJson = $scriptPath | Split-Path -Parent
$pathJson = $pathJson + '\json\'
$objJson = $null
$objJson = Get-JSON -path $pathJson
$jsonfile = $objJson.jsonFile

#GENERATE HISTORIC (PACKAGES AND LOGS)
$logId = $objJson.id + "_log_advplc"
$historicLog = $objJson.log_advplc -replace ("log_advplc", $logId)       
$historicLog = $historicLog -replace ("logs", "historic")    
Copy-Item -Path $objJson.log_advplc  -Destination $historicLog

$package = $objJson.package
$packageName = $package | Split-Path -Leaf
$backup = ($package | Split-Path -Parent) + "\" + $objJson.id + "_" + $packageName -replace ("packages", "historic")
Copy-Item -Path $package -Destination $backup

#APPEND INFOS IN JSON FILE
$objJson | Add-Member -Type NoteProperty -Name 'historicLog' -Value $historicLog -Verbose -Force
$objJson | ConvertTo-Json -Depth 50 | Set-Content $jsonfile -Encoding UTF8