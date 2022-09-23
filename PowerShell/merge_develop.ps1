param(
  [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
  [System.String]
  $b,
  [Parameter(Mandatory=$False, ParameterSetName="C:\Users\cbrdo\Documents\www\app")]
  [System.String]
  $path
)

Write-Host "Changin to location " -NoNewline
Write-Host $path

Set-Location -Path $path

Write-Host "Changing to develop..."
git fetch
git checkout develop
git pull --ff-only

Write-Host "Mergin branch " -NoNewline
Write-Host $b

try {
  git merge --ff-only $b

  if (-not $?) {
    throw "Error with merging.."
  }

  Write-Host "Branch merged"
}
catch {
  {1:<#Do this if a terminating exception happens#>}
}
