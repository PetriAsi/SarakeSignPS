<#
.SYNOPSIS
Gets document information or downloads document

.DESCRIPTION
Gets document information or downloads document to specified path
#>
function Get-SignDocument {
    [CmdletBinding(DefaultParameterSetName='Search')]

    param (
        # id of document
        [Parameter(Mandatory=$true, ParameterSetName='Get by id')]
        [Parameter(Mandatory=$true, ParameterSetName='Download')]
        [String]
        $id,
        # download document
        [Parameter(Mandatory=$true, ParameterSetName='Download')]
        [Switch]
        $download,

        # Path to save documet to
        [Parameter(Mandatory=$false, ParameterSetName='Download')]
        [String]
        $Path = '.',

        # Filename for document, use orginal if empty
        [Parameter(Mandatory=$false, ParameterSetName='Download')]
        [String]
        $Filename = '',

        # Keywords
        [Parameter(Mandatory=$false, ParameterSetName='Search')]
        [String]
        $keywords
    )

    begin {
        $api = '/document'
        if ($id) { $api = "$api/$id"}
        if ($download) {$api = "$api/download"}

        $Body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters -DefaultExcludeParameter "id", "download", 'Path', 'FileName','Debug', 'Verbose'

    }

    process {
        $result = Invoke-SignApi -api $api -method GET -body $Body
        if ($result.documents) {
            $result.documents
        } elseif ($result.document) {
            $result.document
        }
    }

    end {

    }
}
