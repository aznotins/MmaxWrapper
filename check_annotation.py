# -*- coding: utf-8 -*-
import sys
import glob

write = sys.stdout.write
files = glob.glob("*.conll")
print files 


dict = {
	"pērn":"time",
	"šogad": "time",
	"tagad":"time",
	"pašlaik": "time",
	"patlaban": "time",
	"%": "sum",
	"nākamgad" : "time",
	"janvāris" : "time",
	"februāris" : "time",
	"marts" : "time",
	"aprīlis" : "time",
	"maijs" : "time",
	"jūnijs" : "time",
	"jūlijs" : "time",
	"augusts" : "time",
	"septembris" : "time",
	"oktobris" : "time",
	"novembris" : "time",
	"decembris" : "time"
}

for file in files:
	ins = open(file, "r")
	tokens = []
	sentence = 1
	text = ""
	for line in ins:
		bits = line.split('\t')
		if len(bits) > 7:
			text = text + bits[1] +"/"+ bits[7].strip() + " "
			if (bits[0] == "1"): 
				sentence = sentence+1
			if ((bits[2] in dict) and (bits[7].strip() != dict[bits[2]])): tokens.append(str(sentence) + ": "+text)
		else: 
			tokens
			text = ""
	if (len(tokens) >0):
		write(file)
		write(":\n")
		for token in tokens : write("\t" + token + "\n")
		write("\n")