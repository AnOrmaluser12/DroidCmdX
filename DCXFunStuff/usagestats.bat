@echo off
chcp 65001 > nul
for /f "tokens=2 delims=:" %%a in ('adb shell pm list package') do (
adb shell cmd usagestats clear-last-used-timestamps %%a
echo %%a ━ clear last used!
)
adb shell cmd activity clear-debug-app
adb shell cmd activity clear-exit-info
adb shell cmd activity clear-watch-heap all
pause 