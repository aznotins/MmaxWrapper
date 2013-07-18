@echo off
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_16 -conll laura_ner\interview_16.txt.tagged -exportConll laura_ner\interview_16.conll -ner -mmaxPath laura_ner\
pause