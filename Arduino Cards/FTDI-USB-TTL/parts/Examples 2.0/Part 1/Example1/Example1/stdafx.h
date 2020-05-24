// stdafx.h : include file for standard system include files,

#pragma once

#define OnWindows

#include <stdio.h>

#ifdef OnWindows
#include "targetver.h"
#include <objbase.h>
#include "..\..\ftd2xx.h"
#define Idle(X) Sleep(X)
#else
#define OnOSX
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include "../ftd2xx.h"
#define Idle(X) usleep(1000*X)
#endif
