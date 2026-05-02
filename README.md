# TechCorp AD Lab 🏢

A fully automated Active Directory home lab simulating a real SMB environment.
Built with Windows Server 2022 and PowerShell.

## Lab Architecture

| Machine | IP | Role |
|---------|-----|------|
| DC01 | 192.168.1.10 | Domain Controller, DNS, File & Print Server |
| PC01 | 192.168.1.20 | Windows 10 Client - joined to domain |
| SIEM01 | 192.168.1.30 | Wazuh Security Monitoring |
| Tickets | 192.168.1.40 | osTicket Help Desk |
| VPN | 192.168.1.50 | WireGuard Remote Access |
| Intune | Cloud | MDM Endpoint Management |
| Azure AD | Cloud | Hybrid Identity + Cloud Sync |

## Scripts

| Script | Description |
|--------|-------------|
| ad-setup.ps1 | Creates OUs, users and groups |
| fileprint-setup.ps1 | Creates shared folders and printers |
| gpo-setup.ps1 | Applies Group Policy settings |

## What This Lab Covers

- Active Directory Domain (Windows Server 2022)
- Organizational Units: IT, HR, Finance, Sales, Management
- Users and Security Groups per department
- File Server with shared folders per department
- Print Server with virtual printers
- Group Policy Objects (GPOs) for security
- Wazuh SIEM for security monitoring
- osTicket Help Desk ticketing system
- WireGuard VPN for remote access
- Azure AD Connect for hybrid identity
- Microsoft Intune for endpoint management
- PowerShell automation for all deployment tasks

## Security Policies Applied

| Policy | Target |
|--------|--------|
| Password complexity + 90-day expiry | All users |
| Screen lock after 10 minutes | IT department |
| USB storage disabled | Finance department |

## Skills Demonstrated

Active Directory PowerShell Group Policy Windows Server 2022
Azure AD Microsoft Intune Wazuh SIEM WireGuard VPN
osTicket File Server Print Server Hybrid Identity

## Screenshots

### Active Directory
![AD Users](screenshots/AD-Users.png)

### Wazuh SIEM
![Wazuh Agents](screenshots/Wazuh-Agents.png)
![Wazuh Alerts](screenshots/Wazuh-Alerts.png)

### osTicket Help Desk
![osTicket](screenshots/osTicket-Dashboard.png)

### Azure AD
![Azure AD](screenshots/Azure-AD-Users.png)

### WireGuard VPN
![VPN](screenshots/WireGuard-Active.png)

### Microsoft Intune
![Intune](screenshots/Intune-Devices.png)
