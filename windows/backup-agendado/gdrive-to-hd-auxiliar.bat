:: see documentation in http://ss64.com/nt/xcopy.html
:: code from http://www.geekyboy.com/archives/160

:: begin code
@echo
:: variables
set sourcedrive=D:\Google Drive
set backupdrive=H:\gdrive-backup
set backupcmd=xcopy /s /c /d /e /h /i /r /y
set logfile=%backupdrive%\backup-settings-log\gdrive-to-hd-auxiliar-log.txt

echo %Date% %Time% # # # Moving files >> %logfile%
%backupcmd% "%sourcedrive%" "%backupdrive%" >> %logfile%
 
echo %Date% %Time% # # # Complete! >> %logfile%
:: end code





