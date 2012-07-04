// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

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
#include <stdlib.h>
#include <signal.h>
#include "../ftd2xx.h"
#define Idle(X) usleep(1000*X)
#endif
