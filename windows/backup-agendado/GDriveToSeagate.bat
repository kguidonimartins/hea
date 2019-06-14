:: see documentation in http://ss64.com/nt/xcopy.html
:: code from http://www.geekyboy.com/archives/160

:: begin code
@echo
:: variables
set sourcedrive=C:\Users\kguidonimartins\Google Drive\backup-settings
set backupdrive=F:\GDriveBackup
set backupcmd=xcopy /s /c /d /e /h /i /r /y
set logfile=%backupdrive%\backup-settings-log\GDriveToSeagateLog.txt

echo %Date% %Time% # # # Moving files >> %logfile%
%backupcmd% "%sourcedrive%" "%backupdrive%" >> %logfile%
 
echo %Date% %Time% # # # Complete! >> %logfile%
:: end code





