# -*- coding: utf-8 -*-
import sys
import glob
import random
write = sys.stdout.write

partitions = 5
files_l = glob.glob("*.conll")
prefix = "5x_"


def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

def greedy_choose (partition, maxSize, scale = 1):
	size = 0
	for file in files:
		if (not file.get('used', False) and (file['size'] + size <= scale * maxSize) ):
			file['used'] = True
			file['partition'] = partition
			size = size + file['size']
	return size

def random_choose (partition, maxSize, scale = 1, weak = True):
	size = 0
	for file in files:
		bit = random.randrange(1,3)
		if (bit == 1 and not file.get('used', False) and (file['size'] + size <= scale * maxSize or (size == 0 and weak)) ):
			file['used'] = True
			file['partition'] = partition
			size = size + file['size']	
	return size

files = []
sum_lines = 0
for file in files_l:
	lines = sum(1 for line in open(file))
	sum_lines = sum_lines + lines
	files.append({'name':file, 'size':lines, })
files.sort(key=lambda x: x['size'], reverse=True)

p_size = sum_lines / partitions

partitions_dic = {}
for i in range (1, partitions+1):
	size = 0
	size = random_choose(i, p_size)
	size = size + greedy_choose(i, p_size - size, 1.2)
	partitions_dic[str(i)] = size
for file in files : print file
q = 0;
for p in partitions_dic:
	print p, partitions_dic[p]
	q = q + pow(p_size - partitions_dic[p], 2)
	
	part = prefix + "part_" + p + ".ner_train_conll"
	with open(part, 'wb') as out:
		for file in files:
			if (int(p) == file['partition']):
				with open(file['name'], 'rb') as f:
					out.write(f.read())
	
print q

	


