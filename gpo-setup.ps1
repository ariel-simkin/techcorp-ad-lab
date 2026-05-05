# ========================================
# TechCorp - Group Policy Setup
# ========================================

Install-WindowsFeature -Name GPMC -IncludeManagementTools
Write-Host "Group Policy Tools installed" -ForegroundColor Green

$Domain = "techcorp.local"

$GPOs = @(
    @{Name="IT-Policy";         OU="IT"},
    @{Name="HR-Policy";         OU="HR"},
    @{Name="Finance-Policy";    OU="Finance"},
    @{Name="Sales-Policy";      OU="Sales"},
    @{Name="Management-Policy"; OU="Management"}
)

foreach ($GPO in $GPOs) {
    New-GPO -Name $GPO.Name -Domain $Domain
    New-GPLink -Name $GPO.Name -Target "OU=$($GPO.OU),DC=techcorp,DC=local"
    Write-Host "Created GPO: $($GPO.Name)" -ForegroundColor Cyan
}

Set-ADDefaultDomainPasswordPolicy `
    -Identity $Domain `
    -MinPasswordLength 10 `
    -PasswordHistoryCount 5 `
    -MaxPasswordAge 90.00:00:00 `
    -LockoutThreshold 5
Write-Host "Password policy applied" -ForegroundColor Yellow

Set-GPRegistryValue -Name "IT-Policy" `
    -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" `
    -ValueName "ScreenSaveTimeOut" -Type String -Value "600"

Set-GPRegistryValue -Name "Finance-Policy" `
    -Key "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" `
    -ValueName "Start" -Type DWord -Value 4

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  TechCorp GPO Setup Complete!         " -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
