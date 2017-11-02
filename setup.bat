@ECHO OFF
cd %~dp0

set "error="

xcopy /y H2\* "C:\Program Files (x86)\H2" /s /i
IF %ERRORLEVEL% NEQ 0 (
  set "error=error : Failed to copy H2 Database "
  goto done
)


mkdir "C:\Program Files\GLPK"

xcopy /y glpk-4.63\* "C:\Program Files\GLPK" /s /i
IF %ERRORLEVEL% NEQ 0 (
  set "error=error : Failed to copy GLPK "
  goto done
)

mkdir "C:\Program Files\SysnovaFeed"
xcopy /y setup\* "C:\Program Files\SysnovaFeed" /s /i
IF %ERRORLEVEL% NEQ 0 (
  set "error=error : Failed to copy  files inside setup directory"
  goto done
)

xcopy /y feedDatabase.h2.db "%USERPROFILE%"
IF %ERRORLEVEL% NEQ 0 (
  set "error=error : Failed to copy feedDatabase.db file "
  goto done
)


xcopy /y mkshortcut.vbs "C:\Windows\System32"
IF %ERRORLEVEL% NEQ 0 (
  set "error=error : Failed to copy mkshortcut.vbs file"
  goto done
)





setx CLASSPATH "C:\Program Files\GLPK\w64\glpk-java.jar"

setx path "%path%;C:\Program Files\GLPK\w64" /M
IF %ERRORLEVEL% NEQ 0 (
  set "error=error : Failed to set Path in Environment variable for GLPK."
  goto done
)

mkshortcut /target:"C:\Program Files\SysnovaFeed\SysnovaFeed.exe" /shortcut:"%USERPROFILE%\Desktop\SysnovaFeed"
IF %ERRORLEVEL% NEQ 0 (
  set "error=error : Failed to Create Shortcut of SysnovaFeed.exe"
  goto done
)

echo Installation Finished Successfully. Shortcut Created in  Desktop .
goto success
pause

:done

echo %error%
goto END
pause

:success
pause

:END
pause
