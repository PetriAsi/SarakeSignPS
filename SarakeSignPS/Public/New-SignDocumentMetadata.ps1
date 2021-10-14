<#
.SYNOPSIS
Gets document metadata object

.DESCRIPTION
Gets document metadata object. Use with Add-SingDocument

#>
function New-SignDocumentMetadata {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Description
        [Parameter(Mandatory=$false)]
        [string]
        $description='',
        # Signaturemode
        [Parameter(Mandatory=$false)]
        [ValidateSet('NotSigned','SignaturePage','SignatureFields')]
        [string]
        $signatureMode='SignaturePage',

        #Confidentiality of the document
        [Parameter(Mandatory=$false)]
        [ValidateSet('Non-confidential','Confidential','Secret')]

        [string]
        $confidentiality='Non-confidential',

        # Title for document
        [Parameter(Mandatory=$false)]
        [string]
        $title='',

        # orderNumber
        [Parameter(Mandatory=$false)]
        [string]
        $orderNumber,

        # Documents ownerId
        [Parameter(Mandatory=$false)]
        [string]
        $ownerId,

        # Extra attributes
        [Parameter(Mandatory=$false)]
        [System.Collections.IDictionary]
        $attributes

    )

    begin {
        $Body = . Get-ParameterValue -Parameters $MyInvocation.MyCommand.Parameters -BoundParameters $PSBoundParameters

        $signatureModes=@{'NotSigned' = 1
                          'SignaturePage' = 2
                          'SignatureFields' = 3}

        $Body['signatureMode'] = $signatureModes[$signatureMode]

        $confidentialitys=@{'Non-confidential' = 0
                            'Confidential' = 1
                            'Secret' = 2}

        $Body['confidentiality'] = $confidentialitys[$confidentiality]
    }

    process {
        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            $Body
        }
    }

    end {

    }
}
