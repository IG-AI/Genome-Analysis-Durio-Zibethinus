import sys, os

dir = sys.argv[1]

for filename in os.listdir(dir):
    path = dir+filename
    mysum = 0
    with open(path,'r') as f:
        f = f.read()
        lines = f.splitlines()
        lines_count = len(lines) - 5
        i = 0
        for line in lines:
            if lines_count > i:
                i += 1
                mysum += int(line.split()[1])
        print(filename + ": " + str(mysum))
