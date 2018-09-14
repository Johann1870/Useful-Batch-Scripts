@ECHO OFF
:: My cmd initialization file.

:: place this somewhere always accessible on your hard drive then set the path in the registry autoruns
::		HKEY_CURRENT_USER\Software\Microsoft\Command Processor\
::		if it doesn't exist, create String Value "Autorun" and set value to path to this batch file

GOTO DEBUG
:DEBUG



::DIRECTORIES
	::CD %WINDIR%\system32
	
	
SETLOCAL	
::COLORS	
	::ADMIN 64 BACKGROUND COLOR
	SET "A64BCOLOR=0"	
	::ADMIN 64 FOREGROUND COLOR
	SET "A64FCOLOR=C"	
	::ADMIN 32 BACKGROUND COLOR
	SET "A32BCOLOR=7"	
	::ADMIN 32 FOREGROUND COLOR
	SET "A32FCOLOR=C"	
	::USER 64 BACKGROUND COLOR
	SET "U64BCOLOR=F"	
	::USER 64 FOREGROUND COLOR
	SET "U64FCOLOR=2"	
	::USER 32 BACKGROUND COLOR
	SET "U32BCOLOR=7"	
	::USER 32 FOREGROUND COLOR
	SET "U32FCOLOR=2"
	::SYSTEM FOREGROUND COLOR
	SET "SFCOLOR=C"
	::SYSTEM BACKGROUND COLOR
	SET "SBCOLOR=E"
	
::TITLES AND COLORS
	::TITLE
	SET TITLE1= - %USERDOMAIN%\%USERNAME% - %COMPUTERNAME%  LogonServer: %LOGONSERVER%	
	::Determines whether the cmd session is a 32 or 64 bit process
	ECHO %PROCESSOR_ARCHITECTURE%|FINDSTR AMD64>nul && (SET TITLE2=64 bit %TITLE1%&SET BCOLOR=%A64BCOLOR%%U64BCOLOR%&SET FCOLOR=%A64FCOLOR%%U64FCOLOR%)||(SET TITLE2=32 bit %TITLE1%&SET BCOLOR=%A32BCOLOR%%U32BCOLOR%&SET FCOLOR=%A32FCOLOR%%U32FCOLOR%)	
	::ADDS SESSION NAME TO TITLE
	SET TITLE3= %TITLE2%  Session:%SESSIONNAME%	
	::CHECKS ADMIN STATUS
	FSUTIL DIRTY QUERY %SYSTEMDRIVE% > nul 2> nul && (SET TITLE4=ADMIN %TITLE3%&SET FCOLOR=%FCOLOR:~0,1%&SET BCOLOR=%BCOLOR:~0,1%) || (SET BCOLOR=%BCOLOR:~1,1%&SET FCOLOR=%FCOLOR:~1,1%&SET TITLE4=NONADMIN %TITLE3%)	
	::SYSTEM
	WHOAMI /GROUPS | FINDSTR /c:"S-1-16-16384">nul: &&  (TITLE [SYSTEM] %TITLE4%&SET FCOLOR=%SFCOLOR%&SET BCOLOR=%SBCOLOR%) || (TITLE [NONSYSTEM] %TITLE4%)
	::COLOR
	SET DCOLOR=%BCOLOR%%FCOLOR%
	COLOR %DCOLOR%
ENDLOCAL



::PATHS	
	::Scripting Path
	SET PATH=%PATH%;C:\sc
	::Notepad++
	SET PATH=%PATH%;C:\Program Files (x86)\Notepad++
	::Pandoc
	SET PATH=%PATH%;%LOCALAPPDATA%\Pandoc
	::Python27
	SET PATH=%PATH%;C:\Python27
	::Office
	SET PATH=%PATH%;C:\Program Files (x86)\Microsoft Office\root\Office16
	::Desktop
	SET PATH=%PATH%;%HOMEPATH%\Desktop
	::PSTools
	::SET PATH=%PATH%;C:\PSTools


::ALIASES
	DOSKEY npp=notepad++ $*
	::DOSKEY st="C:\Program Files\Sublime Text 3\sublime_text.exe" $*
	DOSKEY np=%WINDIR%\System32\notepad.exe $*
	DOSKEY xl=C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE $*
	DOSKEY ps=%WINDIR%\System32\WindowsPowerShell\v1.0\powershell.exe $*

	DOSKEY pg=C:\Python27\Scripts\pygmentize.exe $*

	DOSKEY moff=nircmd monitor off
	DOSKEY home=cd /d %HOMEPATH% $*
	DOSKEY docs=cd /d %HOMEPATH%\Documents $*
	DOSKEY proj=cd /d %HOMEPATH%\Documents\proj $*
	DOSKEY home=%HOMEPATH%
	
	::Uncomment this if running Conemu
	::"C:\Program Files\ConEmu\ConEmu\CmdInit.cmd"
	
	::CLS

	


@ECHO ON