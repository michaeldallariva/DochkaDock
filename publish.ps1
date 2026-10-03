<#
   Requires the .NET 8 Desktop Runtime on the machine it runs on
  (a one-time, shared install — the .exe prompts with a download link if
  it's missing). See the trimming/deployment note in DochkaDock.csproj
#>
$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

dotnet publish "$root\src\DochkaDock\DochkaDock.csproj" `
    -c Release `
    -r win-x64 `
    --self-contained false `
    -p:PublishSingleFile=true `
    -o "$root\publish"

Write-Host ""
Write-Host "Published to $root\publish\DochkaDock.exe" -ForegroundColor Green
Get-ChildItem "$root\publish" | Format-Table Name, Length -AutoSize
