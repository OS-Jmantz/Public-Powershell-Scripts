$BitLocker_Status=(Get-BitLockerVolume -MountPoint "C:").VolumeStatus

if ($BitLocker_Status -eq "FullyDecrypted") {
    Write-Host "Bitlocker is not enabled, enabling now..."
    Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes256 -TpmProtector -UsedSpaceOnly -SkipHardwareTest
    Write-host "Bitlocker Encryption currently in progress."
}

if ($BitLocker_Status -eq "EncryptionInProgress"){
    Write-Host "Encryption is currently in progress, drive is $((Get-BitlockerVolume -MountPoint "C:").EncryptionPercentage)% encrypted"
}   else {
    Write-Host "Bitlocker is already enabled and drive is fully encrypted."
}
