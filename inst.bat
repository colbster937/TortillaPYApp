@echo off
set r=%random%
set rrrrr=%r%%random%%random%%random%%random%
cd %temp%
if exist "%cd%\%rrrrr%\" (
	del -r "%cd%\%rrrrr%"
	mkdir "%cd%\%rrrrr%"
) else (
	mkdir "%cd%\%rrrrr%"
)
cd %rrrrr%
curl.exe -o python-3.12.2-amd64.exe https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe
start /WAIT python-3.12.2-amd64.exe /passive /simple /quiet
del /q /f python-3.12.2-amd64.exe
cls
py -m "pip install PyQt5 PyQtWebEngine tk pyautogui --break-system-packages"
cls
curl.exe -o main.py https://raw.githubusercontent.com/colbychittenden/TortillaPYApp/main/main.py
cd "%USERPROFILE%"
if exist "%cd%\Tortilla%r%\" (
	del -r "%cd%\Tortilla%r%"
	mkdir "%cd%\Tortilla%r%"
) else (
	mkdir "%cd%\Tortilla%r%"
)
cd Tortilla%r%
echo Set objShell = WScript.CreateObject("WScript.Shell") > "start.vbs"
echo objShell.Run "%USERPROFILE%\Tortilla%r%\start.bat", 0, True >> "start.vbs"
echo @echo off > "start.bat"
echo py "%USERPROFILE%\Tortilla%r%\main.py" >> "start.bat"
cd "%temp%\%rrrrr%\"
move "main.py" "%USERPROFILE%\Tortilla%r%\main.py"
cls
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%USERPROFILE%\Desktop\Tortilla%r%.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%USERPROFILE%\Tortilla%r%\start.vbs" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
start /WAIT CreateShortcut.vbs > NUL
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Tortilla%r%.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%USERPROFILE%\Tortilla%r%\start.vbs" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
start /WAIT CreateShortcut.vbs
del CreateShortcut.vbs
cd %temp%
rmdir %rrrrr%
cd %USERPROFILE%\Tortilla%r%
start start.vbs
exit