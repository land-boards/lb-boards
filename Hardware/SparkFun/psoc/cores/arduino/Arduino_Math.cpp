#include <Arduino.h>

long map(long x, long in_min, long in_max, long out_min, long out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

long constrain(long x, long a, long b)
{
  if (x<a) return a;
  if (x>b) return b;
  return x;
}

long min (long x, long y)
{
  return x>y? y: x;
}

long max(long x, long y)
{
  return x>y? y: x;
}

