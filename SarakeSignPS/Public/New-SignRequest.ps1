<#
.SYNOPSIS
Creates new sign request

.EXAMPLE
New-SignRequest -process '0d00000000000001'

Creates new signing request with specific process id. To get process ids
use Get-SignProcess command.

#>
function New-SignRequest {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Process id
        [Parameter(Mandatory=$true)]
        [string]
        $process
    )

    begin {
        $api = "/request/$process"
        $body = @{}
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
