<#
.SYNOPSIS
    Remove data stored for Connect-Vlx
.DESCRIPTION
    This command removes the generated files and registry entries of 
    Connect-Vlx.
#>

# Source constants and functions from other files
. .\constants.ps1
. .\functions.ps1

Remove-Username
Remove-SshKeys


