import board
import dotstar_featherwing
import time

wing = dotstar_featherwing.DotstarFeatherwing(board.D13, board.D11)

wing.clear()
wing.show()
time.sleep(2.0)
for x in [12, 18, 33, 33, 18, 12]:
	wing.shift_into_left(wing.number_to_pixels(x, (0, 64, 0)))
	wing.show()
	time.sleep(0.2)

