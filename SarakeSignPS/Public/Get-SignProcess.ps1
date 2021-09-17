<#
.SYNOPSIS
Gets signing processes or specific process
#>
function Get-SignProcess {
    [CmdletBinding()]
    param (
        #Process id
        [Parameter(Mandatory=$false)]
        [string]
        $id
    )

    begin {
        $api = "/process"
        if ($id) { $api = $api + "/$id" }
    }

    process {
        $result = (Invoke-SignApi -api $api -method get)
        if ($result.processes) {
            $result.processes
        } elseif ( $result.process) {
            $result.process
        }
    }

    end {

    }
}
