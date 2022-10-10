"""
This test will initialize the display using displayio
and draw a solid red background

This example is set up for Electronut Labs Blip
"""

import board
import busio
import displayio
import electronutlabs_ili9163

spi = busio.SPI(board.D29, MOSI=board.D30)
tft_cs = board.D4
tft_dc = board.D33

displayio.release_displays()
display_bus = displayio.FourWire(spi, command=tft_dc, chip_select=tft_cs)

display = electronutlabs_ili9163.ILI9163(display_bus, width=160, height=128)

# Make the display context
splash = displayio.Group(max_size=10)
display.show(splash)

color_bitmap = displayio.Bitmap(160, 128, 1)
color_palette = displayio.Palette(1)
color_palette[0] = 0xFF0000

bg_sprite = displayio.TileGrid(color_bitmap,
                               pixel_shader=color_palette,
                               x=0, y=0)
splash.append(bg_sprite)

while True:
    pass
