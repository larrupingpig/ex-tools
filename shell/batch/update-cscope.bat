@echo off
rem create cscope.out
echo Creating Cscope...

if exist "%TOOLS%\bin\cscope.exe" (
    set CSCOPE_CMD="%TOOLS%\bin\cscope.exe"
)

rem choose ctags path first
if exist "%DEST%\files" (
    set FILES="%DEST%\files"
)

rem process tags by langugage
echo   ^|- generate %TMP%
%CSCOPE_CMD% -f"%TMP%" %OPTIONS% %FILES%

rem replace old file
if exist "%TMP%" (
    echo   ^|- move %TMP% to %TARGET%
    move /Y "%TMP%" "%TARGET%" > nul
    REM  echo   ^|- replace %TMP% to %TARGET%
    REM  replace  "%TMP%" "%TARGET%" > nul
)
echo   ^|- done!
