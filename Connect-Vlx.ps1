<#
.SYNOPSIS
    Connects to Vlized Lab X
.DESCRIPTION
    This command checks the prerequisites for connection to VlizedLab X and
    starts the respective connection over SSH.
#>

# Source constants and functions from other files
. .\constants.ps1
. .\functions.ps1

# vlx-register
if (-not (Test-SshKeys)) {
    "Generating new SSH key and registering it"
    New-SshKeys
    Publish-SshKeys
}

# vlx-connect
if (-not (Test-ListenerOnVncPort)) {
    "VNC server not found."
    "Run TightVNC VNC server."
    return
}

Connect-Ssh


