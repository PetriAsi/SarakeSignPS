# SarakeSignPS

Powershell api wrapper for Sarake Sign document signing service

## Overview
Powershell commandlest that allow you to connect Sarake Sign, create signing requests,
modify them and download signed documents.
This module requires powershell version 7 to run. It runs nicely side by side with
older one so dont be shy and just [install it](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7.1)

### Features

 - Create , modify and submit signing requests
 - Search users and contacts
 - Upload and download documents

## Installation
Install module from PowerShell gallery

```powershell
Install-Module SarakeSignPS
```

## Examples

### Create connection to Sarake Sign

To setup site with only wilma fuctionality use
```powershell
# Create credential for connection
# Format site url wirh api suffix like "https://sign.somedomain.net/api"
$sitecred = Get-Credential -Message "Use site url as username and apikey as password"

Connect-SarakeSignPS -siteCred $site_cred

# (Optional) Store credential to file for later use
$sitecred | Export-Clixml sitecred.xml
```
### Connect with saved credential
```powershell
Connect-SarakeSignPS -siteCred (Import-Clixml sitecred.xml)
```

### Create Signing request
