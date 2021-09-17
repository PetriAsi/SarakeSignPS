<#
.Synopsis
Powershell api wrapper for Sarake Sign
.Description
Collection api wrappers to work witj Sarake Sign.
#>

#Current session variable

$script:siteinfo=@{'url' = ''
                   'token' = ''
                }

# Dot source public/private functions
$public  = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1')  -Recurse -ErrorAction Stop)
$private = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Private/*.ps1') -Recurse -ErrorAction Stop)

foreach ($import in @($public + $private)) {
    try {
        .  $import.FullName
    } catch {
        throw "Unable to import-module [$($import.FullName)]"
    }
}


