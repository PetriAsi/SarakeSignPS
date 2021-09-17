<#
.SYNOPSIS
Sets request properties
#>
function Set-SignRequest {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Sign request id
        [Parameter(Mandatory=$true)]
        [string]
        $id,
        # Title
        [Parameter(Mandatory=$false)]
        [string]
        $title,
        # Description
        [Parameter(Mandatory=$false)]
        [string]
        $description,
        # autoAchive
        [Parameter(Mandatory=$false)]
        [bool]
        $autoArchive,
        # sendMail
        [Parameter(Mandatory=$false)]
        [bool]
        $sendMail,
        # combineDocuments
        [Parameter(Mandatory=$false)]
        [bool]
        $combineDocuments

    )

    begin {
        $api = "/request/$id"
        $Body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters
        Write-Verbose "Set-SignRequest body: $($Body | Convertto-json)"

    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            $result = Invoke-SignApi -body $Body -api $api -method 'PUT'
            if ($result.request) {
                $result.request
            }
        }
    }

    end {

    }
}
