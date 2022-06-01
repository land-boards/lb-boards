import random
import math
import bteve as eve

random.seed(6)
rr = random.randrange

# Via https://sashamaps.net/docs/resources/20-colors/
colors20 = [
    (230, 25, 75), (60, 180, 75), (255, 225, 25), (0, 130, 200), (245, 130, 48), (145, 30, 180), (70, 240, 240), (240, 50, 230), (210, 245, 60), (250, 190, 212), (0, 128, 128), (220, 190, 255), (170, 110, 40), (255, 250, 200), (128, 0, 0), (170, 255, 195), (128, 128, 0), (255, 215, 180), (0, 0, 128), (128, 128, 128), (255, 255, 255), (0, 0, 0)
]

gd = eve.Gameduino()
gd.init()

ths = [2 * math.pi * i / 1024 for i in range(1024)]
rots = [(math.sin(th), math.cos(th)) for th in ths]

class Bubble:

    def __init__(self):
        self.x = rr(gd.w)
        self.y = rr(gd.h)
        self.rgb = random.choice(colors20)
        self.r = rr(50, gd.w // 4)
        self.a = rr(1024)
        self.w = rr(-100, 100) / 10

    def draw(self, t):
        gd.ColorRGB(*self.rgb)
        gd.PointSize(self.r)
        (dx, dy) = rots[int(self.a + t * self.w) & 1023]
        gd.Vertex2f(self.x + self.r * dx, self.y + self.r * dy)

bubbles = [Bubble() for i in range(90)]

for t in range(999999):
    gd.Clear()                              # black background
    gd.VertexFormat(2)                      # full-screen
    gd.ColorA(192)                          # 75% opacity
    gd.Begin(eve.POINTS)                    # large POINTS are circles
    for b in bubbles:
        b.draw(t)
    gd.swap()
