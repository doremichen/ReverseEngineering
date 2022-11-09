@echo off
REM.-- Prepare the Command Processor
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

color 0f

title %~n0


goto :Start

:Usage
echo.===============================================
echo.
echo       %~n0 [source] [target]
echo            [source]: the name of source file
echo            [target]: the name of target file
echo.
echo       example: %~n0 Object Object
echo.
echo.===============================================
echo.&echo.Please try again...&pause&goto:eof
exit /b /0

:Start

if [%1] == [] goto :Usage
if [%2] == [] goto :Usage


:: to dex
call dx --dex --no-strict --output=%2.dex %1.class

:: to dump file
call dexdump -d -f %2.dex > %2Dump.txt

echo.Complete...&goto:eof
