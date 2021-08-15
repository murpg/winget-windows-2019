#Install NtObjectManager module
Set-PackageSource -Name PSGallery -Trusted
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module NtObjectManager -Force

Start-Sleep -s 90

cd C:\Users\dbgAdmin
mkdir Temp
cd Temp

# Source file location
$source1 = 'https://github.com/murpg/winget-windows-2019/raw/master/appx/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
# Destination to save the file
$destination1 = 'C:\Users\dbgAdmin\Temp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
#Download the file
Invoke-WebRequest -Uri $source1 -OutFile $destination1

Start-Sleep -s 30

$source2 = 'https://github.com/murpg/winget-windows-2019/raw/master/appx/Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx'
# Destination to save the file
$destination2 = 'C:\Users\dbgAdmin\Temp\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx'
#Download the file
Invoke-WebRequest -Uri $source2 -OutFile $destination2

Start-Sleep -s 30

$source3 = 'https://github.com/murpg/winget-windows-2019/raw/master/appx/Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx'
# Destination to save the file
$destination3 = 'C:\Users\dbgAdmin\Temp\Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx'
#Download the file
Invoke-WebRequest -Uri $source3 -OutFile $destination3

Start-Sleep -s 30

Add-AppxPackage -Path .\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -ForceUpdateFromAnyVersion

Start-Sleep -s 30

# Create reparse point 
$installationPath = (Get-AppxPackage Microsoft.DesktopAppInstaller).InstallLocation
Set-ExecutionAlias -Path "C:\Windows\System32\winget.exe" -PackageName "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -EntryPoint "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget" -Target "$installationPath\AppInstallerCLI.exe" -AppType Desktop -Version 3
explorer.exe "shell:appsFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget"

# Create reparse point 
$installationPath = (Get-AppxPackage Microsoft.DesktopAppInstaller).InstallLocation
Set-ExecutionAlias -Path "C:\Windows\System32\winget.exe" -PackageName "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -EntryPoint "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget" -Target "$installationPath\AppInstallerCLI.exe" -AppType Desktop -Version 3
explorer.exe "shell:appsFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget"