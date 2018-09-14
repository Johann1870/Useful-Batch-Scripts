@ECHO OFF

:: J. Ditzel
:: Mar 2018

:: Creates a directory of folders as specified in the text file "folders.txt"
:: This file should be located in the same directory as this batch file.

FOR /f %%i IN (folders.txt) DO MKDIR %%i

@ECHO ON