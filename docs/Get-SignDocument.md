---
external help file: SarakeSignPS-help.xml
Module Name: SarakeSignPS
online version:
schema: 2.0.0
---

# Get-SignDocument

## SYNOPSIS
Gets document information or downloads document

## SYNTAX

### Search (Default)
```
Get-SignDocument [-keywords <String>] [<CommonParameters>]
```

### Download
```
Get-SignDocument -id <String> [-download] [-Path <String>] [-Filename <String>] [<CommonParameters>]
```

### Get by id
```
Get-SignDocument -id <String> [<CommonParameters>]
```

## DESCRIPTION
Gets document information or downloads document to specified path

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -download
download document

```yaml
Type: SwitchParameter
Parameter Sets: Download
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
Filename for document, use orginal if empty

```yaml
Type: String
Parameter Sets: Download
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -id
id of document

```yaml
Type: String
Parameter Sets: Download, Get by id
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -keywords
Keywords

```yaml
Type: String
Parameter Sets: Search
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path to save documet to

```yaml
Type: String
Parameter Sets: Download
Aliases:

Required: False
Position: Named
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
