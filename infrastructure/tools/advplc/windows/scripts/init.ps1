<#
===============================================================================================
                                   SCRIPT - INIT ADVPLC
===============================================================================================
.SYNOPSIS
    SCRIPT FOR INIT ADVPLC
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
    Creation Date:  06/11/2019
#>
#-------------------SET VARIABLES-------------------
#SCRIPT PATH 
$scriptPath = $PSScriptRoot

#--------------------EXECUTION----------------------
& $scriptPath\set_json.ps1
& $scriptPath\set_logs.ps1
& $scriptPath\set_appserver.ps1