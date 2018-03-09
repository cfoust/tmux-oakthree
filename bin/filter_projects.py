import sys

for line in sys.stdin:
    line    = line.strip()
    project = line.split()[0]

    if project.endswith('~'):
        continue

    print(line.strip())
