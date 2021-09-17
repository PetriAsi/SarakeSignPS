function Connect-SarakeSignPS {
    [CmdletBinding()]
    param (
        # Site information as PSCredential
        [Parameter(Mandatory=$true)]
        [pscredential]
        $siteCred
    )

    begin {
        $script:siteinfo.url = ($siteCred.GetNetworkCredential().UserName).TrimEnd('/')
        Write-Verbose "Connect-SarakeSignPS: url:  $($script:siteinfo.url)"
    }

    process {
        try{
             $apikey = $siteCred.GetNetworkCredential().Password
             Write-Debug "Connect-SarakeSignPS: apikey:  $apikey"
             $token = Get-BearerToken -apikey $apikey
             Write-Debug "Got token: $token"
             $script:siteinfo.token = $token
        }
        catch {
            throw "Cannot connect to to site"
        }
    }

    end {

    }
}
