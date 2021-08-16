#Install NtObjectManager module
Set-PackageSource -Name PSGallery -Trusted
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module NtObjectManager -Force

mkdir Temp
cd C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.9.5\Downloads\0\Temp

# Source file location
$source1 = 'https://github.com/murpg/winget-windows-2019/raw/master/appx/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
# Destination to save the file
$destination1 = 'C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.9.5\Downloads\0\Temp\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
#Download the file
Invoke-WebRequest -Uri $source1 -OutFile $destination1


$source2 = 'https://github.com/murpg/winget-windows-2019/raw/master/appx/Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx'
# Destination to save the file
$destination2 = 'C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.9.5\Downloads\0\Temp\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx'
#Download the file
Invoke-WebRequest -Uri $source2 -OutFile $destination2


$source3 = 'https://github.com/murpg/winget-windows-2019/raw/master/appx/Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx'
# Destination to save the file
$destination3 = 'C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.9.5\Downloads\0\Temp\Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx'
#Download the file
Invoke-WebRequest -Uri $source3 -OutFile $destination3


Add-AppxPackage -Path .\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -ForceUpdateFromAnyVersion



# Create reparse point 
$installationPath = (Get-AppxPackage Microsoft.DesktopAppInstaller).InstallLocation
Set-ExecutionAlias -Path "C:\Windows\System32\winget.exe" -PackageName "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -EntryPoint "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget" -Target "$installationPath\AppInstallerCLI.exe" -AppType Desktop -Version 3
explorer.exe "shell:appsFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget"

# Create reparse point 
$installationPath = (Get-AppxPackage Microsoft.DesktopAppInstaller).InstallLocation
Set-ExecutionAlias -Path "C:\Windows\System32\winget.exe" -PackageName "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -EntryPoint "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget" -Target "$installationPath\AppInstallerCLI.exe" -AppType Desktop -Version 3
explorer.exe "shell:appsFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget"