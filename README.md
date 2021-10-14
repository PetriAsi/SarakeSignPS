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
```powershell
$req = New-SignRequest -process '0d00000000000001'
```

### Set request properties
```powershell
Set-SignRequest -id $req.id -title 'Testing 123' -description 'Testing from SarakeSignPS' -sendMail $true -combineDocuments $true  -validProofTypes ADVANCED -proofScope 'Invitees only'
```

### Add recipient
```powershell
Add-SignRequestRecipient -id $req.id -phaseNumber 0 -recipient somecompanyuser@company.domain.com

Add-SignRequestRecipient -id $req.id -phaseNumber 0 -recipient someexternaluser@externaldomain.com -firstName Some -lastName User -title 'Test user' -organizationName ExternalOrg
```

### Add documents to request
```powershell
Add-SignDocument -id $req.id -file some_document.pdf -data (New-SignDocumentMetadata) -title "Contract"
Add-SignDocument -id $req.id -file some_other_document.docx -data (New-SignDocumentMetadata) -title "Some word document"
```

### Start signing request
```powershell
Start-SignRequest $req.id
```
