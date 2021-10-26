function Invoke-SignApi {
    [CmdletBinding()]
    param (
        #api path
        [string]
        $api,
        #request body
        [AllowEmptyCollection()]
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

        $params = @{
            "Uri"       = $apiuri
            "Method"    = $method
            "Headers"   = $header
        }

        #Send Get request without body
        #and file request as multipart/form-data
        if ($method -ne 'GET' -and $null -eq $body['file'] ) {
            [string]$body = [System.Collections.Hashtable]$body | ConvertTo-Json -Depth 7
            write-debug "Body: $body"
            $header['Content-Type'] = 'application/json'
            $params["Body"]      = $body
        } else {
            $params["Form"]      = $body
        }


        if ($OutFile) {
            $params['OutFile'] = $OutFile
        }
    }

    process {


        Invoke-RestMethod @params

    }

    end {

    }
}
