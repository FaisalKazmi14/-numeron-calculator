@echo off
setlocal
echo ===================================================
echo     NUMERON ULTRA PREMIUM - INSTALLER
echo ===================================================
echo.
echo Installing Numeron Ultra to your Desktop...
echo.

set "SCRIPT_DIR=%~dp0"
set "INDEX_PATH=%SCRIPT_DIR%index.html"
set "SHORTCUT_PATH=%USERPROFILE%\Desktop\Numeron Ultra.lnk"

:: Create a VBScript to generate the shortcut
set "VBS_SCRIPT=%TEMP%\CreateShortcut.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") > "%VBS_SCRIPT%"
echo sLinkFile = "%SHORTCUT_PATH%" >> "%VBS_SCRIPT%"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%VBS_SCRIPT%"
echo oLink.TargetPath = "%INDEX_PATH%" >> "%VBS_SCRIPT%"
echo oLink.Description = "Numeron Ultra Premium Calculator" >> "%VBS_SCRIPT%"
echo oLink.IconLocation = "shell32.dll,302" >> "%VBS_SCRIPT%"
echo oLink.Save >> "%VBS_SCRIPT%"

:: Run the VBScript
cscript //nologo "%VBS_SCRIPT%"

:: Clean up
del "%VBS_SCRIPT%"

echo.
echo Installation Complete!
echo You can now launch Numeron Ultra from your Desktop.
echo.
pause
