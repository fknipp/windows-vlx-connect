#region Persistent username
function Get-Username {
    $value = Get-ItemProperty -ErrorAction SilentlyContinue -Path $RegistryPath -Name Username

    if ($value) {
        $value.Username
    } else {
        $Username = Read-Host -Prompt "Please enter your vlx user name"
        Set-Username $Username
        $Username
    }
}

function Set-Username {
    param (
        [string] $NewUsername
    )
    New-Item -Force $RegistryPath | Out-Null
    Set-ItemProperty $RegistryPath -Name Username -Value $NewUsername | Out-Null
}

function Remove-Username {
    Remove-Item -ErrorAction SilentlyContinue $RegistryPath
}
#endregion


#region Management of SSH keys
function Test-SshKeys {
    (Test-Path $SshPrivateKey) -and (Test-Path $SshPublicKey)
}

function New-SshKeys {
    ssh-keygen.exe -q -t rsa -f $SshPrivateKey -N [String]::Empty
}

function Publish-SshKeys {
    $PublicKey = Get-Content $SshPublicKey
    $Command = "register '" + $PublicKey + "'"
    Invoke-SshCommand $Command
}

function Remove-SshKeys {
    Remove-Item -ErrorAction SilentlyContinue $SshPrivateKey
    Remove-Item -ErrorAction SilentlyContinue $SshPublicKey
}
#endregion

#region VNC
function Test-ListenerOnVncPort {
    $Connection = Get-NetTCPConnection -ErrorAction SilentlyContinue -LocalPort $VncPort
    $Connection.State -eq "Listen"
}
#endregion

#region SSH connection
function Invoke-SshCommand {
    param (
        [string] $Command,
        [string[]] $Arguments = ("")
    )
    $Username = Get-Username
    $Connection = $Username + "@" + $SshServer
    $Arguments
    ssh -i $SshPrivateKey $Arguments $Connection $Command
}

function Get-SshRemotePort {
    $Output = & Invoke-SshCommand "channel"
    $Output
}
function Connect-Ssh {
    [string]$RemotePort = Get-SshRemotePort
    $Arguments = ("-R", ($RemotePort.Trim() + ":127.0.0.1:" + $VncPort))
    Invoke-SshCommand -Arguments $Arguments "loop"
}
#endregion
