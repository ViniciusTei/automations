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

Write-Host "Changing to master..."
git fetch
git checkout master
git pull --ff-only

Write-Host "Creating branch " -NoNewline
Write-Host $b

git checkout -b $b
