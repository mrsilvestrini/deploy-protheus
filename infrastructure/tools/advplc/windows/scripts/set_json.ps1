<#
===============================================================================================
                               SCRIPT - SETUP DEPLOY TOTVS12
===============================================================================================
.SYNOPSIS
    SCRIPT FOR SETUP DEPLOY TOTVS12
.DESCRIPTION
    SET ID
    SET SCRIPT VERSION
    SET SCRIPT PATH    
    SET LEVEL ERROR        
    SET SOURCEPATH
    SET ROOTPATH
    SET INSTALL PATH
    SET ADVPLC EXECUTABLE
    SET INCLUDES
    SET PATH PACKAGES        
    SET LOGFILE     
    SET HISTORIC PATH
    CREATE A JSON
.OUTPUTS
    RECORD A PROCEDURE LOG IN $scriptPath\logs
.NOTES
    Version:        1.1.0
    Author:         MARCOS SILVESTRINI
    Creation Date:  04/11/2019
#>
# ======================================DECLARATIONS===========================================
#SET ID
$id = $null
$id = Get-Date -Format 'yyyyMMddHHmmss'

#SET SCRIPT VERSION
$scriptVersion = $null
$scriptVersion = "1.1.0"

#SET SCRIPT PATH
$scriptPath = $null
$scriptPath = $PSScriptRoot

#LEVEL ERROR - Lever error for execution in powershell
$ErrorActionPreference = 'SilentlyContinue'

#SET PATH RPO - Path rpo file. This file has modify after process
$sourcePath = ($scriptPath | Split-Path -Parent ) + "\apo\"
If (-not(Test-Path $sourcePath)) { New-Item -ItemType Directory  $sourcePath | Out-Null } 

#SET ROOTPATH - Rooth path for advplc.
$rootPath = ($scriptPath | Split-Path -Parent ) + "\protheus_data\"
If (-not(Test-Path $rootPath)) { New-Item -ItemType Directory  $rootPath | Out-Null } 

#SET INSTALL PATH - Path files advplc(.exe, .dll,.ini,etc)
$installPath = ($scriptPath | Split-Path -Parent ) + "\appserver\"
If (-not(Test-Path $installPath)) { New-Item -ItemType Directory  $installPath | Out-Null } 

#SET ADVPLC EXECUTABLE
$advplc = $installPath + "appserver_build.exe"

#SET PATH PACKAGES - Folder for publish packages(.ptm, .prw,etc)
$packagesPath = ($scriptPath | Split-Path -Parent ) + "\packages\"
If (-not(Test-Path $packagesPath)) { New-Item -ItemType Directory $packagesPath | Out-Null }

#SET PATH PATHS - Folder for publish includes(.ch)
$includes = ($scriptPath | Split-Path -Parent ) + "\includes\"
If (-not(Test-Path $includes)) { New-Item -ItemType Directory $includes | Out-Null }

#SET LOGFILE - Path for full log files(advplc,stderr,stdio)
$logPath = ($scriptPath | Split-Path -Parent ) + "\logs\"
If (-not(Test-Path $logPath)) { New-Item -ItemType Directory  $logPath | Out-Null } 

#SET HISTORIC - Folder for save packages apply after process
$historicPath = ($scriptPath | Split-Path -Parent ) + "\historic\"
If (-not(Test-Path $historicPath)) { New-Item -ItemType Directory  $historicPath | Out-Null } 

#CREATE A JASON - Create a json file with variables.
$json = $null
$jsonPath = $null
$jsonFile = $null
$jsonPath = $scriptPath | Split-Path -Parent
$jsonPath = $jsonPath + '\json\'
if (!(Test-Path $jsonPath)) {
    New-Item -ItemType Directory -Path $jsonPath
}
$jsonFile = $jsonPath + 'init.json'
$json = (New-Object PSObject |
    Add-Member -PassThru NoteProperty id $id |        
    Add-Member -PassThru NoteProperty scriptVersion $scriptVersion |
    Add-Member -PassThru NoteProperty scriptPath $scriptPath |                
    Add-Member -PassThru NoteProperty errorActionPreference $ErrorActionPreference |        
    Add-Member -PassThru NoteProperty sourcePath $sourcePath |            
    Add-Member -PassThru NoteProperty rootPath $rootPath |            
    Add-Member -PassThru NoteProperty installPath $installPath |            
    Add-Member -PassThru NoteProperty advplc $advplc |   
    Add-Member -PassThru NoteProperty packagesPath $packagesPath |            
    Add-Member -PassThru NoteProperty includes $includes |  
    Add-Member -PassThru NoteProperty logPath $logPath |            
    Add-Member -PassThru NoteProperty historicPath $historicPath |         
    Add-Member -PassThru NoteProperty jsonFile $jsonFile
)
$json | ConvertTo-Json -Depth 50 | Out-File $jsonFile -Encoding utf8
#===============================================================================================
