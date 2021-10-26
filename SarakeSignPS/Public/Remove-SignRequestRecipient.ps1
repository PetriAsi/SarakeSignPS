function Remove-SignRequestRecipient {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Id of request
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]
        [String]
        $id,

        # Recipient user id, get ids with Get-SignRequestRecipient
        [Parameter(Mandatory=$true)]
        [string]
        $recipient_id,

        # Phase number
        [Parameter(Mandatory=$false)]
        [int]
        $phaseNumber=0


    )

    begin {
        $api = "/request/$id/remove/$recipient_id/phase/$phaseNumber"
    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            foreach ($reqid in $id) {
                $result = Invoke-SignApi -method PATCH -api $api
                if ($result) {
                    $result
                }
            }
        }
    }

    end {

    }
}
