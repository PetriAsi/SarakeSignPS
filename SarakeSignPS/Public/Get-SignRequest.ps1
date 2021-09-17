<#
.SYNOPSIS
Get signing request
#>
function Get-SignRequest {
    [CmdletBinding()]
    param (
        # Request id
        [Parameter(Mandatory=$false)]
        [string]
        $id,

        #0 = All requests , 1 = Received by the current user, 2 = Sent by the current user
        [Parameter(Mandatory=$false)]
        [int]
        $mode=0,
        #0 = Draft,1 = Waiting for the current user,2 = Waiting for other users,3 = Completed requests, 4 = Aborted requests
        [Parameter(Mandatory=$false)]
        [int]
        $status,
        #Indicates whether requests from all users should be shown
        [Parameter(Mandatory=$false)]

        [switch]
        $showAll
    )

    begin {
        $api = "/request"
        if ($id) { $api = $api +"/$id"}
        $body = @{ 'mode' = $mode }
        if ($showAll) { $body.showAll = $true}
        if ($status -ne $null) { $body.status = $status}
    }

    process {
        $result = Invoke-SignApi -api $api -Body $body  -method get
        if ($result.requests) {
            $result.requests
        } elseif ($result.request) {
            $result.request
        }
    }

    end {

    }
}
