<#
.SYNOPSIS
Removes sign request
#>
function Remove-SignRequest {
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
                $api = "/request/$reqid"
                $result = Invoke-SignApi -method DELETE -api $api
                if ($result) {
                    $result
                }
            }
        }
    }

    end {

    }
}
