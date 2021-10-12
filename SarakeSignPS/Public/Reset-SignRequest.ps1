<#
.SYNOPSIS
This operation resets the signing request back to Draft status
#>
function Reset-SignRequest {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        #Request id
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)]
        [string]
        $id
    )

    begin {

    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            foreach ($reqid in $id) {
                $api = "/request/$reqid/revert"
                $result = Invoke-SignApi -method PUT -api $api
                if ($result) {
                    $result
                }
            }
        }
    }

    end {

    }
}
