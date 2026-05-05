# ========================================
# TechCorp - File Server & Print Server
# ========================================

Install-WindowsFeature -Name Print-Server -IncludeManagementTools
Write-Host "Print Server installed" -ForegroundColor Green

$Departments = @("IT","HR","Finance","Sales","Management")

foreach ($Dept in $Departments) {
    $Path = "C:\Shares\$Dept"
    New-Item -ItemType Directory -Path $Path -Force
    New-SmbShare -Name $Dept -Path $Path -FullAccess "TECHCORP\$Dept-Team"
    Write-Host "Created share: \\DC01\$Dept" -ForegroundColor Cyan
}

New-Item -ItemType Directory -Path "C:\Shares\Company" -Force
New-SmbShare -Name "Company" -Path "C:\Shares\Company" -FullAccess "TECHCORP\Domain Users"

Add-PrinterDriver -Name "Generic / Text Only"
Add-Printer -Name "TechCorp-Printer-Floor1" -DriverName "Generic / Text Only" -PortName "LPT1:"
Add-Printer -Name "TechCorp-Printer-Floor2" -DriverName "Generic / Text Only" -PortName "LPT2:"
Write-Host "Printers created" -ForegroundColor Yellow

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  TechCorp File & Print Server Ready!  " -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
