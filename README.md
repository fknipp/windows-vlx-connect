# Windows integration for Vlized Lab X

This set of PowerShell scripts give the ability to connect a Windows host to [Vlized Lab X environment](https://www.vlizedlab.at/vlexternuser.html). 

## Prerequisites

To use this scripts, a VNC server must be installed and configured:

- Listening on standard port 5900
- No password authentication
- Allow connections from localhost

[TightVNC](https://www.tightvnc.com/) works well.

## Starting the connection

1. Start and configure the VNC server.
1. Download these scripts to local folder.
1. Configure the SSH server in _constants.ps1_.
1. Register your client and connect to the server by calling `.\Connect-Vlx.ps1`

To remove the generated files and registry keys, you may call `.\Remove-VlxData.ps1`.

## Author

Franz Knipp <franz.knipp@fh-burgenland.at>

## License

[GNU General Public License 3](https://www.gnu.org/licenses/gpl-3.0.html)

