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

        # convert non get request bodies to json
        # get-request as hastable
        # and file request as multipart/form-data
        if ($method -ne 'GET' -and $null -eq $body['file'] ) {
            [string]$body = [System.Collections.Hashtable]$body | ConvertTo-Json -Depth 7
            write-debug "Body: $body"
            $params['ContentType'] = 'application/json ;charset=utf-8'
            $params["Body"]      = $body
        } elseif ($method -ne 'GET') {
            $params["Body"]      = $body
        }else {
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
