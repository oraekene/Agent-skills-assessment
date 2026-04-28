$ErrorActionPreference = 'Stop'

function Write-Step($message) {
    Write-Host ""
    Write-Host "==> $message" -ForegroundColor Cyan
}

$wslCandidates = @(
    (Join-Path $env:WINDIR "Sysnative\wsl.exe"),
    (Join-Path $env:WINDIR "System32\wsl.exe")
)
$wslExe = $wslCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1

Write-Step "Checking Windows version"
[System.Environment]::OSVersion.VersionString | Write-Host

Write-Step "Enabling required Windows features for WSL"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Step "Installing Microsoft.WinGet.Client PowerShell module"
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
Import-Module Microsoft.WinGet.Client

Write-Step "Bootstrapping WinGet/App Installer"
Repair-WinGetPackageManager -AllUsers

Write-Step "Refreshing App Installer registration"
Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

Write-Step "Verifying winget availability"
try {
    winget --version
} catch {
    Write-Warning "winget still is not available in this PowerShell session yet. A sign-out or restart may still be needed."
}

Write-Step "Installing Ubuntu through WSL"
if (-not $wslExe) {
    throw "WSL executable not found in Sysnative or System32. A restart may be required before WSL commands become available."
}

try {
    & $wslExe --install -d Ubuntu
} catch {
    Write-Warning $_.Exception.Message
    Write-Warning "If WSL features were just enabled, restart Windows first, then rerun this script."
    throw
}

Write-Step "Final status"
Write-Host "If Windows requests a restart, reboot the machine, then launch Ubuntu once to finish first-run setup."
