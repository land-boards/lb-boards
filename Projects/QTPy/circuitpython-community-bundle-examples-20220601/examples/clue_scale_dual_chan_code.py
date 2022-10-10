# SPDX-FileCopyrightText: 2021, 2022 Cedar Grove Maker Studios
# SPDX-License-Identifier: MIT

# clue_scale_dual_chan_code.py  2022-04-23 1.1.0  Cedar Grove Maker Studios

# Clue Scale -- dual channel version
# Cedar Grove NAU7802 FeatherWing example

# import clue_scale_calibrate  # uncomment to run calibration method for both channels
import time
import board
from simpleio import map_range
from adafruit_clue import clue
from adafruit_display_shapes.circle import Circle
from adafruit_display_text.label import Label
from adafruit_bitmap_font import bitmap_font
import displayio
from cedargrove_nau7802 import NAU7802

clue.pixel[0] = (16, 0, 16)  # Set status indicator to purple during instantiation phase

MAX_GR = 100  # Maximum (full-scale) display range in grams
MIN_GR = (MAX_GR // 5) * -1  # Calculated minimum display value
DEFAULT_GAIN = 128  # Default gain for internal PGA
SAMPLE_AVG = 100  # Number of sample values to average
CHAN_1_LABEL = "SHOT"  # 6 characters maximum
CHAN_2_LABEL = "BEANS"  # 6 characters maximum

# Load cell dime-weight calibration ratio; 2.268 oz / ADC_raw_measurement
# Obtained emperically; individual load cell dependent
CALIB_RATIO_1 = (
    100 / 215300
)  # 100g at gain x128 for load cell serial#4540-02 attached to chan A
CALIB_RATIO_2 = (
    100 / 215300
)  # 100g at gain x128 for load cell serial#4540-02 attached to chan B
# Instantiate 24-bit load sensor ADC
nau7802 = NAU7802(board.I2C(), address=0x2A, active_channels=2)

# Instantiate display and fonts
print("*** Instantiate the display and fonts")
display = board.DISPLAY
scale_group = displayio.Group()

FONT_0 = bitmap_font.load_font("/fonts/Helvetica-Bold-24.bdf")
FONT_1 = bitmap_font.load_font("/fonts/OpenSans-16.bdf")
FONT_2 = bitmap_font.load_font("/fonts/OpenSans-9.bdf")

# Define displayio background and group elements
print("*** Define displayio background and group elements")
bkg = displayio.OnDiskBitmap("/clue_scale_dual_chan_bkg.bmp")
_background = displayio.TileGrid(bkg, pixel_shader=bkg.pixel_shader, x=0, y=0)

scale_group.append(_background)

chan_1_label = Label(FONT_1, text=CHAN_1_LABEL, color=clue.CYAN)
chan_1_label.anchor_point = (0.5, 0.5)
chan_1_label.anchored_position = (40, 96)
scale_group.append(chan_1_label)

chan_2_label = Label(FONT_1, text=CHAN_2_LABEL, color=clue.CYAN)
chan_2_label.anchor_point = (0.5, 0.5)
chan_2_label.anchored_position = (199, 96)
scale_group.append(chan_2_label)

zero_1_button_label = Label(FONT_1, text="Z", color=clue.RED)
zero_1_button_label.x = 8
zero_1_button_label.y = 150
scale_group.append(zero_1_button_label)

zero_2_button_label = Label(FONT_1, text="Z", color=clue.RED)
zero_2_button_label.x = 219
zero_2_button_label.y = 150
scale_group.append(zero_2_button_label)

zero_1_button_circle = Circle(14, 149, 14, fill=None, outline=clue.RED, stroke=2)
scale_group.append(zero_1_button_circle)

zero_2_button_circle = Circle(225, 149, 14, fill=None, outline=clue.RED, stroke=2)
scale_group.append(zero_2_button_circle)

zero_value = Label(FONT_2, text="0", color=clue.CYAN)
zero_value.anchor_point = (1.0, 0.5)
zero_value.anchored_position = (97, 200)
scale_group.append(zero_value)

min_value = Label(FONT_2, text=str(MIN_GR), color=clue.CYAN)
min_value.anchor_point = (1.0, 1.0)
min_value.anchored_position = (99, 239)
scale_group.append(min_value)

max_value = Label(FONT_2, text=str(MAX_GR), color=clue.CYAN)
max_value.anchor_point = (1.0, 0)
max_value.anchored_position = (99, 0)
scale_group.append(max_value)

plus_1_value = Label(FONT_2, text=str(1 * (MAX_GR // 5)), color=clue.CYAN)
plus_1_value.anchor_point = (1.0, 0.5)
plus_1_value.anchored_position = (99, 160)
scale_group.append(plus_1_value)

plus_2_value = Label(FONT_2, text=str(2 * (MAX_GR // 5)), color=clue.CYAN)
plus_2_value.anchor_point = (1.0, 0.5)
plus_2_value.anchored_position = (99, 120)
scale_group.append(plus_2_value)

plus_3_value = Label(FONT_2, text=str(3 * (MAX_GR // 5)), color=clue.CYAN)
plus_3_value.anchor_point = (1.0, 0.5)
plus_3_value.anchored_position = (99, 80)
scale_group.append(plus_3_value)

plus_4_value = Label(FONT_2, text=str(4 * (MAX_GR // 5)), color=clue.CYAN)
plus_4_value.anchor_point = (1.0, 0.5)
plus_4_value.anchored_position = (99, 40)
scale_group.append(plus_4_value)

chan_1_label = Label(FONT_0, text="grams", color=clue.BLUE)
chan_1_label.anchor_point = (1.0, 0)
chan_1_label.anchored_position = (80, 216)
scale_group.append(chan_1_label)

chan_2_label = Label(FONT_0, text="grams", color=clue.BLUE)
chan_2_label.anchor_point = (1.0, 0)
chan_2_label.anchored_position = (230, 216)
scale_group.append(chan_2_label)

chan_1_value = Label(FONT_0, text="0.0", color=clue.WHITE)
chan_1_value.anchor_point = (1.0, 0.5)
chan_1_value.anchored_position = (80, 200)
scale_group.append(chan_1_value)

chan_2_value = Label(FONT_0, text="0.0", color=clue.WHITE)
chan_2_value.anchor_point = (1.0, 0.5)
chan_2_value.anchored_position = (230, 200)
scale_group.append(chan_2_value)

# Define moveable bubble
indicator_group = displayio.Group()
chan_1_bubble = Circle(112, 200, 8, fill=clue.YELLOW, outline=clue.YELLOW, stroke=3)
indicator_group.append(chan_1_bubble)

chan_2_bubble = Circle(131, 200, 8, fill=clue.GREEN, outline=clue.GREEN, stroke=3)
indicator_group.append(chan_2_bubble)

scale_group.append(indicator_group)
display.show(scale_group)


def zero_channel():
    # Initiate internal calibration for current channel; return raw zero offset value
    # Use when scale is started, a new channel is selected, or to adjust for measurement drift
    # Remove weight and tare from load cell before executing
    print(
        "channel %1d calibrate.INTERNAL: %5s"
        % (nau7802.channel, nau7802.calibrate("INTERNAL"))
    )
    print(
        "channel %1d calibrate.OFFSET:   %5s"
        % (nau7802.channel, nau7802.calibrate("OFFSET"))
    )
    zero_offset = read(100)  # Read average of 100 samples to establish zero offset
    print("...channel zeroed")
    return zero_offset


def read(samples=100):
    # Read and average consecutive raw sample values; return average raw value
    sample_sum = 0
    sample_count = samples
    while sample_count > 0:
        if nau7802.available:
            sample_sum = sample_sum + nau7802.read()
            sample_count -= 1
    return int(sample_sum / samples)


# Instantiate and calibrate load cell inputs
print("*** Instantiate and calibrate load cells")
clue.pixel[0] = (16, 16, 0)  # Set status indicator to yellow
print("    enable NAU7802 digital and analog power: %5s" % (nau7802.enable(True)))

nau7802.gain = DEFAULT_GAIN  # Use default gain
nau7802.channel = 1  # Set to second channel
chan_1_zero = zero_channel()  # Re-calibrate and get raw zero offset value
nau7802.channel = 2  # Set to first channel
chan_2_zero = zero_channel()  # Re-calibrate and get raw zero offset value

clue.pixel[0] = (0, 16, 0)  # Set status indicator to green
clue.play_tone(1660, 0.15)
clue.play_tone(1440, 0.15)

### Main loop: Read sample, move bubble, and display values
while True:
    nau7802.channel = 1
    value = read(SAMPLE_AVG)
    chan_1_mass_gr = round((value - chan_1_zero) * CALIB_RATIO_1, 1)
    chan_1_mass_oz = round(chan_1_mass_gr * 0.03527, 2)
    chan_1_value.text = "%5.1f" % (chan_1_mass_gr)

    chan_1_bubble.y = int(map_range(chan_1_mass_gr, MIN_GR, MAX_GR, 240, 0)) - 8
    if chan_1_mass_gr > MAX_GR or chan_1_mass_gr < MIN_GR:
        chan_1_bubble.fill = clue.RED
    else:
        chan_1_bubble.fill = None

    nau7802.channel = 2
    value = read(SAMPLE_AVG)
    chan_2_mass_gr = round((value - chan_2_zero) * CALIB_RATIO_2, 1)
    chan_2_mass_oz = round(chan_2_mass_gr * 0.03527, 2)
    chan_2_value.text = "%5.1f" % (chan_2_mass_gr)

    chan_2_bubble.y = int(map_range(chan_2_mass_gr, MIN_GR, MAX_GR, 240, 0)) - 8
    if chan_2_mass_gr > MAX_GR or chan_2_mass_gr < MIN_GR:
        chan_2_bubble.fill = clue.RED
    else:
        chan_2_bubble.fill = None

    print("(%+5.1f, %+5.1f)" % (chan_1_mass_gr, chan_2_mass_gr))

    if clue.button_a:
        # Zero and recalibrate channel 1
        clue.play_tone(1660, 0.3)
        clue.pixel[0] = (16, 0, 0)
        chan_1_bubble.fill = clue.RED
        nau7802.channel = 1
        zero = zero_channel()
        while clue.button_b:
            time.sleep(0.1)
        chan_1_bubble.fill = None
        clue.pixel[0] = (0, 16, 0)
        clue.play_tone(1440, 0.5)

    if clue.button_b:
        # Zero and recalibrate channel 2
        clue.play_tone(1660, 0.3)
        clue.pixel[0] = (16, 0, 0)
        chan_2_bubble.fill = clue.RED
        nau7802.channel = 2
        zero = zero_channel()
        while clue.button_b:
            time.sleep(0.1)
        chan_2_bubble.fill = None
        clue.pixel[0] = (0, 16, 0)
        clue.play_tone(1440, 0.5)
