from bbq10keyboard import BBQ10Keyboard
import board
import digitalio
import time

i2c = board.I2C()
kbd = BBQ10Keyboard(i2c)

card_detect = kbd.get_pin(1)
card_detect.switch_to_input(pull=digitalio.Pull.UP)

prev_value = card_detect.value

while True:
    if card_detect.value != prev_value:
        print('Card Detect: %d' % card_detect.value)

        prev_value = card_detect.value

    time.sleep(0.5)
