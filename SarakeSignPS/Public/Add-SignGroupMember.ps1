<#
.SYNOPSIS
Gets sing contact groups members
#>
function Add-SignGroupMember {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        # Group id
        [Parameter(Mandatory=$true,ParameterSetName='by ID')]
        [string]
        $id,
        # Member
        [Parameter(Mandatory=$true,ParameterSetName='by ID')]
        [string]
        $memberId

    )

    begin {
        $api = "/group/$id/add/$memberId"
        $body = @{ 'memberId' = $memberId}
    }

    process {
        $result = Invoke-SignApi -api $api -method patch
        if ($result.group) {
            $result.group
        }
    }

    end {

    }
}
