# SPDX-FileCopyrightText: 2017 Scott Shawcroft, written for Adafruit Industries
# SPDX-FileCopyrightText: Copyright (c) 2022 Alec Delaney
#
# SPDX-License-Identifier: Unlicense

from circuitpython_functools import cache, clear_caches


class MathClass:
    def __init__(self, initial_value):
        self.value = initial_value

    @cache
    def add(self, a, b, *, c=1, d=2):
        return self.value + a + b + c + d

    @cache
    def subtract_from(self, input_value):
        return self.value - input_value


math_instance = MathClass(5)

print(math_instance.add(1, 1, c=2, d=3))
print(math_instance.add(1, 1, c=2, d=3))  # Repeat call, will use cached result
print(math_instance.add(1, 0, c=3, d=4))
print(math_instance.subtract_from(42))
print(math_instance.add(1, b=1, c=2, d=3))
print(math_instance.add(1, b=0, c=2, d=3))

# Clear all the caches so we don't use too much memory
clear_caches()

print(
    math_instance.add(1, 0, c=3, d=4)
)  # Cache was cleared, so this is caclulated again
print(math_instance.subtract_from(18))
