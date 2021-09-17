<#
.SYNOPSIS
Gets sing users and contacts
#>
function Get-SignUser {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true,ParameterSetName='Get by ID')]
        [string]
        $id,
        # Keywords search
        [Parameter(Mandatory=$false,ParameterSetName='Search')]
        [string]
        $keywords,
        # Search for users type
        [Parameter(Mandatory=$false,ParameterSetName='Search')]
        [ValidateSet('All users','Users only','Contacts only')]
        [String]
        $mode
    )

    begin {
        $api = "/user"
        if ($id ) { $api = $api + "/$id"}
        $Body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters
        $modes=@{'All users' = 0
                 'Users only' = 1
                 'Contacts only' = 2
        }
        if($Body['mode']) {
            $Body['mode'] = $modes[$Body['mode']]
        }
    }

    process {
        $result = Invoke-SignApi -api $api -body $body -method get
        if ($result.users) {
            $result.users
        }elseif ($result.user) {
            $result.user
        }

    }

    end {

    }
}
