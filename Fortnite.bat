@echo off
setlocal
call :setESC

echo %ESC%[36mSTEP 1%ESC%[0m
echo %ESC%[36mBackup GameUserSettings.ini%ESC%[0m
if not exist "%userprofile%\appdata\local\FortniteBackup" mkdir %userprofile%\appdata\local\FortniteBackup
copy "%userprofile%\appdata\local\FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini" "%userprofile%\appdata\local\FortniteBackup"
echo %ESC%[32mBackup Saved%ESC%[0m

echo %ESC%[36mSTEP 2%ESC%[0m
@RD /S /Q "%userprofile%\appdata\local\FortniteGame"
echo %ESC%[32mFortniteGame Deleted%ESC%[0m
echo %ESC%[31m/!\ Open fortnite and close immediately without change settings. /!\%ESC%[0m
pause

echo %ESC%[36mSTEP 3%ESC%[0m
echo %ESC%[36mCopy backup GameUserSettings.ini%ESC%[0m
copy "%userprofile%\appdata\local\FortniteBackup\GameUserSettings.ini" "%userprofile%\appdata\local\FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini"
echo %ESC%[32mCopied%ESC%[0m
pause

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0