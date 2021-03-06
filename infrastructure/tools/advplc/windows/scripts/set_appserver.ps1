<#
===============================================================================================
                                   SCRIPT - APPSERVER CFG
===============================================================================================
.SYNOPSIS
    SCRIPT FOR CREATE A APPSERVER.INI IN REAL TIME
.DESCRIPTION
    CREATE FILE APPSERVER.INI IN INSTALL_PATH FOR APPSERVER.EXE   
    
.OUTPUTS
    APPSERVER.INI WITH VALUES DEFAULTS FOR USER ADVPLC
.NOTES
    Version:        1.0.0
    Author:         MARCOS SILVESTRINI
    Creation Date:  04/11/2019
#>
#SCRIPT PATH 
$scriptPath = $PSScriptRoot

#--------------------IMPORTS-----------------------
Import-Module -DisableNameChecking $scriptPath\Get-JSon.psm1

#GET OBJECT JSON
$pathJson = $null
$pathJson = $scriptPath | Split-Path -Parent
$pathJson = $pathJson + '\json\'
$objJson = $null
$objJson = Get-JSON -path $pathJson

$installPath = $objJson.installPath
$sourcePath = $objJson.sourcePath
$rootPath = $objJson.rootPath
$consoleFile = $objJson.consoleLog

$contentAppserver = @"
[BUILD]
SOURCEPATH=$sourcePath
ROOTPATH=$rootPath
STARTPATH=/system/
RPODB=TOP
RPOLANGUAGE=PORTUGUESE
RPOVERSION=120

[DRIVERS]
ACTIVE=TCP
 
[TCP]
TYPE=TCPIP
PORT=1235

[GENERAL]
ConsoleLog=1
ASyncConsoleLog=0
ConsoleFile=$consoleFile
"@
$appserver = $installPath + "appserver_build.ini"
Out-File $appserver
Set-Content -LiteralPath $appserver $contentAppserver