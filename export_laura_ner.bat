@echo off

set "OUTPUT_DIR=data-26-09-2013\"


java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_16 -conll data\interview_16.conll -exportConll %OUTPUT_DIR%interview_16_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_23 -conll data\interview_23.conll -exportConll %OUTPUT_DIR%interview_23_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_27 -conll data\interview_27.conll -exportConll %OUTPUT_DIR%interview_27_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_38 -conll data\interview_38.conll -exportConll %OUTPUT_DIR%interview_38_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_43 -conll data\interview_43.conll -exportConll %OUTPUT_DIR%interview_43_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_46 -conll data\interview_46.conll -exportConll %OUTPUT_DIR%interview_46_ner.conll -ner -mmaxPath data\


java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 2007_Dadzis -conll data\2007_Dadzis.conll -exportConll %OUTPUT_DIR%2007_Dadzis_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 1988_Padomju_Jaunatne -conll data\1988_Padomju_Jaunatne.conll -exportConll %OUTPUT_DIR%1988_Padomju_Jaunatne_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 1942_Austrumu_apgabala_raiditaju_grupa -conll data\1942_Austrumu_apgabala_raiditaju_grupa.conll -exportConll %OUTPUT_DIR%1942_Austrumu_apgabala_raiditaju_grupa_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project 1935_Muzikas_Apskats -conll data\1935_Muzikas_Apskats.conll -exportConll %OUTPUT_DIR%1935_Muzikas_Apskats_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project G_2005_Ugales_Baznica -conll data\G_2005_Ugales_Baznica.conll -exportConll %OUTPUT_DIR%G_2005_Ugales_Baznica_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project G_1966_Oskars_Kalpaks -conll data\G_1966_Oskars_Kalpaks.conll -exportConll %OUTPUT_DIR%G_1966_Oskars_Kalpaks_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project G_1934_Madona -conll data\G_1934_Madona.conll -exportConll %OUTPUT_DIR%G_1934_Madona_ner.conll -ner -mmaxPath data\


java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_75 -conll data\cliping_75.conll -exportConll %OUTPUT_DIR%cliping_75_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_76 -conll data\cliping_76.conll -exportConll %OUTPUT_DIR%cliping_76_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_77 -conll data\cliping_77.conll -exportConll %OUTPUT_DIR%cliping_77_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_78 -conll data\cliping_78.conll -exportConll %OUTPUT_DIR%cliping_78_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_79 -conll data\cliping_79.conll -exportConll %OUTPUT_DIR%cliping_79_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_80 -conll data\cliping_80.conll -exportConll %OUTPUT_DIR%cliping_80_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_81 -conll data\cliping_81.conll -exportConll %OUTPUT_DIR%cliping_81_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_82 -conll data\cliping_82.conll -exportConll %OUTPUT_DIR%cliping_82_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_83 -conll data\cliping_83.conll -exportConll %OUTPUT_DIR%cliping_83_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_84 -conll data\cliping_84.conll -exportConll %OUTPUT_DIR%cliping_84_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_81 -conll data\interview_81.conll -exportConll %OUTPUT_DIR%interview_81_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_82 -conll data\interview_82.conll -exportConll %OUTPUT_DIR%interview_82_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project lvvest_88 -conll data\lvvest_88.conll -exportConll %OUTPUT_DIR%lvvest_88_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project lvvest_89 -conll data\lvvest_89.conll -exportConll %OUTPUT_DIR%lvvest_89_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_75 -conll data\news_75.conll -exportConll %OUTPUT_DIR%news_75_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_76 -conll data\news_76.conll -exportConll %OUTPUT_DIR%news_76_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_77 -conll data\news_77.conll -exportConll %OUTPUT_DIR%news_77_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_78 -conll data\news_78.conll -exportConll %OUTPUT_DIR%news_78_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_79 -conll data\news_79.conll -exportConll %OUTPUT_DIR%news_79_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_80 -conll data\news_80.conll -exportConll %OUTPUT_DIR%news_80_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_75 -conll data\pr_rel_75.conll -exportConll %OUTPUT_DIR%pr_rel_75_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_76 -conll data\pr_rel_76.conll -exportConll %OUTPUT_DIR%pr_rel_76_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_77 -conll data\pr_rel_77.conll -exportConll %OUTPUT_DIR%pr_rel_77_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_78 -conll data\pr_rel_78.conll -exportConll %OUTPUT_DIR%pr_rel_78_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_79 -conll data\pr_rel_79.conll -exportConll %OUTPUT_DIR%pr_rel_79_ner.conll -ner -mmaxPath data\

java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project anotation_40 -conll data\anotation_40.conll -exportConll %OUTPUT_DIR%anotation_40_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project anotation_41 -conll data\anotation_41.conll -exportConll %OUTPUT_DIR%anotation_41_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project anotation_42 -conll data\anotation_42.conll -exportConll %OUTPUT_DIR%anotation_42_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project anotation_43 -conll data\anotation_43.conll -exportConll %OUTPUT_DIR%anotation_43_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project anotation_44 -conll data\anotation_44.conll -exportConll %OUTPUT_DIR%anotation_44_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_40 -conll data\cliping_40.conll -exportConll %OUTPUT_DIR%cliping_40_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_41 -conll data\cliping_41.conll -exportConll %OUTPUT_DIR%cliping_41_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_42 -conll data\cliping_42.conll -exportConll %OUTPUT_DIR%cliping_42_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_43 -conll data\cliping_43.conll -exportConll %OUTPUT_DIR%cliping_43_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project cliping_44 -conll data\cliping_44.conll -exportConll %OUTPUT_DIR%cliping_44_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_33 -conll data\interview_33.conll -exportConll %OUTPUT_DIR%interview_33_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_40 -conll data\interview_40.conll -exportConll %OUTPUT_DIR%interview_40_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project interview_41 -conll data\interview_41.conll -exportConll %OUTPUT_DIR%interview_41_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project lvvest_40 -conll data\lvvest_40.conll -exportConll %OUTPUT_DIR%lvvest_40_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project lvvest_41 -conll data\lvvest_41.conll -exportConll %OUTPUT_DIR%lvvest_41_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project lvvest_42 -conll data\lvvest_42.conll -exportConll %OUTPUT_DIR%lvvest_42_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_60 -conll data\news_60.conll -exportConll %OUTPUT_DIR%news_60_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_61 -conll data\news_61.conll -exportConll %OUTPUT_DIR%news_61_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_62 -conll data\news_62.conll -exportConll %OUTPUT_DIR%news_62_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_63 -conll data\news_63.conll -exportConll %OUTPUT_DIR%news_63_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project news_64 -conll data\news_64.conll -exportConll %OUTPUT_DIR%news_64_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_40 -conll data\pr_rel_40.conll -exportConll %OUTPUT_DIR%pr_rel_40_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_41 -conll data\pr_rel_41.conll -exportConll %OUTPUT_DIR%pr_rel_41_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_42 -conll data\pr_rel_42.conll -exportConll %OUTPUT_DIR%pr_rel_42_ner.conll -ner -mmaxPath data\
java -Xmx1G -Dfile.encoding=UTF-8 -cp "dist\MmaxWrapper.jar;lib\*" MmaxWrapper %* -project pr_rel_43 -conll data\pr_rel_43.conll -exportConll %OUTPUT_DIR%pr_rel_43_ner.conll -ner -mmaxPath data\


pause