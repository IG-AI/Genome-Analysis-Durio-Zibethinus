import sys, os
import matplotlib.pyplot as plt

dir = sys.argv[1]

for filename in os.listdir(dir):
    path = dir+filename
    count = []
    gene = []
    with open(path,'r') as f:
        f = f.read()
        lines = f.splitlines()
        lines_count = len(lines) - 5
        i = 0
        for line in lines:
            if lines_count > i:
                i += 1
                gene.append(i)
                count.append(int(line.split()[1]))
    #print(count)
    plt.hist(count, color='blue', edgecolor='black', bins=(len(count)), range=(0, 5000))
    plt.savefig(filename+".png")

gi