import sys
import bteve as eve

gd = eve.Gameduino()
gd.init()

gd.ClearColorRGB(0x20, 0x40, 0x20)
gd.Clear()
gd.cmd_text(gd.w // 2, gd.h // 2, 31, eve.OPT_CENTER, "Hello world")
gd.swap()
