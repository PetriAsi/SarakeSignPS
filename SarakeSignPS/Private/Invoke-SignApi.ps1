function Invoke-SignApi {
    [CmdletBinding()]
    param (
        #api path
        [string]
        $api,
        #request body
        [System.Collections.Hashtable]
        $body = @{},
        [string]
        $method='GET'
    )

    begin {
        $apiuri = "$($script:siteinfo.url)$api"
        $header = @{
            "Authorization" = "Bearer $(ConvertFrom-SecureString -AsPlainText -SecureString $script:siteinfo.token )"
            "Accept" = "application/json"
        }
        if ($method -ne 'GET' -and $null -eq $body['file'] ) {
            [string]$body = [System.Collections.Hashtable]$body | ConvertTo-Json -Depth 7
            $header['Content-Type'] = 'application/json'
        }

    }

    process {
        if ($null -eq $body['file']) {
            Invoke-RestMethod -Uri $apiuri -Method $method -Body $body -Headers $header
        } else {
            Invoke-RestMethod -Uri $apiuri -Method $method -Form $body -Headers $header

        }
    }

    end {

    }
}
