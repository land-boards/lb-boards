import board
import dotstar_featherwing

wing = dotstar_featherwing.DotstarFeatherwing(board.D13, board.D11)

xmas = ["..y.w......w",
        "..G.....w...",
        "..G..w....w.",
        ".GGG...w....",
        "GGGGG.......",
        "wwwwwwwwwwww"]

xmas_colors = {'w': ( 32,  32,  32),
               'G': (  0,  32,   0),
               'y': ( 32,  32,   0)}

wing.display_colored_image(xmas, xmas_colors)
