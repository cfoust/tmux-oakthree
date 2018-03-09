"""
Grab the index number of the window.
"""
import sys

for line in sys.stdin:
    print(line.strip().split()[-1][1:-1])
    exit()
