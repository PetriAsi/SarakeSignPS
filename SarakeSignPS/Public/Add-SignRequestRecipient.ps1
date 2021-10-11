<#
    .SYNOPSIS
    Adds recipient to signing request

    .DESCRIPTION
    Adds Directory user, Contact , New invitation or Contact Group to signing request

    .EXAMPLE
    Add recipient from email or contact list with email
    Add-SignRequestRecipient  -id '130000000000001d' -recipient someone@somedomain.com

    .EXAMPLE
    Add new invite with email
    Add-SignRequestRecipient  -id '130000000000001d' -recipient someonenew@somedomain.com -firstName New -lastName Invite -title 'Boss' -organizationName "New company" -phoneNumber '+3582345654345'

    #>

function Add-SignRequestRecipient {
    [CmdletBinding()]
    param (
        # Id of request
        [Parameter(Mandatory=$true)]
        [String]
        $id,

        # Phase number
        [Parameter(Mandatory=$false)]
        [int]
        $phaseNumber=0,

        # Recipient's identifier. This value can be anything of the following
        # - Directory users: user object ID, user ID (uid) or email address
        # - User's contact: contact object ID or email address
        # - New invitation: email address
        # - User's contact group: contact group object ID
        [Parameter(Mandatory=$true)]
        [string]
        $recipient,

        # Readonly user
        [Parameter(Mandatory=$false)]
        [bool]
        $readonly=$false,

        # First name
        [Parameter(Mandatory=$false)]
        [String]
        $firstName,

        # last name
        [Parameter(Mandatory=$false)]
        [String]
        $lastName,

        #Title
        [Parameter(Mandatory=$false)]
        [string]
        $title,

        #Organization name
        [Parameter(Mandatory=$false)]
        [string]
        $organizationName,

        #Preferred language code ISO 639-2
        [Parameter(Mandatory=$false)]
        [string]
        $languageCode='fin',

        #Phone number
        [Parameter(Mandatory=$false)]
        [string]
        $phoneNumber

    )

    begin {


        $api = "/request/"+$id+"/add"
        $body  = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters -DefaultExcludeParameter 'id','debug','verbose','firstName','lastName','title','organizationName','languageCode','phoneNumber'
        if($null -eq $body['readonly']) {
            $body['readonly'] = $false
        }

        if($null -eq $body['readonly']) {
            $body['readonly'] = $false
        }
        $fields = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters -DefaultExcludeParameter 'id','phaseNumber','readonly','recipient','debug','verbose'
        if ($fields.Count -gt 1) {
            $body['fields'] = $fields
        }

    }

    process {
        Invoke-SignApi -api $api -body $body -method 'PATCH'
    }

    end {

    }
}
