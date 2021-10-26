<#
.SYNOPSIS
Cnvert hashtable to array of hashtables nad name value pairs
#>

function ConvertTo-NameValues {
    [CmdletBinding()]
    param (
        # input hashtable
        [Parameter(Mandatory=$true)]
        [hashtable]
        $hashtable
    )

    begin {
        $output = @()
    }

    process {
        $hashtable.GetEnumerator() | ForEach-Object{
            $toAdd = @{}
            $toAdd['values'] = [array]($_.value)
            $toAdd['name'] = $_.key
            $output += $toAdd.clone()
        }

    }

    end {
        [array]$output
    }
}
