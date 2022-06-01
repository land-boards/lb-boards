import board
import dotstar_featherwing
import time
import random

wing = dotstar_featherwing.DotstarFeatherwing(board.D13, board.D11, 0.25)

wing.clear()
wing.show()

while True:
    color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
    wing.fill(color)
    wing.show()
    time.sleep(0.25)
    wing.clear()
    wing.show()
    time.sleep(0.25)
