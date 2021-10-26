function Get-SignRequestRecipient {
    [CmdletBinding()]
    param (
        # request id
        [Parameter(Mandatory=$true)]
        [string]
        $id
    )

    begin {
        $api = "/request/$id"
    }

    process {
        $result = Invoke-SignApi -api $api -Body $body  -method get
        if ($result.request.phases.recipients) {
            $result.request.phases.recipients
        }
    }

    end {

    }
}
