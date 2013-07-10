@echo off
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project jauns -conll test.conll -mmaxPath mmax\

pause