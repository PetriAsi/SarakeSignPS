---
external help file: SarakeSignPS-help.xml
Module Name: SarakeSignPS
online version:
schema: 2.0.0
---

# Add-SignDocument

## SYNOPSIS
Attach document to signing request

## SYNTAX

```
Add-SignDocument [[-id] <String>] [-file] <String> [-data] <IDictionary> [<CommonParameters>]
```

## DESCRIPTION
Uploads and attach document to signing request.

## EXAMPLES

### EXAMPLE 1
```
Add-SignDocument -id '130000000000001d' -file  some.pdf -data (New-SignDocumentMetadata)
```

Adds a document to signing request

### EXAMPLE 2
```
Add-SignDocument -id '130000000000001d' -file  some.pdf -data (New-SignDocumentMetadata -signatureMode NotSigned)
```

Adds a document as attachment to signing request.
Attachments are not signed.

## PARAMETERS

### -data
Document metadata

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -file
Document to attach

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -id
Request id

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
