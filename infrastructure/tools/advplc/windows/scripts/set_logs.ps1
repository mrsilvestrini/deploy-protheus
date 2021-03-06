<#
===============================================================================================
                                SCRIPT - SET LOGS APPLY PATCHS 
===============================================================================================
.SYNOPSIS
    SCRIPT FOR SET LOGS APPLY PATCHS 
.DESCRIPTION
    
.OUTPUTS
    LOG FILES WITH OUTPUT PROCESS
.NOTES
    Version:        1.0.0
    Author:         MARCOS SILVESTRINI
    Creation Date:  04/11/2019
#>
#-------------------SET VARIABLES-------------------
#SCRIPT 
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

#SET LOGS
#$id = $objJson.id
$log_advplc = $objJson.logPath + "log_advplc.log"
$log_error = $objJson.logPath + "log_error.log"
$consoleLog = $objJson.logPath + "consoleLog.log"
Out-File $log_advplc
Out-File $log_error
Out-File $consoleLog

#APPEND INFOS IN JSON FILE
$objJson | Add-Member -Type NoteProperty -Name 'log_advplc' -Value $log_advplc
$objJson | Add-Member -Type NoteProperty -Name 'log_error' -Value $log_error
$objJson | Add-Member -Type NoteProperty -Name 'consoleLog' -Value $consoleLog
$objJson | ConvertTo-Json -Depth 50 | Set-Content $jsonfile -Encoding UTF8