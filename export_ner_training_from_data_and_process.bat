REM @echo off
SET FOLDER=%~dp0
set "BASE_DIR=%FOLDER%data\"
set "BASE_CONLL_DIR=%FOLDER%data_refreshed\conll_25-11-2013\"
set "OUTPUT_DIR=%FOLDER%ner-train-25-11-2013\"
if not exist %OUTPUT_DIR% mkdir %OUTPUT_DIR%
for %%f in (%FOLDER%process\*.mmax) do (
	java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project %%~nf -conll %BASE_CONLL_DIR%%%~nf_ner.conll -exportConll %OUTPUT_DIR%%%~nf_ner.conll -ner -exportCategories person,location,organization,profession,media,product,time,sum,event -mmaxPath %BASE_DIR%
	)
pause