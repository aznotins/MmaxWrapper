@echo off

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project G_2005_Ugales_Baznica -importWebNE data\fromWebNE\start_data\G_2005_Ugales_Baznica.txt -mmaxPath mmax\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project G_1966_Oskars_Kalpaks -importWebNE data\fromWebNE\start_data\G_1966_Oskars_Kalpaks.txt -mmaxPath mmax\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project G_1934_Madona -importWebNE data\fromWebNE\start_data\G_1934_Madona.txt -mmaxPath mmax\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 2007_Dadzis -importWebNE data\fromWebNE\start_data\2007_Dadzis.txt -mmaxPath mmax\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 1988_Padomju_Jaunatne -importWebNE data\fromWebNE\start_data\1988_Padomju_Jaunatne.txt -mmaxPath mmax\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 1942_Austrumu_apgabala_raiditaju_grupa -importWebNE data\fromWebNE\start_data\1942_Austrumu_apgabala_raiditaju_grupa.txt -mmaxPath mmax\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 1935_Muzikas_Apskats -importWebNE data\fromWebNE\start_data\1935_Muzikas_Apskats.txt -mmaxPath mmax\

pause
