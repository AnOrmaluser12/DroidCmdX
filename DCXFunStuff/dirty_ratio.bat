@echo off
chcp 65001

:: Kiểm tra key và lưu giá trị vào file tạm
adb shell device_config get storage_native_boot target_dirty_ratio > temp_result.txt

:: Lấy giá trị từ file tạm và lưu vào biến result
set /p result=<temp_result.txt

:: Kiểm tra giá trị và xử lý
if "%result%"=="null" (
    echo Không phát hiện key storage_native_boot/target_dirty_ratio.
    set "result="
) else if "%result%"=="" (
    echo Không phát hiện key storage_native_boot/target_dirty_ratio.
    set "result="
) else (
    echo Đã phát hiện key storage_native_boot/target_dirty_ratio: %result%
)

:: Xóa file tạm
del temp_result.txt


set /a aducsa=%result%+10
echo adb shell device_config put storage_native_boot target_dirty_ratio %aducsa%

pause
