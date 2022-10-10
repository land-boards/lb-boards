import board
import dotstar_featherwing

wing = dotstar_featherwing.DotstarFeatherwing(board.D13, board.D11)

starfleet = ["XXXXXXX.....",
             "..XXXXXXX...",
             "....XXXXXXX.",
             ".....XXXXXXX",
             "....XXXXXXX.",
             "..XXXXXXX..."]

wing.display_image(starfleet, (32, 32, 32))
