# Disable Windows Driver WHCP Certification Policy

## Overview

This repository provides a PowerShell (.ps1) script designed to automate the process of disabling the Windows security policy that blocks the loading of drivers due to Windows Hardware Compatibility Program (WHCP) Certification enforcement.

## Background

Following the security updates initiated in April 2026, Windows enforces stricter requirements for kernel-mode drivers, often blocking those that rely on legacy cross-signing instead of modern WHCP certification. This can prevent legacy hardware or software from functioning correctly.

This script follows the official procedures documented by Microsoft to bypass these specific driver loading restrictions.

Technical Reference: This script implements the policy removal method described in the Microsoft Support: [The Windows Driver Policy](https://support.microsoft.com/en-us/windows/the-windows-driver-policy-ecd2a78c-750c-415d-93f2-e37302ce0443) article (refer to the "How do I turn off the Windows Driver Policy?" section).

## How use it

- Restart your computer and enter the BIOS, set Secure Boot to disabled
- Download `disable-WHCP.ps1` to `C:\`
- launch `PowerShell` as an `Administrator`.
- Restart your computer and enter the BIOS, re-enable Secure Boot

Windows **PowerShell** input:

```bash
cd C:\
Unblock-File -Path "./disable-WHCP.ps1"     # request allow execution this .ps1
./disable-WHCP.ps1
```
