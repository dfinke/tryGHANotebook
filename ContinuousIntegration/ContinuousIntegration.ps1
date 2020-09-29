$PSVersionTable

$modules = @("PowerShellNoteBook")

foreach ($module in $modules) {
    Write-Host "Installing $module" -ForegroundColor Cyan
    Install-Module $module -Force -SkipPublisherCheck
    Import-Module $module -Force -PassThru
}

# foreach ($notebook in Get-ChildItem . *.ipynb) {    
#     $fileName = Split-Path $notebook.FullName -leaf
#     $fileName = 'new-' + $fileName
#     $outputFullName = "$($pwd.Path)\$fileName"
#     Invoke-ExecuteNotebook -InputNotebook $notebook.FullName -OutputNotebook $outputFullName -Parameters @{a = 30 }
# }

Get-ChildItem . *.ipynb | ForEach-Object {
    $notebook = $_
    $fileName = Split-Path $notebook.FullName -leaf
    $fileName = 'new-' + $fileName
    $outputFullName = "$($pwd.Path)\$fileName"
    Invoke-ExecuteNotebook -InputNotebook $notebook.FullName -OutputNotebook $outputFullName -Parameters @{a = 30 }
}