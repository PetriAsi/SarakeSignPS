<#
.SYNOPSIS
Sends requests to signers
#>
function Send-SignRequest {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Request id
        [Parameter(Mandatory=$true)]
        [string]
        $id
    )

    begin {
        $api="/request/$id/send"
    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            Invoke-SignApi -api $api -method 'PUT' -body @{}
        }
    }

    end {

    }
}
