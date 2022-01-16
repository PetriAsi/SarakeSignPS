<#
.SYNOPSIS
Gets sing contact groups members
#>
function Get-SignGroupMember {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        # Group id
        [Parameter(Mandatory=$true,ParameterSetName='Get by ID')]
        [string]
        $id

    )

    begin {
        $api = "/group/$id/members"
    }

    process {
        $result = Invoke-SignApi -api $api -method get
        if ($result.users) {
            $result.users
        }elseif ($result.user) {
            $result.user
        }

    }

    end {

    }
}
