---
external help file: SarakeSignPS-help.xml
Module Name: SarakeSignPS
online version:
schema: 2.0.0
---

# Add-SignRequestRecipient

## SYNOPSIS
Adds recipient to signing request

## SYNTAX

```
Add-SignRequestRecipient [-id] <String> [[-phaseNumber] <Int32>] [-recipient] <String> [[-readonly] <Boolean>]
 [[-firstName] <String>] [[-lastName] <String>] [[-title] <String>] [[-organizationName] <String>]
 [[-languageCode] <String>] [[-phoneNumber] <String>] [[-attributes] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Adds Directory user, Contact , New invitation or Contact Group to signing request

## EXAMPLES

### EXAMPLE 1
```
Add recipient from email or contact list with email
Add-SignRequestRecipient  -id '130000000000001d' -recipient someone@somedomain.com
```

### EXAMPLE 2
```
Add new invite with email
Add-SignRequestRecipient  -id '130000000000001d' -recipient someonenew@somedomain.com -firstName New -lastName Invite -title 'Boss' -organizationName "New company" -phoneNumber '+3582345654345'
```

## PARAMETERS

### -attributes
custom attributes for recipient(not supported yet by api)

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -firstName
First name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -id
Id of request

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -languageCode
Preferred language code ISO 639-2

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: Fin
Accept pipeline input: False
Accept wildcard characters: False
```

### -lastName
last name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -organizationName
Organization name

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -phaseNumber
Phase number

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -phoneNumber
Phone number

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -readonly
Readonly user

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -recipient
Recipient's identifier.
This value can be anything of the following
- Directory users: user object ID, user ID (uid) or email address
- User's contact: contact object ID or email address
- New invitation: email address
- User's contact group: contact group object ID

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -title
Title

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
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
