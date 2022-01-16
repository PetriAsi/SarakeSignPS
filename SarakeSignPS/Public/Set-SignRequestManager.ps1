<#
.SYNOPSIS
Set request managers
#>
function Set-SignRequestManager {
    [CmdletBinding(SupportsShouldProcess)]
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
        $body = @{ 'managers' = [array]$managers }
    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            $result = Invoke-SignApi -api $api -body $body -method patch
            if ($result.request) {
                $result.request
            }
        }
    }

    end {

    }
}
