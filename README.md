## How to install WINGET-CLI on Windows 2019  

Have you seen the latest Windows Package Manager? It is meant to eventually run like some of the faboulous Linux packagers. Or the nice open source Windows package manager Chocolatey. Why another Windows package manager you ask? Well this Windows package manager will be baked into the Windows OS. Currently it is only available on Windows 10. And only a certain version of Windows 10. With some effort I have been able to get this to work on Windows 2019 server. I have not tested it on Windows 2016 server.

I have bundled the 3 Windows files that it takes to get this to work in this file. appx.zip.   

1. Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx
2. Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx
3. Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

### Install NtObjectManager module
Set-PackageSource -Name PSGallery -Trusted
Install-Module NtObjectManager -Force

```
Add-AppxPackage -Path .\Microsoft.VCLibs.140.00.UWPDesktop_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.VCLibs.140.00_8wekyb3d8bbwe.appx
Add-AppxPackage -Path .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -ForceUpdateFromAnyVersion

# Create reparse point 
$installationPath = (Get-AppxPackage Microsoft.DesktopAppInstaller).InstallLocation
Set-ExecutionAlias -Path "C:\Windows\System32\winget.exe" -PackageName "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -EntryPoint "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget" -Target "$installationPath\AppInstallerCLI.exe" -AppType Desktop -Version 3
explorer.exe "shell:appsFolder\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe!winget"

