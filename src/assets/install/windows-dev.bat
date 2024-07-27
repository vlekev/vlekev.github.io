@echo off

echo Installation de WSL
wsl --install -n

if not exist "C:\Users\vleke\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
	echo Installation de VSCode
	curl -o %HOMEPATH%\Downloads\VSCodeInstaller.exe -L "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
	%HOMEPATH%\Downloads\VSCodeInstaller.exe
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

echo Un redemarrage est necessaire (CTRL+C pour éviter le redemarrage)
pause
shutdown.exe /r /t 00
