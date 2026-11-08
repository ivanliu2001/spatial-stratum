@echo off
chcp 65001 >nul
echo ========================================================
echo   SPATIAL STRATUM 官網一鍵推送至 GitHub Pages
echo ========================================================
echo.
echo 偵測到您的 GitHub 帳號: ivanliu2001
echo.
set /p REPO_NAME="請輸入您在 GitHub 上新建的 Repository 名稱 (例如 spatial-stratum): "
if "%REPO_NAME%"=="" (
    echo 未輸入名稱，結束執行。
    pause
    exit /b
)

echo.
echo 正在設定遠端庫位址: https://github.com/ivanliu2001/%REPO_NAME%.git ...
git remote remove origin 2>nul
git remote add origin https://github.com/ivanliu2001/%REPO_NAME%.git

echo.
echo 正在推送到 GitHub main 分支...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================================
    echo   [成功] 官方網站已成功推送到 GitHub！
    echo ========================================================
    echo.
    echo 請到此連結開啟 GitHub Pages：
    echo https://github.com/ivanliu2001/%REPO_NAME%/settings/pages
    echo.
    echo 設定步驟：
    echo 1. Build and deployment 的 Source 選擇 [Deploy from a branch]
    echo 2. Branch 選擇 [main] / [/ (root)]，點擊 [Save]
    echo.
    echo 稍等 1 分鐘，您的永久官方專屬網址即為：
    echo 👉 https://ivanliu2001.github.io/%REPO_NAME%/
    echo ========================================================
) else (
    echo.
    echo [提示] 若推送失敗，請確認已在 https://github.com/new 建立該名稱的公開（Public）倉庫。
)
echo.
pause
