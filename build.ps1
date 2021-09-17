param(
    [string[]]$Tasks
)



function Install-Dependency([string] $Name)
{
    $policy = Get-PSRepository -Name "PSGallery" | Select-Object -ExpandProperty "InstallationPolicy"
    if($policy -ne "Trusted") {
        Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
    }

    if (!(Get-Module -Name $Name -ListAvailable)) {
        Install-Module -Name $Name -Scope CurrentUser
    }
}

function Run-Tests
{
    param(
        [string]$Path = "$PSScriptRoot\SarakeSignPS"
    )

    $results = Invoke-Pester -PassThru
    if($results.FailedCount -gt 0) {
       Write-Output "  > $($results.FailedCount) tests failed. The build cannot continue."
       foreach($result in $($results.TestResult | Where-object {$_.Passed -eq $false} | Select-Object -Property Describe,Context,Name,Passed,Time)){
            Write-Output "    > $result"
       }

       EXIT 1
    }
}

function Release
{
    Write-Output "Setting Variables"
    $BuildRoot = $env:CI_PROJECT_DIR
    $releasePath = "$BuildRoot\Release"

    if (-not (Test-Path "$releasePath\SarakeSignPS")) {
        $null = New-Item -Path "$releasePath\SarakeSignPS" -ItemType Directory
    }

    # Copy module
    Copy-Item -Path "$BuildRoot\SarakeSignPS\*" -Destination "$releasePath\SarakeSignPS" -Recurse -Force
    # Copy additional files
    $additionalFiles = @(
        "$BuildRoot\CHANGELOG.md"
        "$BuildRoot\LICENSE"
        "$BuildRoot\README.md"
    )
    Copy-Item -Path $additionalFiles -Destination "$releasePath\SarakeSignPS" -Force


    $manifestContent = Get-Content -Path "$releasePath\SarakeSignPS\SarakeSignPS.psd1" -Raw
    if ($manifestContent -notmatch '(?<=ModuleVersion\s+=\s+'')(?<ModuleVersion>.*)(?='')') {
        throw "Module version was not found in manifest file,"
    }

    $currentVersion = [Version] $Matches.ModuleVersion
    if ($env:CI_JOB_ID) {
        $newRevision = $env:CI_JOB_ID
    }
    else {
        $newRevision = 0
    }
    $version = New-Object -TypeName System.Version -ArgumentList $currentVersion.Major,
    $currentVersion.Minor,
    $newRevision

    Write-Output "New version : $version"

    Update-Metadata -Path "$releasePath\SarakeSignPS\SarakeSignPS.psd1" -PropertyName ModuleVersion -Value $version
    $functionsToExport = Get-ChildItem "$BuildRoot\SarakeSignPS\Public" | ForEach-Object {$_.BaseName}
    Set-ModuleFunctions -Name "$releasePath\SarakeSignPS\SarakeSignPS.psd1" -FunctionsToExport $functionsToExport

    #Remove-Module SarakeSignPS
    Import-Module $env:CI_PROJECT_DIR\SarakeSignPS\SarakeSignPS.psd1 -force -ErrorAction Stop
    Publish-Module -Name SarakeSignPS -Repository InternalPowerShellModules -NuGetApiKey 123456789
}

foreach($task in $Tasks){
    switch($task)
    {
        "test" {
            Install-Dependency -Name "PSScriptAnalyzer"
            Install-Dependency -Name "Pester"
            Write-Output "Running Pester Tests..."
            Run-Tests
        }
        "release" {
            Install-Dependency -Name "Configuration"
            Write-Output "Releasing..."
            Release
        }
    }
}
