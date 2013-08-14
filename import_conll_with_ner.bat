@echo off
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 2007_Dadzis -conll test_prof.conll -mmaxPath mmax\

pause