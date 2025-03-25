@echo off
for /f %%a in ('adb shell cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq') do set MaxFreq1=%%a
for /f %%a in ('adb shell cat /sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_max_freq') do set MaxFreq4=%%a
for /f %%b in ('powershell -command "[math]::Round(%MaxFreq1% * 0.75)"') do set LowFreq1=%%b
for /f %%b in ('powershell -command "[math]::Round(%MaxFreq4% * 0.30)"') do set LowFreq4=%%b
adb shell settings put global battery_saver_device_specific_constants cpufreq-i=0:%LowFreq1%/1:%LowFreq1%/2:%LowFreq1%/3:%LowFreq1%,cpufreq-n=4:%LowFreq4%/5:%LowFreq4%/6:%LowFreq4%/7:%LowFreq4%
echo.
echo Delete =} adb shell settings delete global battery_saver_device_specific_constants
echo.
echo "check cpufreq =} adb shell dumpsys power | findstr cpu"
echo.
echo Source : https://opensource.hcltechsw.com/volt-mx-native-function-docs/Android/android.provider-Android-10.0/source/Global.html
echo.
pause
