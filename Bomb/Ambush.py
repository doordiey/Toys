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
    for a in range(x):
        for b in range(y):
            if n[a][b] != -1:
                n[a][b] = find_mine(a, b, n)

    pprint(n)

    return n

def find_mine(row, col, board):
    dx = [-1, -1, -1, 0, 0, 1, 1, 1]
    dy = [-1, 0, 1, 1, -1, 1, 0, -1]
    count = 0
    for x, y in zip(dx, dy):
        now_x, now_y = row + x, col + y
        if now_x >= 0 and now_x < len(board) and now_y >=0 and now_y < len(board[0]):
            if board[now_x][now_y] == -1:
                count += 1
    return count

if __name__ == "__main__":
    LevelKind = {"easy":1,
                 "middle":2,
                 "hard":3}
    Ambush(1)
    # for x in range(10**1):
    #     print(x)