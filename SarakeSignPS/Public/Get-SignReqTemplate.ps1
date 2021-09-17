<#
.SYNOPSIS
Gets requestemplate
#>
function Get-SignReqTemplate {
    [CmdletBinding()]
    param (
       #Template id
       [Parameter(Mandatory=$false)]
       [string]
       $id
    )

    begin {

        $api = '/reqtemplate'
        if ($id) {$api = $api + "/$id"}
    }

    process {
       Invoke-SignApi -api $api -method GET
    }

    end {

    }
}
