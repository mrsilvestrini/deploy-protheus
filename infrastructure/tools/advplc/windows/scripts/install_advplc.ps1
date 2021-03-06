<#
===============================================================================================
                                   SCRIPT - INSTALL ADVPLC
===============================================================================================
.SYNOPSIS
    SCRIPT FOR INSTALL ADVPLC
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
    Creation Date:  05/10/2019
#>
#-------------------SET VARIABLES-------------------
#SCRIPT PATH 
$scriptPath = $PSScriptRoot

#--------------------IMPORTS-----------------------
Import-Module -DisableNameChecking $scriptPath\Get-JSon.psm1

#--------------------EXECUTION----------------------
#Extract File
$progressPreference = 'SilentlyContinue'
$zipPath=($scriptPath | Split-Path -Parent) +"\appserver\"
$zipFile=$zipPath + "appserver.zip"
Expand-Archive -LiteralPath $zipFile -DestinationPath $zipPath -Force

#INSTALL ADCPLC
& $scriptPath\init.ps1
