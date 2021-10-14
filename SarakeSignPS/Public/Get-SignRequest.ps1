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

        # All requests , Received by the current user or Sent by the current user
        [Parameter(Mandatory=$false)]
        [ValidateSet('All requests','Received by the current user','Sent by the current user')]
        [string]
        $mode='All requests',

        #0 = Draft,1 = Waiting for the current user,2 = Waiting for other users,3 = Completed requests, 4 = Aborted requests
        [Parameter(Mandatory=$false)]
        [ValidateSet('Draft','Waiting for the current user','Waiting for other users','Completed requests','Aborted requests')]
        [string]
        $status,

        #Indicates whether requests from all users should be shown
        [Parameter(Mandatory=$false)]

        [switch]
        $showAll
    )

    begin {
        $api = "/request"
        if ($id) { $api = $api +"/$id"}

        $mode = @{'All requests' = 0; 'Received by the current user' = 1;'Sent by the current user' =2}[$mode]
        $body = @{ 'mode' = $mode }

        if ($showAll) { $body.showAll = $true}
        if ( $null -ne $status) {
            $body.status = @{'Draft' = 0; 'Waiting for the current user' = 1; 'Waiting for other users' = 2; 'Completed requests' = 3; 'Aborted requests' = 4}[$status]
        }
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
