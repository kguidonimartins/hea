:: see documentation in http://ss64.com/nt/xcopy.html
:: code from http://www.geekyboy.com/archives/160

:: begin code
@echo
:: variables
set sourcedrive=D:\Desktop\backup-script-template
set backupdrive=D:\Desktop\backup-script-template
set backupcmd=xcopy /s /c /d /e /h /i /r /y
set logfile=%backupdrive%\target-dir\backup_log_file.txt

echo %Date% %Time% # # # Moving files >> %logfile%
%backupcmd% "%sourcedrive%\source-dir" "%backupdrive%\target-dir" >> %logfile%
 
echo %Date% %Time% # # # Complete! >> %logfile%
:: end code





