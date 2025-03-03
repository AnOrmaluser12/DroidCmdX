@echo off
for /f "tokens=2 delims=:" %%a in ('adb shell pm list package') do (
adb shell cmd package log-visibility --disable %%a
echo Log disabled : %%a
)
pause