@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
::
::
adb shell dumpsys deviceidle sys-whitelist | findstr /R "^[ ]*[a-zA-Z0-9_.]*,[0-9]*$" > temp.txt
for /f "tokens=1 delims=," %%A in (temp.txt) do (
    echo %%A | findstr /I "gms shell ims downloads" > nul
    if errorlevel 1 (
        adb shell dumpsys deviceidle sys-whitelist -%%A
    ) else (
        echo %%A Is Protected
    )
)
del temp.txt
pause
