@echo off
chcp 65001 > nul
adb shell device_config get storage_native_boot target_dirty_ratio > temp_result.txt
set /p result=<temp_result.txt

:: Kiểm tra giá trị và xử lý
if "%result%"=="null" (
    echo storage_native_boot/target_dirty_ratio is not detect.
    set "result="
) else if "%result%"=="" (
    echo storage_native_boot/target_dirty_ratio is not detect.
    set "result="
) else (
    echo found storage_native_boot/target_dirty_ratio: %result%
)
del temp_result.txt
if not defined result (
    pause
    exit
)
set /a aducsa=%result%+10
echo storage_native_boot/target_dirty_ratio is set to : %aducsa%
adb shell device_config put storage_native_boot target_dirty_ratio %aducsa%
pause
