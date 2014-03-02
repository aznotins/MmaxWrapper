@echo off
SET FOLDER=%~dp0
set "BASE_DIR=%FOLDER%data\coref-2014-feb\"
set "BASE_CONLL_DIR=%FOLDER%process\"
set "OUTPUT_DIR=%FOLDER%data\coref-train-01-03-2014\"
if not exist %OUTPUT_DIR% mkdir %OUTPUT_DIR%
for %%f in (%FOLDER%process\*) do (
	java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project %%~nf -conll %BASE_CONLL_DIR%%%~nf.conll -exportConll %OUTPUT_DIR%%%~nf_ner.conll -coref -exportCategories person,location,organization,profession,media,product,time,sum,event -compact -mmaxPath %BASE_DIR%
	)
pause