function Remove-FileForce {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    if (Test-Path $Path) {
        try {
            Set-ItemProperty -Path $Path -Name IsReadOnly -Value $false
            Remove-Item -Path $Path -Force -ErrorAction Stop
            Write-Host "Successfully deleted: $Path" -ForegroundColor Green
        }
        catch {
            Write-Error "Failed to delete $Path. Reason: $($_.Exception.Message)"
        }
    }
    else {
        Write-Warning "File not found: $Path"
    }
}

# Check for administrator privileges
net session >$null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "Please run as Administrator."
    exit
}

# Check for Secure Boot
if (Confirm-SecureBootUEFI) {
    Write-Error "Please disable Secure Boot in your BIOS/UEFI."
    exit
}

mountvol S: /s

# delete policy files
$dir1 = "S:\EFI\Microsoft\Boot\CiPolicies\Active\"
$dir2 = "$env:windir\System32\CodeIntegrity\CiPolicies\Active\"
$dirs = @($dir1, $dir2)
$cip = @(
    "{784C4414-79F4-4C32-A6A5-F0FB42A51D0D}",
    "{8F9CB695-5D48-48D6-A329-7202B44607E3}")
foreach ($d in $dirs) {
    foreach ($id in $cip) {
        $targetFile = Join-Path -Path $d -ChildPath "$id.cip"
        Remove-FileForce -Path $targetFile
    }
}

mountvol S: /d

Write-Host "done" -ForegroundColor Gray
