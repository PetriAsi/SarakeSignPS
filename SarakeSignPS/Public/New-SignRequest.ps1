<#
.SYNOPSIS
Creates new sign request
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
