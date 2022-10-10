# SPDX-FileCopyrightText: 2020 Jeff Epler <https://unpythonic.net>
#
# SPDX-License-Identifier: Unlicense
# pylint: disable=redefined-builtin,wildcard-import,wrong-import-position,unused-wildcard-import,unused-import,broad-except,undefined-variable,used-before-assignment

try:
    from decimal import (
        Decimal,
        getcontext,
        setcontext,
        ExtendedContext,
        DivisionByZero,
        InvalidOperation,
        Context,
        localcontext,
    )
except ImportError:
    from jepler_udecimal import (
        Decimal,
        getcontext,
        setcontext,
        ExtendedContext,
        DivisionByZero,
        InvalidOperation,
        Context,
        localcontext,
    )

with localcontext():
    setcontext(ExtendedContext)
    print(Decimal(0))
    print(Decimal("1"))
    print(Decimal("-.0123"))
    print(Decimal(123456))
    print(Decimal("123.45e12345678"))
    print(Decimal("1.33") + Decimal("1.27"))
    print(Decimal("12.34") + Decimal("3.87") - Decimal("18.41"))
    dig = Decimal(1)
    print(dig / Decimal(3))
    getcontext().prec = 18
    print(dig / Decimal(3))
    print(dig.sqrt())
    print(Decimal(3).sqrt())
    print(Decimal(3) ** 123)
    inf = Decimal(1) / Decimal(0)
    print(inf)
    neginf = Decimal(-1) / Decimal(0)
    print(neginf)
    print(neginf + inf)
    print(neginf * inf)
    try:
        print(dig / 0)
    except Exception as e:
        print("Division by zero")
    getcontext().traps[DivisionByZero] = 1
    try:
        print(dig / 0)
    except Exception as e:
        print("Division by zero")
    c = Context()
    c.traps[InvalidOperation] = 0
    print(+c.flags[InvalidOperation])
    try:
        c.divide(Decimal(0), Decimal(0))
    except Exception as e:
        print("Division by zero")
    c.traps[InvalidOperation] = 1
    print(+c.flags[InvalidOperation])
    c.flags[InvalidOperation] = 0
    print(+c.flags[InvalidOperation])
    try:
        print(c.divide(Decimal(0), Decimal(0)))
    except Exception as e:
        print("Division by zero")
    print(+c.flags[InvalidOperation])
    try:
        print(c.divide(Decimal(0), Decimal(0)))
    except Exception as e:
        print("Division by zero")
    print(+c.flags[InvalidOperation])

import jepler_udecimal.utrig
from jepler_udecimal import Decimal

print(Decimal(".7").atan())
print(Decimal(".1").acos())
print(Decimal("-.1").asin())
print(Decimal(".4").tan())
print(Decimal(".5").cos())
print(Decimal(".6").sin())
print(Decimal("0").sin())
print(Decimal("360").sin())
print(Decimal("360e19").sin())
print(Decimal("NaN").cos())
print(Decimal("NaN").tan())
print(Decimal("NaN").sin())
try:
    print(Decimal("2").acos())
except Exception as e:
    print("exception")
try:
    print(Decimal("2").asin())
except Exception as e:
    print("exception")
print(Decimal("2").atan())
print(Decimal("1").asin())
print(Decimal("-1").asin())
print(Decimal(".5").asin())
print(Decimal("1").acos())
print(Decimal("-1").acos())
print(Decimal(".5").asin())
