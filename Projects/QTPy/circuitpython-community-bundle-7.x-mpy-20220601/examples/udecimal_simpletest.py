# SPDX-FileCopyrightText: 2020 Jeff Epler <https://unpythonic.net>
#
# SPDX-License-Identifier: Unlicense

# pylint: disable=wrong-import-position,unused-import

from jepler_udecimal import Decimal as D
from jepler_udecimal import localcontext

d = D(".1")
e = D(".2")
f = D(".3")
g = D(".4")
# Prints 0 because all values involved are exact decimals
print(d + e + f + g - 1)

import jepler_udecimal.utrig

# Approximates pi to 78 decimal places
with localcontext() as ctx:
    ctx.prec = 78
    print(D("1").atan() * 4)
