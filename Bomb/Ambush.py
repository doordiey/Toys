import numpy as np
from pprint import pprint
import random

def where(level,bombs):
    if level == 1:
        x = 9
        y = 9
        all = x * y
        bombnumber = 10
    elif level == 2:
        x = 16
        y = 16
        all = x * y
        bombnumber = 40
    elif level == 3:
        x = 16
        y = 30
        all = x * y
        bombnumber = 100

    while len(bombs) < bombnumber :
        j = random.randint(1, all)
        if j not in bombs:
            bombs.append(j)
    return all, x, y

def Ambush(level):
    bombs = []
    all, x, y = where(level, bombs)
    m = np.zeros((all))
    for c in bombs:
        m[c-1] = -1
    n = m.reshape((x, y))
    pprint(n)

    return n

if __name__ == "__main__":
    LevelKind = {"easy":1,
                 "middle":2,
                 "hard":3}
    Ambush(1)
    # for x in range(10**1):
    #     print(x)