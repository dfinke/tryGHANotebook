$PSVersionTable

$modules = @("PowerShellNoteBook")

foreach ($module in $modules) {
    Write-Host "Installing $module" -ForegroundColor Cyan
    Install-Module $module -Force -SkipPublisherCheck
    Import-Module $module -Force -PassThru
}

foreach ($notebook in Get-ChildItem ..\*.ipynb) {
    Invoke-ExecuteNotebook -InputNotebook $_.FullName
}