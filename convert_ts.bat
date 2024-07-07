@echo off
setlocal enabledelayedexpansion

for %%f in (*.ts) do (
    set "filename=%%~nf"
    ffmpeg -i "%%f" -c:v hevc_nvenc -preset slow -b:v 2.5M -c:a copy "!filename!.mp4"
    if !errorlevel! == 0 (
        del "%%f"
    ) else (
        echo Conversion failed for "%%f"
    )
)

endlocal
