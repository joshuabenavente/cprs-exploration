[CmdletBinding()]
param([ValidateSet(18)][int]$Milestone = 18, [switch]$CodeOnly,
      [switch]$Bootstrap, [switch]$Matrix, [string]$Python = 'python')
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$binary = Join-Path $root 'target/debug/cprs-chart-mock.exe'
if (Get-Process -Name 'cprs-chart-mock' -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $binary }) {
    throw 'Close the mock before rebuilding or validating.'
}
$arguments = @((Join-Path $PSScriptRoot 'validate_m18_functional.py'), '--milestone', '18')
if ($CodeOnly) { $arguments += '--code-only' }
if ($Bootstrap) { $arguments += '--bootstrap' }
if ($Matrix) { $arguments += '--matrix' }
& $Python @arguments
if ($LASTEXITCODE -ne 0) { throw 'M18 validation failed; inspect validation/milestone-18/functional-100/windows.' }
