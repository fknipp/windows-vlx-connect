$RegistryPath = "HKCU:\SOFTWARE\Connect-Vlx"
$SshPrivateKey = $env:USERPROFILE + "\.ssh\vlx_rsa"
$SshPublicKey = $SshPrivateKey + ".pub"
$SshServer = "labx.vlizedlab.at"
$VncPort = 5900