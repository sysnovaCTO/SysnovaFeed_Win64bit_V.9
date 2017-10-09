CD "%USERPROFILE%\Downloads\SysnovaFeed_Win64bit-master"

xcopy /y mkshortcut.vbs "C:\Windows\System32"

xcopy /y H2\* "C:\Program Files (x86)\H2" /s /i

mkdir "C:\Program Files\GLPK"

xcopy /y glpk-4.63\* "C:\Program Files\GLPK" /s /i

xcopy /y feedDatabase.h2.db "%USERPROFILE%"

setx CLASSPATH "C:\Program Files\GLPK\w64\glpk-java.jar"

setx path "%path%;C:\Program Files\GLPK\w64" /M

mkshortcut /target:"%USERPROFILE%\Downloads\SysnovaFeed_Win64bit-master\setup\SysnovaFeed.exe" /shortcut:"%USERPROFILE%\Desktop\SysnovaFeed"

echo Installation Finished . Please Run the file SysnovaFeed from Desktop .
pause



