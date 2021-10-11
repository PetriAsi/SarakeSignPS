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
        # id of request
        [Parameter(Mandatory=$true, ParameterSetName='Get by request')]
        [String]
        $request,

        # download document by id or all documents from request
        [Parameter(Mandatory=$true, ParameterSetName='Download')]
        [Parameter(Mandatory=$false, ParameterSetName='Get by request')]
        [Switch]
        $download,

        # Path to save document(s) to
        [Parameter(Mandatory=$false, ParameterSetName='Download')]
        [Parameter(Mandatory=$false, ParameterSetName='Get by request')]
        [String]
        $Path = '.',

        # Keywords
        [Parameter(Mandatory=$false, ParameterSetName='Search')]
        [String]
        $keywords
    )

    begin {
        $api = '/document'
        if ($id) { $api = "$api/$id"}

        $Body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters -DefaultExcludeParameter 'id', 'download', 'request', 'Path', 'FileName','Debug', 'Verbose'
        if ($request) {
            $api = "/request/$request"
            $body = @{ "mode" = 0
                        "status" = 0
                    }
        }

    }

    process {
        #get document metadata results
        $result = Invoke-SignApi -api $api -method GET -body $Body

        if ($result.documents) {
            $result = $result.documents
        } elseif ($result.document) {
            $result= $result.document
        } elseif ($result.request.documents) {
            $result= $result.request.documents
        }

        if ($download) {
            #download and save files
            foreach ($doc in $result) {
                Write-Verbose "Downloading file id:  $($doc.id) , title : $($doc.title) to path : $path"
                $fullfilename = (Split-Path (Join-Path -Path $Path -ChildPath $doc.title) -LeafBase) + '.pdf'
                Write-Verbose "Downloading file id:  $($doc.id) , title : $($doc.title) to path : $fullfilename"

                Invoke-SignApi -api "/document/$($doc.id)/download" -method GET -OutFile $fullfilename
                $fullfilename
            }
        } else {
            $result
        }
    }

    end {

    }
}
