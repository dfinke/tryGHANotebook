$PSVersionTable

$modules = @("PowerShellNoteBook")

foreach ($module in $modules) {
    Write-Host "Installing $module" -ForegroundColor Cyan
    Install-Module $module -Force -SkipPublisherCheck
    Import-Module $module -Force -PassThru
}

Get-ChildItem ..\*.ipynb
foreach ($notebook in Get-ChildItem ..\*.ipynb) {
    $notebook
    # Invoke-ExecuteNotebook -InputNotebook $notebook.FullName
}