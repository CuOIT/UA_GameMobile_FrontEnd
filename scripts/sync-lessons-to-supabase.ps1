param(
  [switch]$DryRun,
  [int]$ChunkSize = 5,
  [string]$SupabaseUrl = "",
  [string]$ServiceRoleKey = ""
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$nodeScript = Join-Path $root "scripts\sync-lessons-to-supabase.mjs"

if (-not (Test-Path -LiteralPath $nodeScript)) {
  throw "Missing sync script: $nodeScript"
}

if ([string]::IsNullOrWhiteSpace($ServiceRoleKey)) {
  $ServiceRoleKey = $env:SUPABASE_SERVICE_ROLE_KEY
}

if (-not $DryRun -and [string]::IsNullOrWhiteSpace($ServiceRoleKey)) {
  $secureKey = Read-Host "Paste Supabase secret/service_role key" -AsSecureString
  $bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureKey)
  try {
    $ServiceRoleKey = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
  } finally {
    [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
  }
}

if (-not [string]::IsNullOrWhiteSpace($ServiceRoleKey)) {
  $env:SUPABASE_SERVICE_ROLE_KEY = $ServiceRoleKey
}

if (-not [string]::IsNullOrWhiteSpace($SupabaseUrl)) {
  $env:SUPABASE_URL = $SupabaseUrl
}

$nodeArgs = @($nodeScript, "--chunk-size", "$ChunkSize")
if ($DryRun) {
  $nodeArgs += "--dry-run"
}

Push-Location $root
try {
  node $nodeArgs
} finally {
  Pop-Location
}
