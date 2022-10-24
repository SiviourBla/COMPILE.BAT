@echo off
REM #---------
REM # Encoding: UTF-8
REM # License: MIT
REM # Original Author: Blake Siviour
REM # Year: 2022
REM # Project: COMPILE.BAT
REM # Project Summary: A simple batch script that compiles assembly programs within DOSBOX and runs them.
REM # Project Repo: https://github.com/SiviourBla/COMPILE.BAT
REM #---------

set ThisVersion=1.1.2

IF %1.==. GOTO HelpMessage
IF %1==/H GOTO HelpMessage
IF %1==/h GOTO HelpMessage
IF %1==/HELP GOTO HelpMessage
IF %1==/help GOTO HelpMessage
IF %1==-h GOTO HelpMessage
IF %1==-H GOTO HelpMessage
IF %1==--help GOTO HelpMessage
IF %1==/V GOTO VersionMessage
IF %1==/v GOTO VersionMessage
IF %1==/VERSION GOTO VersionMessage
IF %1==/version GOTO VersionMessage
IF %1==-v GOTO VersionMessage
IF %1==-V GOTO VersionMessage
IF %1==--version GOTO VersionMessage

set ExecName=%1
echo %ExecName%
for %%A in ("%ExecName%") do echo %%~dpnA

echo ----CLEAN----
del %ExecName%.OBJ
del %ExecName%.EXE
echo ----BUILD----
masm %ExecName%;
link %ExecName%;
echo ----RUN----
%ExecName%.EXE
echo.
echo --------
GOTO EndScript


:HelpMessage
echo Usage: COMPILE.BAT ExecName (without extension/.*)
echo Additional options: 
echo 	/H /HELP	Display this help message
echo 	/V /VERSION	Display the program's version
GOTO EndScript


:VersionMessage
echo COMPILE.BAT %ThisVersion%
GOTO EndScript


:EndScript
@echo on