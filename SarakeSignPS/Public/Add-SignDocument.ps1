<#
.SYNOPSIS
Attach document to signing request

.DESCRIPTION
Uploads and attach document to signing request.

.EXAMPLE
Add-SignDocument -id '130000000000001d' -file  some.pdf -data (New-SignDocumentMetadata)

Adds a document to signing request

.EXAMPLE
Add-SignDocument -id '130000000000001d' -file  some.pdf -data (New-SignDocumentMetadata -signatureMode NotSigned)

Adds a document as attachment to signing request. Attachments are not signed.



#>

function Add-SignDocument {
    [CmdletBinding()]
    param (
        # Request id
        [Parameter(Mandatory=$false)]
        [string]
        $id,
        # Document to attach
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ -PathType Leaf})]
        [string]
        $file,
        # Document metadata
        [Parameter(Mandatory=$true)]
        [System.Collections.IDictionary]
        $data
        )

    begin {
        $api = "/document/$id"
        $Body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters
        $Body['data']=  $Body['data'] | ConvertTo-Json -Depth 5

        if ($Body['file']) {$Body['file']= get-item $body['file']}

    }

    process {
        Invoke-SignApi -api $api -method 'POST' -body $Body
    }

    end {

    }
}
