<#
.SYNOPSIS
Creates new contact group

.EXAMPLE
New-SignGroup -groupName 'Some group'

Creates new signing request with specific process id. To get process ids
use Get-SignProcess command.

#>
function New-SignGroup {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Group name
        [Parameter(Mandatory=$true)]
        [string]
        $groupName,
        # Group members
        [Parameter(Mandatory=$true)]
        [string[]]
        $users
    )

    begin {
        $api = "/group"
        $body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters
    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            $result = Invoke-SignApi -method POST -api $api -body $body
            if ($result.request) {
                $result.request
            }
        }
    }

    end {

    }
}
