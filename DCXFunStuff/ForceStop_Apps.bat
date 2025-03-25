@echo off
for /f "tokens=2 delims=:" %%a in ('adb shell cmd package list packages') do (
adb shell cmd activity force-stop %%a > nul 2>&1
adb shell am kill-all --user 0 %%a
echo Forcestop : %%a
)
adb shell am kill-all
adb shell am kill-all --user 0 all
adb shell am kill-all --user 0 current 
