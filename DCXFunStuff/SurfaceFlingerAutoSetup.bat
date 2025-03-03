@echo off
chcp 65001
echo.
echo.
echo                                     ██████╗  ██████╗██╗  ██╗
echo                                     ██╔══██╗██╔════╝╚██╗██╔╝
echo                                     ██║  ██║██║      ╚███╔╝ 
echo                                     ██║  ██║██║      ██╔██╗ 
echo                                     ██████╔╝╚██████╗██╔╝ ██╗
echo                                     ╚═════╝  ╚═════╝╚═╝  ╚═╝
for /f "tokens=3 delims= " %%i in ('adb shell dumpsys SurfaceFlinger ^| findstr "refresh-rate"') do (
    set refresh_rate=%%i
)
set refresh_rate=%refresh_rate: =%
echo Refresh Rate: %refresh_rate%
for /f "delims=" %%i in ('powershell -Command "[math]::Round(1 / %refresh_rate%, 10)"') do set result=%%i

echo 2ndcheck: %result%

for /f "delims=" %%i in ('powershell -Command "[math]::Round(%result% * 1000000000, 0)"') do set final=%%i

echo 2ndCheck: %final%
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%final% / 18.518520, 0)"') do set eaglpos=%%i
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%final% / 8.771929, 0)"') do set apsofs=%%i
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%final% / 4.7619050, 0)"') do set elfpsofsasdasx=%%i
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%final% / 3.7037029 - 1, 0)"') do set elrdur=%%i
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%final% / 3.3333336900, 0)"') do set sfelpoassd=%%i
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%final% / 1.851852 + 1, 0)"') do set rgsmplsa=%%i
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%final% / 0.8771929 -2, 0)"') do set rgstis=%%i

:elrdur
echo adb shell setprop debug.sf.region_sampling_duration_ns %elrdur%
echo adb shell setprop debug.sf.cached_set_render_duration_ns %elrdur%
echo adb shell setprop debug.sf.early.app.duration %elrdur%
echo adb shell setprop debug.sf.early.sf.duration %elrdur%
echo adb shell setprop debug.sf.earlyGl.app.duration %elrdur%
echo adb shell setprop debug.sf.earlyGl.sf.duration %elrdur%

:apsofs
echo adb shell setprop debug.sf.early_app_phase_offset_ns %apsofs%
echo adb shell setprop debug.sf.early_gl_app_phase_offset_ns %apsofs%

:sfelpoassd
echo adb shell setprop debug.sf.early_gl_phase_offset_ns %sfelpoassd%
echo adb shell setprop debug.sf.early_phase_offset_ns %sfelpoassd%

:eaglpos
echo adb shell setprop debug.sf.high_fps_early_app_phase_offset_ns %eaglpos%
echo adb shell setprop debug.sf.high_fps_early_gl_app_phase_offset_ns %eaglpos%


:elfpsofsasdasx
echo adb shell setprop debug.sf.high_fps_early_gl_phase_offset_ns %elfpsofsasdasx%
echo adb shell setprop debug.sf.high_fps_early_phase_offset_ns %elfpsofsasdasx%

:rgstis
echo adb shell setprop debug.sf.region_sampling_timer_timeout_ns %rgstis%



:rgsmplsa
echo adb shell setprop debug.sf.region_sampling_period_ns %rgsmplsa%
echo adb shell setprop debug.sf.phase_offset_threshold_for_next_vsync_ns %rgsmplsa%
echo adb shell setprop debug.sf.high_fps_late_app_phase_offset_ns %rgsmplsa%
echo adb shell setprop debug.sf.high_fps_late_sf_phase_offset_ns %rgsmplsa%
echo adb shell setprop debug.sf.late.app.duration %rgsmplsa%
echo adb shell setprop debug.sf.late.sf.duration %rgsmplsa%
echo Done, Press Any Button To Exit
pause > nul
exit