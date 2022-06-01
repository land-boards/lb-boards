import math
import random
import bteve as eve

gd = eve.Gameduino()
gd.init()

def tri(t):
    # triangle wave
    f = math.fmod(t, 1.0)
    return 2 * abs(f - 0.5)

def at(t, ff):
    x = gd.w * tri(ff[0] + ff[1] * t)
    y = gd.h * tri(ff[2] + ff[3] * t)
    gd.Vertex2f(x, y)

F = [random.random() for i in range(18)]

t = 0

while True:
    gd.Clear()
    gd.VertexFormat(3)
    gd.Begin(eve.LINE_STRIP)
    for dt in range(10):
        tn = (t - dt) / 75
        gd.ColorRGB(
            int(255 * tri(F[12] + F[13] * tn)),
            int(255 * tri(F[14] + F[15] * tn)),
            int(255 * tri(F[16] + F[17] * tn)))
        at(tn, F[0:4])
        at(tn, F[4:8])
        at(tn, F[8:12])

    gd.swap()
    t += 1
