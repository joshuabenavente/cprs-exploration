[CmdletBinding()]
param([ValidateSet(15)][int]$Milestone = 15, [switch]$CodeOnly,
      [switch]$Bootstrap, [switch]$Matrix, [string]$Python = 'python')
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) {
    throw 'Close the mock before rebuilding or validating.'
}
$arguments = @((Join-Path $PSScriptRoot 'validate_m15.py'), '--milestone', '15')
if ($CodeOnly) { $arguments += '--code-only' }
if ($Bootstrap) { $arguments += '--bootstrap' }
if ($Matrix) { $arguments += '--matrix' }
& $Python @arguments
if ($LASTEXITCODE -ne 0) { throw 'M15 validation failed; inspect validation/milestone-15/windows.' }
