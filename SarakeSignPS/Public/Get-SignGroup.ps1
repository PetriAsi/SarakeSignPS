<#
.SYNOPSIS
Gets sing contact group members
#>
function Get-SignGroup {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        # Group id
        [Parameter(Mandatory=$true,ParameterSetName='Get by ID')]
        [string]
        $id,
        # Keywords search
        [Parameter(Mandatory=$false,ParameterSetName='Search')]
        [string]
        $keywords

    )

    begin {
        $api = "/group"
        if ($id ) { $api = $api + "/$id"}
        $body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters

    }

    process {
        $result = Invoke-SignApi -api $api -body $body -method get
        if ($result.groups) {
            $result.groups
        }elseif ($result.group) {
            $result.group
        }

    }

    end {

    }
}
