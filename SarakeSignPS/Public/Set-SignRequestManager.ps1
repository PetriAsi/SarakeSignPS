<#
.SYNOPSIS
Set request managers
#>
function Set-SignRequestManager {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        # Request id
        [Parameter(Mandatory=$true,ParameterSetName='by ID')]
        [string]
        $id,
        # Manager
        [Parameter(Mandatory=$true,ParameterSetName='by ID')]
        [string[]]
        $managers

    )

    begin {
        $api = "/request/$id/managers"
        $body = @{ 'managers' = ($managers | convertto-json -AsArray)}
    }

    process {
        $result = Invoke-SignApi -api $api -body $body -method patch
        if ($result.request) {
            $result.request
        }
    }

    end {

    }
}
