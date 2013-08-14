@echo off
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_16 -conll data\interview_16.txt.tagged -exportConll data\export\interview_16.conll -ner -mmaxPath data\
pause