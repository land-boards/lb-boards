import board
import dotstar_featherwing

wing = dotstar_featherwing.DotstarFeatherwing(board.D13, board.D11)

xmas_colors = {'w': ( 32,  32,  32),
                'W': (255, 255, 255),
                'G': (  0,  32,   0),
                'y': ( 32,  32,   0),
                'Y': (255, 255,   0)}

xmas_animation = [["..y.w......w",
                   "..G.....w...",
                   "..G..w....w.",
                   ".GGG...w....",
                   "GGGGG.......",
                   "wwwwwwwwwwww"],
                  ["..y.........",
                   "..G.W......w",
                   "..G.....w...",
                   ".GGG.w....W.",
                   "GGGGG..w....",
                   "wwwwwwwwwwww"],
                  ["..Y....W....",
                   "..G.........",
                   "..G.w......w",
                   ".GGG....w...",
                   "GGGGGw....W.",
                   "wwwwwwwwwwww"],
                  ["..y..w....w.",
                   "..G....W....",
                   "..G.........",
                   ".GGGW......w",
                   "GGGGG...w...",
                   "wwwwwwwwwwww"],
                  ["..Y.....w...",
                   "..G..w....W.",
                   "..G....w....",
                   ".GGG........",
                   "GGGGG......W",
                   "wwwwwwwwwwww"]]

wing.display_animation(xmas_animation, xmas_colors, 10000, 0.05)
