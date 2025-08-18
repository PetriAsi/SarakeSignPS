<#
.SYNOPSIS
Set sing user a
#>
function Set-SignUser {
    [CmdletBinding(DefaultParameterSetName='Search')]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true,ParameterSetName='Set by ID')]
        [string]
        $id,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $userId,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $firstName,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $lastName,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $title,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $organizationName,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $emailAddress,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $languageCode,
        [Parameter(Mandatory=$false,ParameterSetName='Set by ID')]
        [string]
        $phoneNumber
    )

    begin {
        $api = "/user"
        if ($id ) { $api = $api + "/$id"}
        $Body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters
    }

    process {
        $result = Invoke-SignApi -api $api -body $body -method put
        if ($result) {
            $result
        }

    }

    end {

    }
}
