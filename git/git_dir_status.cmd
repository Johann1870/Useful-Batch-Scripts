@ECHO off
::
:: This should list the git repos in the directory specified below and print
:: 	out the branch and note any repos that aren't clean
::
:: J. Ditzel
:: Sept 2018
:: 
:: CC0
:: No Rights Reserved
::
:: Change the directory below to whatever you want to check
CD %userprofile%/Github

:: You can set git status switches after the status (works best with -sb)
FOR /f "tokens=*" %%a IN ('DIR /ad /b') DO ECHO|SET /p=%%a & git --git-dir=%%a/.git --work-tree=%%a status -sb & @ECHO:

@ECHO ON