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
    Creation Date:  12/09/2019
#>
$scriptPath = $PSScriptRoot
$bin_path = ($scriptPath | Split-Path -Parent ) + "\appserver\"
$sourcePath = ($scriptPath | Split-Path -Parent ) + "\apo\"
$rootPath = ($scriptPath | Split-Path -Parent ) + "\protheus_data\"
$consoleFile = ($scriptPath | Split-Path -Parent ) + "\logs\appserver_build.log"

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
$appserver = $bin_path + "appserver_build.ini"
Out-File $appserver
Set-Content -LiteralPath $appserver $contentAppserver