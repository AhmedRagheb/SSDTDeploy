# Set params

$dacpacProfile = $OctopusParameters["dacpacProfile"] 
$TargetConnectionString = $OctopusParameters["TargetConnectionString"] 
 
if (!$TargetConnectionString) {
    throw "Target connection parameter missing!"   
}
 
Write-Host "Deploying database now..." -NoNewline
$dacpac = (Get-Location).Path + "\Content\"+ $dacpacProfile +".dacpac" 
New-Alias -Name sqlpackage -Value "C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\sqlpackage.exe"
sqlpackage /Action:Publish /SourceFile:$dacpac /tcs:$TargetConnectionString /p:BlockOnPossibleDataLoss=false 
 
Write-Host "deployed"