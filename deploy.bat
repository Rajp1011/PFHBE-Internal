@echo off
setlocal enableDelayedExpansion

REM ===== CONFIG =====
set VERSION=v9.0.7

REM MUST be lowercase
set GHCR_REG=ghcr.io
set GHCR_OWNER=rajp1011
set GHCR_REPO=pfhbe
set GHCR_PATH=%GHCR_REG%/%GHCR_OWNER%/%GHCR_REPO%

set CONFIG_IMAGE=%GHCR_PATH%/geconfig:%VERSION%

echo =========================================
echo == BUILD + PUSH to GHCR
echo =========================================

echo [1/2] Build...

docker build -t %CONFIG_IMAGE% -f Dockerfile .
if errorlevel 1 exit /b 1

echo [2/2] Push...

docker push %CONFIG_IMAGE%
if errorlevel 1 exit /b 1

echo DONE. Pushed GE Config tag: %VERSION%
