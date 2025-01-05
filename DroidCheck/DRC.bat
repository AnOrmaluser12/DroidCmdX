@echo off
adb shell getprop > props.txt
for /f "tokens=* delims=" %%i in (props.txt) do (
    echo %%i | findstr /r "^\[.*log\.tag.*\].*" >nul
    if not errorlevel 1 (
        echo %%i | findstr /i "persist" >nul
        if errorlevel 1 echo %%i
    )
)
del props.txt
pause
