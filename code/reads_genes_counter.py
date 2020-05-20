import sys

file = sys.argv[1]

mysum = 0
with open(file,'r') as f:
    f = f.read()
    lines = f.splitlines()
    lines_count = len(lines) - 5
    i = 0
    for line in lines:
        if (lines_count > i):
            i += 1
            mysum += int(line.split()[1])
    print(mysum)
