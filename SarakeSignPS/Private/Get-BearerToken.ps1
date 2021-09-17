function Get-BearerToken {
    [CmdletBinding()]
    param (
        $apikey
    )

    begin {
        Write-Verbose "Get-BearerToken: begin"
        $header = @{"Accept" = "application/json"}
        $body = (@{"token" = $apikey} | ConvertTo-Json)
       }

    process {
        try {
            $result = Invoke-RestMethod -Uri "$($script:siteinfo.url)/login/token" -Method Post -ContentType "application/json" -Headers $header -Body $body
            if ($result.token ) {
                Write-Verbose "Get-BearerToken: got token"
                ConvertTo-SecureString -AsPlainText -String $result.token
            }
        }
        catch {
           throw "Get-BearerToken: Cannot get token from api."
        }
    }

    end {

    }
}

