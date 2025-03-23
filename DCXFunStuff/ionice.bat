@echo off
set /p pkgv3="Put Your Package Name Here >> "
cls
echo ====
echo CLASS = 1-3: 1(realtime), 2(best-effort, default), 3(when-idle)
echo ====
set /p classlvl="Put Your Class Level Here >> "
cls
echo ====
echo LEVEL = 0-7: (0 is highest priority, default = 5)
echo ====
set /p lvlprio="Put Your Level Priority Here >> "
cls 
for /f "tokens=3 delims=:" %%a in ('adb shell pm list packages -U %pkgv3%') do (
adb shell ionice -c %classlvl% -n %lvlprio% -t -p %%a
echo set %%a to idle
)
echo Done , Press Any Button To exit
pause > nul
exit