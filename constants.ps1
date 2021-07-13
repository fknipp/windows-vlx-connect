$RegistryPath = "HKCU:\SOFTWARE\Connect-Vlx"
$SshPrivateKey = $env:USERPROFILE + "\.ssh\vlx_rsa"
$SshPublicKey = $SshPrivateKey + ".pub"
$SshServer = "labx.ditm.at"
#$SshServer = "bs1"
$VncPort = 5900