#Install NtObjectManager module
Set-PackageSource -Name PSGallery -Trusted
Install-Module NtObjectManager -Force

cd C:\Users\dbgAdmin
mkdir Temp
cd Temp

# Source file location
$source = 'https://github.com/murpg/winget-windows-2019/blob/master/appx.zip'
# Destination to save the file
$destination = 'C:\Users\dbgAdmin\Temp\appx.zip'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination
Expand-Archive -Path appx.zip -DestinationPath C:\Users\dbgAdmin\Temp


Add-AppxPackage -Path .\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -ForceUpdateFromAnyVersion

# Create reparse point 
$installationPath = (Get-AppxPackage Microsoft.DesktopAppInstaller).InstallLocation
Set-ExecutionAlias -Path "C:\Windows\System32\winget.exe" -PackageName "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -EntryPoint "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget" -Target "$installationPath\AppInstallerCLI.exe" -AppType Desktop -Version 3
explorer.exe "shell:appsFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget"