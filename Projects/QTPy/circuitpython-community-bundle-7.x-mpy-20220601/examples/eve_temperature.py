import microcontroller
import bteve as eve

def lerp(t, a, b):
    return a + (b - a) * t
def map(x, x0, x1, y0 = 0, y1 = 1):
    t = (x - x0) / (x1 - x0)
    t = max(0, min(t, 1))
    return lerp(t, y0, y1)

def temperature(gd, sense):
    gd.cmd_romfont(30, 33)
    gd.cmd_romfont(31, 34)

    xincr = .008 * gd.w
    sparkline = []
    temp = sense()
    frames = 0
    while True:
        # Measure temp continuously until CPU is ready to redraw
        while not gd.is_finished():
            temp = (999 * temp + sense()) / 1000

        gd.cmd_gradient(0, 0, 0x000010, gd.w, gd.h, 0x206060)
        gd.VertexFormat(3)
        gd.cmd_text(gd.w // 2, gd.h // 9, 31, eve.OPT_CENTER, "CPU junction temperature")

        # Update sparkline every few frames
        if (frames % 6) == 0:
            y = map(temp, 0, 50, 0.9 * gd.h, 0.2 * gd.h)
            sparkline.append((gd.w * 0.8, y))
            sparkline = sparkline[-90:]
            sparkline = [(x - xincr, y) for (x, y) in sparkline]
        frames += 1

        # Draw dot and measurement
        (x, y) = sparkline[-1]
        gd.cmd_text(int(x), int(y), 30, eve.OPT_CENTERY, " %.1f C" % temp)
        gd.PointSize(20)
        gd.Begin(eve.POINTS)
        gd.Vertex2f(x, y)

        gd.LineWidth(gd.w / 200)
        gd.Begin(eve.LINE_STRIP)
        for (x, y) in sparkline:
            gd.Vertex2f(x, y)
        gd.swap()

def celsius():
    return microcontroller.cpu.temperature

gd = eve.Gameduino()
gd.init()
temperature(gd, celsius)
