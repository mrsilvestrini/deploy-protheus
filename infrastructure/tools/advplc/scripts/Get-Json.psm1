<#
===============================================================================================
.SYNOPSIS
     FUNCTION FOR TASKS JSON FILES
.DESCRIPTION
     FUNCTION FOR TASKS RELATED THE JSON FILES AND VALUES
.NOTES
    Version:        1.1.0
    Author:         MARCOS SILVESTRINI
    Creation Date:  04/11/2019    
#>
#=======================================GET JSON OBJECT=========================================
Function Get-JSON {
    [CmdletBinding()]
    Param(               
        [Parameter (Mandatory = $true)]$path
    )
    Begin {          
        $jsonFiles = $null
        $jsonFile = $null
        $objJson = $null
    }
    Process {
        Try {
            If (Test-Path $path) {                
                $jsonFiles = Get-ChildItem $path -Filter *.json | Sort-Object LastWriteTime -Descending
                If ($null -ne $jsonFiles) {                    
                    $jsonFile = $jsonFiles[0].FullName                    
                    $objJson = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json
                }
                Else {
                    Write-Host "JSON FILES NOT FOUND"                
                }
            }
            Else {
                Write-Host "JSON PATH NOT FOUND"                
            }
        }
        catch [Exception] {
            Write-Host $_.Exception.GetType().FullName, $_.Exception.Message
            $Error.ToString()
        }
    }    
    End {             
        return $objJson
    }
}
Export-ModuleMember -Function Get-JSON