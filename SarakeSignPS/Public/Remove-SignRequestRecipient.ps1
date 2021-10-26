function Remove-SignRequestRecipient {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Id of request
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName)]
        [String]
        $id,

        # Recipient id (not user user id)
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
