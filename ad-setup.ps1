# ========================================
# TechCorp - Active Directory Setup
# ========================================

$Domain = "DC=techcorp,DC=local"

# Step 1 - Create Organizational Units
$OUs = @("IT","HR","Finance","Sales","Management")

foreach ($OU in $OUs) {
    New-ADOrganizationalUnit -Name $OU -Path $Domain -ProtectedFromAccidentalDeletion $false
    Write-Host "Created OU: $OU" -ForegroundColor Green
}

# Step 2 - Create Users
$Users = @(
    @{Name="John Smith";    User="jsmith";    Dept="IT"},
    @{Name="Emily Johnson"; User="ejohnson";  Dept="HR"},
    @{Name="Michael Brown"; User="mbrown";    Dept="Finance"},
    @{Name="Sarah Davis";   User="sdavis";    Dept="Sales"},
    @{Name="Robert Wilson"; User="rwilson";   Dept="Management"}
)

foreach ($U in $Users) {
    $Password = ConvertTo-SecureString "Welcome@1234" -AsPlainText -Force
    New-ADUser `
        -Name $U.Name `
        -SamAccountName $U.User `
        -UserPrincipalName "$($U.User)@techcorp.local" `
        -Path "OU=$($U.Dept),$Domain" `
        -Department $U.Dept `
        -AccountPassword $Password `
        -Enabled $true
    Write-Host "Created user: $($U.Name) -> $($U.Dept)" -ForegroundColor Cyan
}

# Step 3 - Create Groups
$Groups = @("IT-Team","HR-Team","Finance-Team","Sales-Team","Management-Team")

foreach ($G in $Groups) {
    New-ADGroup -Name $G -GroupScope Global -Path $Domain
    Write-Host "Created group: $G" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  TechCorp AD - Setup Complete!        " -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
