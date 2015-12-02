# Setup PowerShell profile
if ($profile) {
    # Create profile
    if (!(Test-Path $profile)) {
        Write-Output 'PowerShell profile does not exist, creating.';
        $profile_dir = Split-Path $profile;

        if (!(Test-Path $profile_dir)) {
            mkdir $profile_dir > $null;
        }

        # Create new file by writing empty string to a path
        '' > $profile;
        Write-Success 'PowerShell profile created.';
    }

    # Update profile
    Write-Output 'Updating PowerShell profile.';
    $profile_content = Get-Content $profile;
    if (($profile_content | Select-String 'Remove-Item') -eq $null) {
        $content = 'echo Works';
        $content + @($profile_content) > $profile;
        Write-Success 'PowerShell profile updated successfully. Please restart PowerShell.';
    }
} else {
    Write-Warning 'PowerShell $profile variable does not exist. Setup is unable to add start up scripts.';
}