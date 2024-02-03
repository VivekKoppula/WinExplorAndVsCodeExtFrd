

# Set variables to indicate value and key to set
$RegistryPath = 'HKCU:\Software\Classes\directory\Background\shell'


# Create the key if it does not exist
If (-NOT (Test-Path $RegistryPath)) {
    # New-Item -Path $RegistryPath -Force | Out-Null

    Write-Host "The path ""$($RegistryPath)"" - Does not exist"
    Write-Host "Returning..."
    Return
}  

Write-Host "The registry path ""$($RegistryPath)"" exist"

$VsCodeLoadEnvVar = "HKCU:\Software\Classes\directory\Background\shell\VsCodeLoadEnvVar"
$VsCodeLoadEnvVarCommand = "HKCU:\Software\Classes\directory\Background\shell\VsCodeLoadEnvVar\command"


If (Test-Path -Path $VsCodeLoadEnvVar) {
    Write-host -f Green "Key Exists!"
    Remove-Item -Path $VsCodeLoadEnvVar -Force -Verbose
}
Else {
    Write-host -f Yellow "Key doesn't Exists! So attempting to creating this."
    New-Item -Path $VsCodeLoadEnvVar -Value "VsCode With EnvVar" -Type ExpandString
    New-ItemProperty -Path $VsCodeLoadEnvVar -Name "Icon" -Value "C:\Users\koppviv\AppData\Local\Programs\Microsoft VS Code\Code.exe" -PropertyType ExpandString -Force
    New-Item -Path $VsCodeLoadEnvVarCommand -Value '%comspec% /c "C:\Users\koppviv\AppData\Local\Programs\Microsoft VS Code\LaunchVsCodeWithVsEnvVarsLoaded.bat"' -Type ExpandString 
}






