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
        $method='GET',
        #save to file
        [string]
        $OutFile
    )

    begin {
        $apiuri = "$($script:siteinfo.url)$api"
        $header = @{
            "Authorization" = "Bearer $(ConvertFrom-SecureString -AsPlainText -SecureString $script:siteinfo.token )"
            "Accept" = "application/json"
        }
        if ($method -ne 'GET' -and $null -eq $body['file'] ) {
            [string]$body = [System.Collections.Hashtable]$body | ConvertTo-Json -Depth 7
            write-debug "Body: $body"
            $header['Content-Type'] = 'application/json'
        }

    }

    process {
        $params = @{
            "Uri"       = $apiuri
            "Method"    = $method
            "Headers"   = $header
        }

        if ($null -eq $body['file']) {
            $params["Body"]      = $body
        } else {
            $params["Form"]      = $body
        }

        if ($OutFile) {
            $params['OutFile'] = $OutFile
        }

        Invoke-RestMethod @params

    }

    end {

    }
}
