@echo off

echo Installation de WSL
wsl --install -n

if not exist "C:\Users\vleke\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
	echo Installation de VSCode
	curl -o %HOMEPATH%\Downloads\VSCodeInstaller.exe -L "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
	%HOMEPATH%\Downloads\VSCodeInstaller.exe
)

if not exist "C:\Users\vleke\AppData\Local\BraveSoftware\Brave-Browser\Application\brave.exe" (
	echo Installation de Brave
	curl -o %HOMEPATH%\Downloads\BraveInstaller.exe -L "https://github.com/brave/brave-browser/releases/latest/download/BraveBrowserSetup.exe"
	%HOMEPATH%\Downloads\BraveInstaller.exe
)

if not exist "C:\Program Files\Docker\Docker\Docker Desktop.exe" (
	echo Installation de DockerDesktop
	curl -o %HOMEPATH%\Downloads\DockerDesktopInstaller.exe -L "https://desktop.docker.com/win/main/amd64/Docker%%20Desktop%%20Installer.exe"
	%HOMEPATH%\Downloads\DockerDesktopInstaller.exe
)

if not exist "C:\Program Files\7-Zip\7zFM.exe" (
	echo Installation de 7Zip
	curl -o %HOMEPATH%\Downloads\7ZipInstaller.exe -L "https://github.com/ip7z/7zip/releases/latest/download/7z2407-x64.exe"
	%HOMEPATH%\Downloads\7ZipInstaller.exe
)

if not exist "C:\Program Files\Unity Hub\Unity Hub.exe" (
	echo Installation de Unity
	curl -o %HOMEPATH%\Downloads\UnityInstaller.exe -L "https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe"
	%HOMEPATH%\Downloads\UnityInstaller.exe
)

if not exist "C:\Program Files\VideoLAN\VLC\vlc.exe" (
	echo Installation de VLC
	curl -o %HOMEPATH%\Downloads\VLCInstaller.exe -L "https://ftp.free.org/mirrors/videolan/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
	%HOMEPATH%\Downloads\VLCInstaller.exe
)

if not exist "C:\Program Files\Inkscape\bin\inkscape.exe" (
	echo Installation de Inkscape
	curl -o %HOMEPATH%\Downloads\InkscapeInstaller.exe -L "https://inkscape.org/gallery/item/44617/inkscape-1.3.2_2023-11-25_091e20e-x64.exe"
	%HOMEPATH%\Downloads\InkscapeInstaller.exe
)

if not exist "C:\Program Files\Oracle\VirtualBox\VirtualBox.exe" (
	echo Installation de Virtualbox
	curl -o %HOMEPATH%\Downloads\VirtualboxInstaller.exe -L "https://download.virtualbox.org/virtualbox/7.0.20/VirtualBox-7.0.20-163906-Win.exe"
	%HOMEPATH%\Downloads\VirtualboxInstaller.exe
)

echo Un redemarrage est necessaire (CTRL+C pour éviter le redemarrage)
pause
shutdown.exe /r /t 00
