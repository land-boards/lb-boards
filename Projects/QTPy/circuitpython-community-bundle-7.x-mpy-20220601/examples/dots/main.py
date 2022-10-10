import board
import dotstar_featherwing
import time
import random

wing = dotstar_featherwing.DotstarFeatherwing(board.D13, board.D11, brightness=0.10)

wing.clear()
wing.show()

while True:
    row = random.randint(0, 5)
    column = random.randint(0, 11)
    color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
    wing.set_color(row, column, color)
    row = random.randint(0, 5)
    column = random.randint(0, 11)
    wing.set_color(row, column, (0, 0, 0))
    wing.show()
