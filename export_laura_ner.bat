@echo off
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_16 -conll laura_ner\interview_16.txt.tagged -exportConll laura_ner\interview_16.conll -ner -mmaxPath laura_ner\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_23 -conll laura_ner\interview_23.txt.tagged -exportConll laura_ner\interview_23.conll -ner -mmaxPath laura_ner\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_27 -conll laura_ner\interview_27.txt.tagged -exportConll laura_ner\interview_27.conll -ner -mmaxPath laura_ner\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_38 -conll laura_ner\interview_38.txt.tagged -exportConll laura_ner\interview_38.conll -ner -mmaxPath laura_ner\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_43 -conll laura_ner\interview_43.txt.tagged -exportConll laura_ner\interview_43.conll -ner -mmaxPath laura_ner\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_46 -conll laura_ner\interview_46.txt.tagged -exportConll laura_ner\interview_46.conll -ner -mmaxPath laura_ner\
pause