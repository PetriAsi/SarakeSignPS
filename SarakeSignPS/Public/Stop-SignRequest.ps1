<#
.SYNOPSIS
This operation resets the signing request back to Draft status
#>
function Stop-SignRequest {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Request id
        [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName)]
        [string[]]
        $id,
        # Reason for abort
        [Parameter(Mandatory=$true)]
        [string]
        $reason
    )

    begin {
        $body = @{ "reason" = $reason}
    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            foreach ($reqid in $id) {
                $api = "/request/$reqid/abort"
                $result = Invoke-SignApi -method PUT -api $api -body $body
                if ($result) {
                    $result
                }
            }
        }
    }

    end {

    }
}
